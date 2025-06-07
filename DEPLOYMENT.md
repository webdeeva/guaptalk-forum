# Guaptalk Forum Deployment Guide

## Quick Deployment Options

### Option 1: Railway.app (Recommended - Easiest)

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial Guaptalk forum"
   git remote add origin YOUR_GITHUB_REPO
   git push -u origin main
   ```

2. **Deploy on Railway**
   - Go to [railway.app](https://railway.app)
   - Click "New Project" → "Deploy from GitHub"
   - Select your repository
   - Add Redis service: "New" → "Database" → "Redis"
   - Railway will auto-detect NodeBB and configure it

3. **Environment Variables** (Railway will prompt for these):
   ```
   NODE_ENV=production
   url=https://YOUR_APP.up.railway.app
   port=4567
   secret=GENERATE_A_RANDOM_SECRET
   redis__host=${{REDIS_HOST}}
   redis__port=${{REDIS_PORT}}
   redis__password=${{REDIS_PASSWORD}}
   ```

**Cost**: ~$5-20/month based on usage

### Option 2: DigitalOcean App Platform

1. **Prepare Database**
   - Create a Managed Redis database ($10/month)
   - Or use the Redis add-on in App Platform

2. **Deploy App**
   ```bash
   # Install DO CLI
   brew install doctl
   
   # Create app
   doctl apps create --spec .do/app.yaml
   ```

3. **App Spec** (.do/app.yaml):
   ```yaml
   name: guaptalk-forum
   region: nyc
   services:
   - build_command: npm install && ./nodebb build
     environment_slug: node-js
     github:
       branch: main
       deploy_on_push: true
       repo: YOUR_GITHUB_REPO
     http_port: 4567
     instance_count: 1
     instance_size_slug: basic-xs
     name: nodebb
     run_command: ./nodebb start
     source_dir: /
   databases:
   - engine: REDIS
     name: redis-db
     production: false
   ```

**Cost**: $12/month (app) + $10/month (Redis)

### Option 3: VPS with Docker

1. **Get a VPS** (Hetzner, Linode, or DigitalOcean Droplet)
   - Minimum: 2GB RAM, 1 CPU
   - Ubuntu 22.04 recommended

2. **Install Docker**
   ```bash
   curl -fsSL https://get.docker.com | sh
   sudo usermod -aG docker $USER
   ```

3. **Deploy with Docker Compose**
   ```bash
   # Clone your repo
   git clone YOUR_REPO
   cd guaptalk/forum
   
   # Create production config
   cp config.json config.prod.json
   # Edit config.prod.json with your domain
   
   # Start services
   docker-compose up -d
   ```

4. **Setup Nginx & SSL**
   ```bash
   sudo apt install nginx certbot python3-certbot-nginx
   
   # Create nginx config
   sudo nano /etc/nginx/sites-available/guaptalk
   ```

   ```nginx
   server {
       listen 80;
       server_name forum.guaptalk.com;
       
       location / {
           proxy_pass http://localhost:4567;
           proxy_http_version 1.1;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection 'upgrade';
           proxy_set_header Host $host;
           proxy_cache_bypass $http_upgrade;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }
   }
   ```

   ```bash
   # Enable site
   sudo ln -s /etc/nginx/sites-available/guaptalk /etc/nginx/sites-enabled/
   sudo nginx -t
   sudo systemctl restart nginx
   
   # Get SSL certificate
   sudo certbot --nginx -d forum.guaptalk.com
   ```

**Cost**: $5-10/month

### Option 4: Render.com

1. **Create Web Service**
   - Connect GitHub repo
   - Build Command: `npm install && ./nodebb build`
   - Start Command: `./nodebb start`

2. **Add Redis**
   - Create new Redis instance
   - Connect to web service

3. **Environment Variables**
   ```
   NODE_ENV=production
   url=https://YOUR_APP.onrender.com
   redis__host=YOUR_REDIS_HOST
   redis__port=6379
   redis__password=YOUR_REDIS_PASSWORD
   ```

**Cost**: Free tier (with cold starts) or $7/month + Redis

## Production Checklist

### Before Going Live:

1. **Security**
   ```bash
   # Generate strong secret
   openssl rand -base64 32
   
   # Update config.json
   "secret": "YOUR_GENERATED_SECRET"
   ```

2. **Backups**
   ```bash
   # Add to crontab
   0 3 * * * docker exec forum_redis_1 redis-cli BGSAVE
   0 4 * * * tar -czf backup-$(date +%Y%m%d).tar.gz uploads/ redis-data/
   ```

3. **Performance**
   - Enable Redis persistence
   - Configure CloudFlare (free CDN)
   - Set up monitoring (UptimeRobot)

4. **Email (for notifications)**
   - Use SendGrid, Mailgun, or AWS SES
   - Configure in Admin Panel → Settings → Email

5. **Admin Account**
   - Change default admin password immediately
   - Enable 2FA

### Scaling Considerations:

- **Small (< 1000 users)**: Any option above
- **Medium (1000-10000 users)**: VPS or DigitalOcean App Platform
- **Large (10000+ users)**: 
  - Multiple NodeBB instances
  - Redis Cluster
  - CDN for assets
  - Consider managed hosting

## Quick Start Commands

```bash
# Clone and prepare
git clone YOUR_REPO
cd guaptalk/forum

# For Railway
railway up

# For Docker
docker-compose up -d

# For manual VPS
./nodebb setup
./nodebb build
./nodebb start
```

## Support

- NodeBB Docs: https://docs.nodebb.org
- Community: https://community.nodebb.org
- Issues: Report in your GitHub repo