# Railway Deployment - Setup Summary

Your Conference Lead Platform is now ready for Railway deployment! 🚂

## What Was Configured

### 1. **Backend Configuration** (FastAPI/Python)
   - ✅ `backend/nixpacks.toml` - Railway build configuration
   - ✅ `backend/Procfile` - Process definition
   - ✅ Root directory: `/backend`
   - ✅ Start command: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`

### 2. **Frontend Configuration** (React/Vite)
   - ✅ `frontend/nixpacks.toml` - Railway build configuration
   - ✅ `frontend/package.json` - Updated preview script for Railway
   - ✅ `frontend/vite.config.ts` - Added preview port configuration
   - ✅ `frontend/.env.example` - Environment variable template
   - ✅ Root directory: `/frontend`
   - ✅ Build command: `npm run build`
   - ✅ Start command: `npm run preview`

### 3. **Project Configuration**
   - ✅ `railway.json` - Main Railway config
   - ✅ `railway.toml` - Monorepo config
   - ✅ `.railwayignore` - Files to exclude from deployment
   - ✅ `.env.example` - Environment variables template

### 4. **Documentation**
   - ✅ `DEPLOY.md` - Comprehensive deployment guide
   - ✅ `DEPLOYMENT_CHECKLIST.md` - Step-by-step checklist
   - ✅ `README.md` - Project overview and quick start
   - ✅ `railway-setup.sh` - Automated setup script

## Quick Deploy (3 Options)

### Option A: Railway Dashboard (Easiest)
1. Go to [railway.app](https://railway.app)
2. Create new project
3. Add two services (backend & frontend)
4. Set environment variables
5. Deploy!

**Follow**: `DEPLOYMENT_CHECKLIST.md` for step-by-step instructions

### Option B: Railway CLI
```bash
./railway-setup.sh
```
Then follow the on-screen instructions.

### Option C: GitHub Auto-Deploy
1. Push code to GitHub
2. Connect repo to Railway
3. Railway auto-deploys on every push

## Required Environment Variables

### Backend Service
```bash
OPENAI_API_KEY=sk-proj-...           # Your OpenAI API key
DATABASE_URL=sqlite:///./conference_leads.db
FRONTEND_URL=https://your-frontend.railway.app
```

### Frontend Service
```bash
VITE_API_URL=https://your-backend.railway.app
```

## Architecture

```
Railway Project
├── Backend Service
│   ├── Root: /backend
│   ├── Port: Auto-assigned by Railway
│   ├── Health: /health
│   └── API Docs: /docs
│
└── Frontend Service
    ├── Root: /frontend
    ├── Port: Auto-assigned by Railway
    └── Health: /health.html
```

## Cost Estimate

Railway Pricing:
- **Hobby Plan**: $5/month + usage
- **Free Trial**: $5 credit for new users
- **Estimated Cost**: ~$5-15/month for this setup

Breakdown:
- Backend service: ~$3-8/month
- Frontend service: ~$2-5/month
- Database (SQLite): Free (or add PostgreSQL: ~$5/month)

## Testing Your Deployment

After deployment, verify:

1. **Backend Health**
   ```
   https://your-backend.railway.app/health
   ```
   Should return: `{"status": "ok", "service": "Conference Lead Platform API"}`

2. **Backend API Docs**
   ```
   https://your-backend.railway.app/docs
   ```
   Should show FastAPI Swagger UI

3. **Frontend**
   ```
   https://your-frontend.railway.app
   ```
   Should load the application

4. **Frontend Health**
   ```
   https://your-frontend.railway.app/health.html
   ```
   Should show frontend and backend status

## Next Steps

1. **Deploy Now**: Follow `DEPLOYMENT_CHECKLIST.md`
2. **Production Ready**: 
   - Add PostgreSQL database
   - Set up custom domains
   - Configure monitoring
3. **CI/CD**: Connect GitHub for auto-deploy

## Support & Resources

- **Detailed Guide**: `DEPLOY.md`
- **Checklist**: `DEPLOYMENT_CHECKLIST.md`
- **Railway Docs**: https://docs.railway.app
- **Railway Discord**: https://discord.gg/railway

## File Structure

```
Square-pants/
├── backend/
│   ├── nixpacks.toml      # Railway build config
│   ├── Procfile           # Process definition
│   ├── requirements.txt   # Python dependencies
│   └── app/               # FastAPI application
├── frontend/
│   ├── nixpacks.toml      # Railway build config
│   ├── .env.example       # Environment template
│   ├── package.json       # Node dependencies (updated)
│   ├── vite.config.ts     # Vite config (updated)
│   └── src/               # React application
├── railway.json           # Railway config
├── railway.toml           # Monorepo config
├── .railwayignore         # Ignore file
├── .env.example           # Root env template
├── DEPLOY.md              # Full deployment guide
├── DEPLOYMENT_CHECKLIST.md # Step-by-step checklist
├── README.md              # Project overview
└── railway-setup.sh       # Setup script
```

---

**Ready to deploy?** Start with `DEPLOYMENT_CHECKLIST.md` ✅
