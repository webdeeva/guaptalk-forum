# Fresh Setup Instructions for Guaptalk Forum on Linode

## Prerequisites
- Fresh Ubuntu 20.04 or 22.04 Linode instance
- Root access to the server
- Domain name (optional, but recommended)

## Quick Setup

1. **SSH into your Linode server:**
   ```bash
   ssh root@YOUR_SERVER_IP
   ```

2. **Download and run the setup script:**
   ```bash
   wget https://raw.githubusercontent.com/webdeeva/guaptalk-forum/master/fresh-linode-setup.sh
   chmod +x fresh-linode-setup.sh
   ./fresh-linode-setup.sh
   ```

3. **Wait for completion** (approximately 5-10 minutes)

## What the Script Does

1. **System Setup:**
   - Updates system packages
   - Installs Docker, Docker Compose, Nginx, and other dependencies
   - Configures firewall (UFW)

2. **NodeBB Installation:**
   - Cleans any existing installation
   - Clones the repository
   - Applies the composer module fix
   - Sets up Docker containers (NodeBB, MongoDB, Redis)
   - Builds NodeBB with all assets

3. **Web Server Configuration:**
   - Configures Nginx as reverse proxy
   - Sets up proper headers for WebSocket support

4. **Creates Utility Scripts:**
   - `check-forum-health.sh` - Health monitoring
   - `backup-forum.sh` - Backup creation

## Post-Installation Steps

### 1. Access Your Forum
- Open your browser and go to: `http://YOUR_SERVER_IP`
- Admin panel: `http://YOUR_SERVER_IP/admin`

### 2. Set Up SSL (HTTPS)
If you have a domain:
```bash
certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

### 3. Update Forum URL
After setting up domain and SSL:
1. Go to Admin Panel → Settings
2. Update the URL to `https://yourdomain.com`
3. Restart NodeBB: `docker-compose restart`

## Maintenance Commands

**View logs:**
```bash
docker logs -f guaptalk_app
```

**Restart services:**
```bash
docker-compose restart
```

**Create backup:**
```bash
./backup-forum.sh
```

**Check health:**
```bash
./check-forum-health.sh
```

## Troubleshooting

**If the forum doesn't load:**
1. Check container status: `docker ps`
2. Check logs: `docker logs guaptalk_app`
3. Verify Nginx: `systemctl status nginx`
4. Check firewall: `ufw status`

**If build fails:**
1. Check the composer fix was applied: `docker exec guaptalk_app cat /usr/src/app/public/src/modules/topicThumbs.js | head -5`
2. Rebuild: `docker exec guaptalk_app ./nodebb build`
3. Restart: `docker restart guaptalk_app`

## Clean Restart

If you need to start over:
```bash
docker-compose down
docker volume rm guaptalk_nodebb-data guaptalk_nodebb-uploads guaptalk_nodebb-config
./fresh-linode-setup.sh
```