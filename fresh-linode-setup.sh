#!/bin/bash

# Fresh NodeBB Setup Script for Linode
# This script sets up NodeBB from scratch with all fixes applied

set -e  # Exit on error

echo "=== Fresh NodeBB Setup for Guaptalk Forum ==="
echo "This script will set up NodeBB with Docker on your Linode server"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# 1. Update system
print_status "Updating system packages..."
apt update && apt upgrade -y

# 2. Install required packages
print_status "Installing required packages..."
# Remove conflicting packages first
apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# Install Docker from official repository
print_status "Installing Docker from official repository..."
apt update
apt install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install other required packages
apt install -y git nginx certbot python3-certbot-nginx ufw

# Create docker-compose alias for compatibility
ln -sf /usr/libexec/docker/cli-plugins/docker-compose /usr/local/bin/docker-compose 2>/dev/null || true

# 3. Enable and start Docker
print_status "Enabling Docker..."
systemctl enable docker
systemctl start docker

# 4. Configure firewall
print_status "Configuring firewall..."
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 4567/tcp
echo "y" | ufw enable

# 5. Clean up any existing installation
print_status "Cleaning up any existing installation..."
cd /root
rm -rf guaptalk-forum
docker stop guaptalk_app guaptalk_db guaptalk_redis 2>/dev/null || true
docker rm guaptalk_app guaptalk_db guaptalk_redis 2>/dev/null || true
docker volume rm guaptalk_nodebb-data guaptalk_nodebb-uploads guaptalk_nodebb-config 2>/dev/null || true

# 6. Clone the repository
print_status "Cloning repository..."
git clone https://github.com/webdeeva/guaptalk-forum.git
cd guaptalk-forum

# 7. Apply the composer fix before building
print_status "Applying composer module fix..."
cat > public/src/modules/topicThumbs.js << 'ENDOFFILE'
'use strict';

define('topicThumbs', [
	'api', 'bootbox', 'alerts', 'uploader', 'benchpress', 'translator', 'composer', 'jquery-ui/widgets/sortable',
], function (api, bootbox, alerts, uploader, Benchpress, translator, composer) {
	const Thumbs = {};

	Thumbs.get = id => api.get(\`/topics/\${id}/thumbs\`, { thumbsOnly: 1 });

	Thumbs.getByPid = pid => api.get(\`/posts/\${encodeURIComponent(pid)}\`, {}).then(post => Thumbs.get(post.tid));

	Thumbs.delete = (id, path) => api.del(\`/topics/\${id}/thumbs\`, {
		path: path,
	});

	Thumbs.deleteAll = (id) => {
		Thumbs.get(id).then((thumbs) => {
			Promise.all(thumbs.map(thumb => Thumbs.delete(id, thumb.url)));
		});
	};

	Thumbs.upload = id => new Promise((resolve) => {
		uploader.show({
			title: '[[topic:composer.thumb-title]]',
			method: 'put',
			route: config.relative_path + \`/api/v3/topics/\${id}/thumbs\`,
		}, function (url) {
			resolve(url);
		});
	});

	Thumbs.modal = {};

	Thumbs.modal.open = function (payload) {
		const { id, pid } = payload;
		let { modal } = payload;
		let numThumbs;

		return new Promise((resolve) => {
			Promise.all([
				Thumbs.get(id),
				pid ? Thumbs.getByPid(pid) : [],
			]).then(results => new Promise((resolve) => {
				const thumbs = results.reduce((memo, cur) => memo.concat(cur));
				numThumbs = thumbs.length;

				resolve(thumbs);
			})).then(thumbs => Benchpress.render('modals/topic-thumbs', { thumbs })).then((html) => {
				if (modal) {
					translator.translate(html, function (translated) {
						modal.find('.bootbox-body').html(translated);
						Thumbs.modal.handleSort({ modal, numThumbs });
					});
				} else {
					modal = bootbox.dialog({
						title: '[[modules:thumbs.modal.title]]',
						message: html,
						onEscape: true,
						backdrop: true,
						buttons: {
							add: {
								label: '<i class="fa fa-plus"></i> [[modules:thumbs.modal.add]]',
								className: 'btn-success',
								callback: () => {
									Thumbs.upload(id).then(() => {
										Thumbs.modal.open({ ...payload, modal });
										composer.updateThumbCount(id, \$(\`[component="composer"][data-uuid="\${id}"]\`));
										resolve();
									});
									return false;
								},
							},
							close: {
								label: '[[global:close]]',
								className: 'btn-primary',
							},
						},
					});
					Thumbs.modal.handleDelete({ ...payload, modal });
					Thumbs.modal.handleSort({ modal, numThumbs });
				}
			});
		});
	};

	Thumbs.modal.handleDelete = (payload) => {
		const modalEl = payload.modal.get(0);
		const { id: uuid } = payload;
		modalEl.addEventListener('click', (ev) => {
			if (ev.target.closest('button[data-action="remove"]')) {
				bootbox.confirm('[[modules:thumbs.modal.confirm-remove]]', (ok) => {
					if (!ok) {
						return;
					}

					const id = ev.target.closest('[data-id]').getAttribute('data-id');
					const path = ev.target.closest('[data-path]').getAttribute('data-path');
					api.del(\`/topics/\${id}/thumbs\`, {
						path: path,
					}).then(() => {
						Thumbs.modal.open(payload);
						composer.updateThumbCount(uuid, \$(\`[component="composer"][data-uuid="\${uuid}"]\`));
					}).catch(alerts.error);
				});
			}
		});
	};

	Thumbs.modal.handleSort = ({ modal, numThumbs }) => {
		if (numThumbs > 1) {
			const selectorEl = modal.find('.topic-thumbs-modal');
			selectorEl.sortable({
				items: '[data-id]',
			});
			selectorEl.on('sortupdate', Thumbs.modal.handleSortChange);
		}
	};

	Thumbs.modal.handleSortChange = (ev, ui) => {
		const items = ui.item.get(0).parentNode.querySelectorAll('[data-id]');
		Array.from(items).forEach((el, order) => {
			const id = el.getAttribute('data-id');
			let path = el.getAttribute('data-path');
			path = path.replace(new RegExp(\`^\${config.upload_url}\`), '');

			api.put(\`/topics/\${id}/thumbs/order\`, { path, order }).catch(alerts.error);
		});
	};

	return Thumbs;
});
ENDOFFILE

# 8. Get server IP
SERVER_IP=$(curl -s http://checkip.amazonaws.com)
print_status "Server IP: $SERVER_IP"

# 9. Update config.json with correct IP
print_status "Updating config.json..."
sed -i "s/\"url\": \".*\"/\"url\": \"http:\/\/$SERVER_IP:4567\"/" config.json

# 10. Create necessary directories
print_status "Creating directories..."
mkdir -p logs

# 11. Build and start containers
print_status "Building and starting Docker containers..."
docker-compose down 2>/dev/null || true
docker-compose up -d

# 12. Wait for database to be ready
print_status "Waiting for database to initialize..."
sleep 30

# 13. Check if NodeBB needs setup
print_status "Checking NodeBB setup status..."
if ! docker exec guaptalk_app test -f /usr/src/app/config.json; then
    print_status "Running NodeBB setup..."
    docker exec guaptalk_app ./nodebb setup --config=/opt/config/setup.json
fi

# 14. Build NodeBB with the fixed file
print_status "Building NodeBB..."
docker exec guaptalk_app ./nodebb build

# 15. Restart container to apply all changes
print_status "Restarting NodeBB..."
docker restart guaptalk_app

# 16. Wait for NodeBB to start
print_status "Waiting for NodeBB to start..."
sleep 30

# 17. Configure Nginx
print_status "Configuring Nginx..."
cat > /etc/nginx/sites-available/nodebb << NGINX_CONF
server {
    listen 80;
    server_name $SERVER_IP;

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://127.0.0.1:4567;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
NGINX_CONF

ln -sf /etc/nginx/sites-available/nodebb /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t && systemctl restart nginx

# 18. Create health check script
print_status "Creating health check script..."
cat > check-forum-health.sh << 'HEALTH_CHECK'
#!/bin/bash

echo "=== NodeBB Health Check ==="

# Check Docker containers
echo -e "\n1. Docker Containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# Check NodeBB logs for errors
echo -e "\n2. Recent NodeBB logs:"
docker logs --tail 20 guaptalk_app | grep -E "(error|Error|ERROR|started|listening)" || echo "No errors found"

# Check if NodeBB is responding
echo -e "\n3. NodeBB Response:"
curl -s -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost:4567

# Check Nginx status
echo -e "\n4. Nginx Status:"
systemctl status nginx --no-pager | grep Active

# Check disk space
echo -e "\n5. Disk Space:"
df -h | grep -E "/$|/var"

echo -e "\n=== Health check complete ==="
HEALTH_CHECK
chmod +x check-forum-health.sh

# 19. Create backup script
print_status "Creating backup script..."
cat > backup-forum.sh << 'BACKUP_SCRIPT'
#!/bin/bash

BACKUP_DIR="/root/backups"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR

echo "Creating backup..."
docker exec guaptalk_db mongodump --out /tmp/backup
docker cp guaptalk_db:/tmp/backup $BACKUP_DIR/mongodb_$DATE
docker exec guaptalk_app tar -czf /tmp/uploads.tar.gz /usr/src/app/public/uploads
docker cp guaptalk_app:/tmp/uploads.tar.gz $BACKUP_DIR/uploads_$DATE.tar.gz

echo "Backup completed: $BACKUP_DIR"
ls -la $BACKUP_DIR
BACKUP_SCRIPT
chmod +x backup-forum.sh

# 20. Final checks
print_status "Running final checks..."
./check-forum-health.sh

echo ""
print_status "=== Setup Complete ==="
echo ""
echo "Forum URL: http://$SERVER_IP"
echo "Admin Setup URL: http://$SERVER_IP/admin"
echo ""
echo "Default admin credentials (if fresh setup):"
echo "Username: admin"
echo "Password: (as configured in setup.json)"
echo ""
echo "Useful commands:"
echo "  ./check-forum-health.sh - Check forum health"
echo "  ./backup-forum.sh - Create backup"
echo "  docker logs -f guaptalk_app - View logs"
echo "  docker-compose restart - Restart all services"
echo ""
print_warning "Remember to:"
echo "1. Set up SSL with: certbot --nginx -d yourdomain.com"
echo "2. Configure DNS to point to $SERVER_IP"
echo "3. Update the URL in Admin > Settings after domain setup"