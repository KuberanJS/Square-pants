#!/bin/bash
set -e

echo "🚂 Railway Deployment Setup for Conference Lead Platform"
echo "=========================================================="
echo ""

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found"
    echo "📦 Installing Railway CLI..."
    npm install -g @railway/cli
    echo "✅ Railway CLI installed"
else
    echo "✅ Railway CLI found"
fi

echo ""
echo "🔐 Logging into Railway..."
railway login

echo ""
echo "📋 Next steps:"
echo ""
echo "1. Create a new project:"
echo "   railway init"
echo ""
echo "2. Deploy backend:"
echo "   cd backend && railway up"
echo ""
echo "3. Set backend environment variables in Railway dashboard:"
echo "   - OPENAI_API_KEY=sk-..."
echo "   - DATABASE_URL=sqlite:///./conference_leads.db"
echo "   - FRONTEND_URL=https://your-frontend.railway.app"
echo ""
echo "4. Deploy frontend:"
echo "   cd ../frontend && railway up"
echo ""
echo "5. Set frontend environment variable in Railway dashboard:"
echo "   - VITE_API_URL=https://your-backend.railway.app"
echo ""
echo "6. Update backend FRONTEND_URL with actual frontend URL"
echo ""
echo "📚 For detailed instructions, see DEPLOY.md"
echo "✅ For a step-by-step checklist, see DEPLOYMENT_CHECKLIST.md"
