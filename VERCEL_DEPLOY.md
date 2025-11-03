# Deploy to Vercel - Quick Guide

## 🚀 Option 1: Using Vercel CLI (Recommended)

### Step 1: Install Vercel CLI
```bash
npm install -g vercel
```

### Step 2: Login to Vercel
```bash
vercel login
```

### Step 3: Deploy from Root Directory
```bash
# Make sure you're in sagar_portfolio folder
cd C:\Users\PRADIP\Documents\sagar\sagar_portfolio

# Build first
flutter build web --release

# Deploy
vercel --prod
```

### Step 4: Configure in Terminal
When Vercel asks:
- **Set up and deploy?** → Yes
- **Which scope?** → Select your account
- **Link to existing project?** → No (first time)
- **Project name?** → sagar-portfolio
- **In which directory is your code located?** → `./` (root)
- **Want to override settings?** → Yes
- **Output Directory?** → `build/web`
- **Build Command?** → `flutter build web --release`

---

## 📦 Option 2: Deploy Pre-built Files

Since your build is already in `build/web`:

### Step 1: Navigate to build/web
```bash
cd build/web
```

### Step 2: Deploy that folder
```bash
vercel --prod
```

This directly deploys the built files!

---

## 🌐 Option 3: Using Vercel Dashboard (Easiest)

### Step 1: Go to Vercel Dashboard
Visit: https://vercel.com/new

### Step 2: Import from GitHub
- Click "Import Git Repository"
- Select: `waghmarepb/sagar-portfolio`
- Click "Import"

### Step 3: Configure Build Settings
In the Root Directory selector dialog (like your screenshot):
- **Root Directory**: Select `sagar-portfolio` (as shown)
- Click "Continue"

### Step 4: Override Settings
- **Framework Preset**: Other
- **Build Command**: `flutter build web --release`
- **Output Directory**: `build/web`
- **Install Command**: Leave empty or use custom Flutter setup

### Step 5: Deploy
Click "Deploy" button

---

## ⚠️ Important Notes

### For Vercel Dashboard Deployment:

1. **Root Directory Issue**: 
   - In the dialog you showed, select `sagar-portfolio` (the root)
   - Click "Continue"

2. **Build Settings** (after selecting root):
   ```
   Framework Preset: Other
   Build Command: flutter build web --release
   Output Directory: build/web
   Install Command: (leave empty or add Flutter install commands)
   ```

3. **vercel.json Configuration**:
   The `vercel.json` file I created will help Vercel understand your project structure.

---

## 🔧 Alternative: Deploy Pre-built Files

If Vercel Flutter build fails, deploy the already-built files:

```bash
# From your computer, navigate to build/web
cd C:\Users\PRADIP\Documents\sagar\sagar_portfolio\build\web

# Deploy this folder directly
vercel --prod
```

Or manually:
1. Download the `build/web` folder
2. Go to Vercel Dashboard
3. Drag and drop the `web` folder

---

## 📱 Quick Deploy Commands Summary

```bash
# Method 1: Build and deploy from root
cd sagar_portfolio
flutter build web --release
vercel --prod

# Method 2: Deploy built files
cd sagar_portfolio/build/web
vercel --prod

# Method 3: One-line deploy
cd sagar_portfolio && flutter build web --release && vercel --prod
```

---

## ✅ After Deployment

Your site will be live at:
- `https://your-project-name.vercel.app`
- Or your custom domain

Vercel will automatically:
- Generate a unique URL
- Provide HTTPS
- Enable CDN
- Auto-deploy on git push (if connected to GitHub)

---

## 🐛 Troubleshooting

### Issue: "Build failed"
**Solution**: Deploy the pre-built files from `build/web` folder directly

### Issue: "Output directory not found"
**Solution**: Make sure Output Directory is set to `build/web` (not just `build`)

### Issue: "Flutter not found"
**Solution**: 
1. Build locally: `flutter build web --release`
2. Deploy the `build/web` folder
3. Or set custom install command for Flutter

---

## 🎯 Recommended Approach

**For your case** (based on the screenshot):

1. Select `sagar-portfolio` as root directory ✅
2. Click "Continue"
3. Set Output Directory to `build/web`
4. OR simply deploy the `build/web` folder directly using Vercel CLI

---

Built with ❤️ using Flutter

