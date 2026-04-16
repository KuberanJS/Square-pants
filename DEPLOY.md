# Railway Deployment Guide

This guide will help you deploy the Conference Lead Platform to Railway.

## Quick Start

### Option 1: Deploy via Railway Dashboard (Recommended)

1. **Create Railway Account**
   - Go to [railway.app](https://railway.app) and sign up

2. **Create New Project**
   - Click "New Project" → "Empty Project"
   - Give it a name (e.g., "conference-lead-platform")

3. **Deploy Backend Service**
   - Click "New Service" → "GitHub Repo" (or "Empty Service" if not using GitHub)
   - If using GitHub: Connect your repo and select it
   - Configure the service:
     - **Name**: `backend`
     - **Root Directory**: `/backend`
     - **Build Command**: Leave empty (Nixpacks will auto-detect)
     - **Start Command**: Leave empty (will use nixpacks.toml)
   
   - Set Environment Variables:
     ```
     OPENAI_API_KEY=your-openai-api-key-here
     DATABASE_URL=sqlite:///./conference_leads.db
     FRONTEND_URL=https://your-frontend.railway.app
     ```
     (Note: Update `FRONTEND_URL` after deploying frontend)

4. **Deploy Frontend Service**
   - In the same project, click "New Service"
   - Configure the service:
     - **Name**: `frontend`
     - **Root Directory**: `/frontend`
   
   - Set Environment Variables:
     ```
     VITE_API_URL=https://your-backend.railway.app
     ```
     (Use the backend URL from step 3)

5. **Update CORS Settings**
   - Go back to backend service settings
   - Update `FRONTEND_URL` environment variable with your actual frontend URL
   - Redeploy backend service

6. **Generate Public URLs**
   - Click on each service → Settings → Networking
   - Click "Generate Domain" to get public URLs

### Option 2: Deploy via Railway CLI

1. **Install Railway CLI**
   ```bash
   npm i -g @railway/cli
   ```

2. **Login**
   ```bash
   railway login
   ```

3. **Initialize Project**
   ```bash
   railway init
   ```

4. **Link to Project** (if already created in dashboard)
   ```bash
   railway link
   ```

5. **Deploy Backend**
   ```bash
   cd backend
   railway up
   ```
   
   Then set environment variables in Railway dashboard.

6. **Deploy Frontend**
   ```bash
   cd ../frontend
   railway up
   ```
   
   Set `VITE_API_URL` in Railway dashboard.

## Environment Variables Reference

### Backend Service

| Variable | Description | Example |
|----------|-------------|---------|
| `OPENAI_API_KEY` | OpenAI API key for AI features | `sk-proj-...` |
| `DATABASE_URL` | Database connection string | `sqlite:///./conference_leads.db` |
| `FRONTEND_URL` | Frontend URL for CORS | `https://your-frontend.railway.app` |
| `PORT` | Server port (auto-set by Railway) | `8000` |

### Frontend Service

| Variable | Description | Example |
|----------|-------------|---------|
| `VITE_API_URL` | Backend API URL | `https://your-backend.railway.app` |
| `PORT` | Server port (auto-set by Railway) | `3000` |

## Using PostgreSQL (Recommended for Production)

SQLite is fine for testing, but for production use Railway's PostgreSQL:

1. **Add PostgreSQL to Project**
   - In Railway dashboard, click "New" → "Database" → "PostgreSQL"
   - Railway will automatically create `DATABASE_URL` variable

2. **Link to Backend Service**
   - Click on backend service → Variables
   - Reference the PostgreSQL connection: `${{Postgres.DATABASE_URL}}`

3. **Update Backend Code** (if needed)
   - The current setup uses SQLModel which supports PostgreSQL
   - You may need to install `psycopg2-binary`:
     ```bash
     # Add to backend/requirements.txt
     psycopg2-binary==2.9.9
     ```

## Custom Domains

1. Go to Service → Settings → Networking
2. Click "Custom Domain"
3. Add your domain and configure DNS:
   ```
   CNAME record: your-domain.com → your-app.railway.app
   ```

## Monitoring & Logs

- **View Logs**: Click on service → Deployments → Click deployment → View logs
- **Metrics**: Click on service → Metrics tab
- **Health Checks**: Backend has `/health` endpoint for monitoring

## Troubleshooting

### Build Fails

1. Check build logs in Railway dashboard
2. Verify `nixpacks.toml` configuration
3. Ensure all dependencies are in `requirements.txt` or `package.json`

### Backend Won't Start

1. Check environment variables are set correctly
2. Verify `OPENAI_API_KEY` is valid
3. Check logs for Python errors

### Frontend Can't Connect to Backend

1. Verify `VITE_API_URL` is set correctly (should be your Railway backend URL)
2. Ensure backend `FRONTEND_URL` includes your frontend domain for CORS
3. Check that both services are running

### CORS Errors

1. Update backend's `FRONTEND_URL` environment variable
2. Restart backend service
3. Clear browser cache

## Cost Optimization

Railway offers:
- **Hobby Plan**: $5/month + usage
- **Free Trial**: $5 credit for new accounts

Tips:
- Use 1 backend + 1 frontend service (2 services total)
- Start with SQLite, upgrade to PostgreSQL only if needed
- Monitor usage in Railway dashboard

## CI/CD Setup

Railway automatically deploys when you push to your GitHub repo (if connected).

To configure:
1. Connect GitHub repo in Railway dashboard
2. Select branch to deploy (usually `main`)
3. Enable auto-deploy in service settings

## Backup & Data

For SQLite:
- Data persists in Railway volumes
- Download database: `railway run bash`, then `cat conference_leads.db > backup.db`

For PostgreSQL:
- Use Railway's backup features
- Or use `pg_dump` via Railway CLI

## Support

- Railway Docs: https://docs.railway.app
- Railway Discord: https://discord.gg/railway
- Railway Support: help@railway.app
