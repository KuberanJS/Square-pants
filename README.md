# Conference Lead Generation Platform

A full-stack B2B conference lead generation and management platform.

## Tech Stack

- **Backend**: FastAPI (Python), SQLModel, SQLite
- **Frontend**: React, TypeScript, Vite, TailwindCSS

## Deployment to Railway

This project is configured for Railway deployment with separate services for backend and frontend.

### Prerequisites

1. Install Railway CLI:
   ```bash
   npm i -g @railway/cli
   ```

2. Login to Railway:
   ```bash
   railway login
   ```

### Deploy Steps

1. **Create a new Railway project**:
   ```bash
   railway init
   ```

2. **Deploy Backend Service**:
   ```bash
   cd backend
   railway up
   ```
   
   After deployment, set environment variables in Railway dashboard:
   - `OPENAI_API_KEY`: Your OpenAI API key
   - `DATABASE_URL`: `sqlite:///./conference_leads.db` (or use Railway PostgreSQL)
   - `FRONTEND_URL`: Your frontend Railway URL (add after frontend deployment)
   - `PORT`: Railway will set this automatically

3. **Deploy Frontend Service**:
   
   In Railway dashboard:
   - Create a new service in the same project
   - Connect your GitHub repo (or use Railway CLI)
   - Set root directory to `/frontend`
   - Set environment variable:
     - `VITE_API_URL`: Your backend Railway URL from step 2
   
   Or via CLI:
   ```bash
   cd frontend
   railway up
   ```

4. **Update CORS Settings**:
   
   After both services are deployed, update the backend's `FRONTEND_URL` environment variable with your actual frontend URL.

### Using Railway PostgreSQL (Recommended)

Instead of SQLite, you can use Railway's PostgreSQL:

1. Add PostgreSQL to your Railway project
2. Railway will automatically set `DATABASE_URL`
3. Update `backend/app/database.py` if needed for PostgreSQL compatibility

### Environment Variables

**Backend** (set in Railway dashboard for backend service):
- `OPENAI_API_KEY`: Required for AI features
- `DATABASE_URL`: Database connection string
- `FRONTEND_URL`: Your frontend URL for CORS
- `PORT`: Auto-set by Railway

**Frontend** (set in Railway dashboard for frontend service):
- `VITE_API_URL`: Your backend API URL
- `PORT`: Auto-set by Railway

### Custom Domains

Add custom domains in Railway dashboard under Settings → Domains for each service.

## Local Development

1. **Backend**:
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   cp .env.example .env  # Edit with your values
   uvicorn app.main:app --reload --port 8000
   ```

2. **Frontend**:
   ```bash
   cd frontend
   npm install
   cp .env.example .env  # Edit with your backend URL
   npm run dev
   ```

3. **Or use the start script**:
   ```bash
   ./start.sh
   ```

## API Documentation

Once deployed, visit `https://your-backend-url.railway.app/docs` for interactive API documentation.

## Features

- Event management
- Prospect tracking
- AI-powered lead enrichment
- Outreach campaign management
- Follow-up scheduling
- Analytics and reporting
- Offline-first PWA support
