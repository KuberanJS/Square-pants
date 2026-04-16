# Railway Deployment Checklist

Follow this checklist to deploy your Conference Lead Platform to Railway.

## Pre-Deployment

- [ ] Have a Railway account ([railway.app](https://railway.app))
- [ ] Have your OpenAI API key ready
- [ ] Code is pushed to GitHub (optional, but recommended)

## Backend Deployment

- [ ] Create new Railway project
- [ ] Add backend service
  - [ ] Set root directory to `/backend`
  - [ ] Connect to GitHub repo (or deploy from CLI)
- [ ] Set environment variables:
  - [ ] `OPENAI_API_KEY` = `sk-proj-...` (your actual key)
  - [ ] `DATABASE_URL` = `sqlite:///./conference_leads.db`
  - [ ] `FRONTEND_URL` = `http://localhost:5173` (temporarily, update after frontend deploy)
- [ ] Deploy backend service
- [ ] Note backend URL: `https://____________.railway.app`
- [ ] Test backend health: Visit `https://your-backend.railway.app/health`
- [ ] Test API docs: Visit `https://your-backend.railway.app/docs`

## Frontend Deployment

- [ ] Add frontend service to same project
  - [ ] Set root directory to `/frontend`
  - [ ] Connect to GitHub repo (or deploy from CLI)
- [ ] Set environment variables:
  - [ ] `VITE_API_URL` = `https://your-backend.railway.app` (use URL from above)
- [ ] Deploy frontend service
- [ ] Note frontend URL: `https://____________.railway.app`
- [ ] Test frontend: Visit your frontend URL

## Post-Deployment Configuration

- [ ] Update backend `FRONTEND_URL`:
  - [ ] Go to backend service → Variables
  - [ ] Update `FRONTEND_URL` = `https://your-frontend.railway.app`
  - [ ] Redeploy backend (should happen automatically)
- [ ] Test CORS: Open frontend, try to load data
- [ ] Generate custom domains (optional):
  - [ ] Backend: Settings → Networking → Generate Domain
  - [ ] Frontend: Settings → Networking → Generate Domain

## Testing

- [ ] Frontend loads without errors
- [ ] Can create a new event
- [ ] Can import prospects (upload CSV)
- [ ] AI features work (requires valid OpenAI key)
- [ ] Navigation works
- [ ] No CORS errors in browser console

## Optional Upgrades

- [ ] Add PostgreSQL database
  - [ ] Click "New" → "Database" → "PostgreSQL"
  - [ ] Update backend `DATABASE_URL` to reference PostgreSQL
  - [ ] Add `psycopg2-binary==2.9.9` to `requirements.txt`
  - [ ] Redeploy backend
- [ ] Set up custom domains
- [ ] Configure GitHub auto-deploy
- [ ] Set up monitoring/alerts

## Troubleshooting

### If backend won't start:
1. Check logs in Railway dashboard
2. Verify all environment variables are set
3. Verify OpenAI API key is valid

### If frontend shows CORS errors:
1. Verify backend `FRONTEND_URL` matches your frontend Railway URL
2. Redeploy backend
3. Hard refresh browser (Cmd/Ctrl + Shift + R)

### If frontend can't connect to backend:
1. Verify `VITE_API_URL` points to correct backend URL
2. Check backend is running (visit `/health` endpoint)
3. Check browser console for errors

## Quick URLs Reference

- **Railway Dashboard**: https://railway.app/dashboard
- **Backend URL**: `https://____________.railway.app`
- **Frontend URL**: `https://____________.railway.app`
- **Backend API Docs**: `https://____________.railway.app/docs`
- **Backend Health**: `https://____________.railway.app/health`

## Support

- Full guide: See `DEPLOY.md`
- Railway Docs: https://docs.railway.app
- Issues: Create an issue in your repo
