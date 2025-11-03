# Deployment Guide

This guide will help you deploy your Flutter web portfolio to various hosting platforms.

## 🚀 Build for Production

First, build the web app for production:

```bash
cd sagar_portfolio
flutter build web --release
```

The built files will be in `build/web/` directory.

## 📦 Deployment Options

### 1. Firebase Hosting (Recommended)

Firebase Hosting is fast, secure, and ideal for Flutter web apps.

**Steps:**

1. Install Firebase CLI:
```bash
npm install -g firebase-tools
```

2. Login to Firebase:
```bash
firebase login
```

3. Initialize Firebase in your project:
```bash
firebase init hosting
```

Configuration:
- Public directory: `build/web`
- Single-page app: Yes
- Set up automatic builds: No

4. Deploy:
```bash
firebase deploy
```

Your site will be live at: `https://your-project.web.app`

---

### 2. Netlify

Netlify offers easy drag-and-drop deployment.

**Steps:**

1. Build the project:
```bash
flutter build web --release
```

2. Go to [Netlify](https://app.netlify.com/)

3. Drag and drop the `build/web` folder

4. Your site will be live instantly!

**OR using Netlify CLI:**

```bash
npm install -g netlify-cli
netlify login
netlify deploy --prod --dir=build/web
```

---

### 3. GitHub Pages

Host directly from your GitHub repository.

**Steps:**

1. Build for web:
```bash
flutter build web --release --base-href "/sagar-portfolio/"
```

2. Copy contents of `build/web` to `docs` folder or create a `gh-pages` branch

3. Go to Repository Settings → Pages

4. Select source: `main` branch → `/docs` folder (or `gh-pages` branch)

5. Your site will be live at: `https://waghmarepb.github.io/sagar-portfolio/`

---

### 4. Vercel

Vercel offers excellent performance and CDN.

**Steps:**

1. Install Vercel CLI:
```bash
npm install -g vercel
```

2. Deploy:
```bash
vercel --prod
```

3. Set the output directory to `build/web`

---

## 🔧 Custom Domain

### Firebase Hosting

```bash
firebase hosting:channel:deploy preview --expires 7d
```

Add custom domain in Firebase Console → Hosting → Add custom domain

### Netlify

Go to Site Settings → Domain Management → Add custom domain

### GitHub Pages

Add a `CNAME` file in the `docs` folder with your domain name

---

## 🌐 Environment Variables

If you need environment-specific configurations:

1. Create `.env` files:
   - `.env.development`
   - `.env.production`

2. Use packages like `flutter_dotenv` to load environment variables

---

## ⚡ Performance Optimization

### Enable Caching

Add to `web/index.html`:

```html
<meta http-equiv="Cache-Control" content="public, max-age=31536000">
```

### Optimize Images

Use WebP format and lazy loading for better performance.

### Enable Gzip Compression

Configure in your hosting platform:

**Firebase (`firebase.json`):**
```json
{
  "hosting": {
    "headers": [{
      "source": "**",
      "headers": [{
        "key": "Cache-Control",
        "value": "max-age=31536000"
      }]
    }]
  }
}
```

---

## 📊 Analytics

### Google Analytics

Add to `web/index.html`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

---

## 🔍 SEO Optimization

1. Update `web/index.html` with proper meta tags:

```html
<meta name="description" content="Sagar Kumbhar - Flutter Developer & Full-Stack Engineer with 5+ years experience">
<meta name="keywords" content="Flutter Developer, Full Stack Developer, Mobile App Development">
<meta property="og:title" content="Sagar Kumbhar - Flutter Developer Portfolio">
<meta property="og:description" content="Professional Flutter Developer with expertise in cross-platform development">
<meta property="og:image" content="https://yourdomain.com/preview.jpg">
```

2. Create a `sitemap.xml` file

3. Add `robots.txt`

---

## 🎯 Quick Deploy Scripts

Add to `package.json` (create if doesn't exist):

```json
{
  "scripts": {
    "deploy:firebase": "flutter build web --release && firebase deploy",
    "deploy:netlify": "flutter build web --release && netlify deploy --prod --dir=build/web",
    "deploy:vercel": "flutter build web --release && vercel --prod"
  }
}
```

Then run:
```bash
npm run deploy:firebase
```

---

## 📱 Testing

Before deploying, test your build locally:

```bash
flutter build web --release
cd build/web
python -m http.server 8000
```

Visit: `http://localhost:8000`

---

## 🐛 Troubleshooting

### Issue: Blank page after deployment

**Solution:** Check the base href in `web/index.html`:
```html
<base href="/">
```

For GitHub Pages, it should be:
```html
<base href="/sagar-portfolio/">
```

### Issue: Images not loading

**Solution:** Ensure images are in the `web` folder or use absolute URLs

### Issue: Routes not working

**Solution:** Configure your hosting for single-page app routing

---

## 📞 Support

If you encounter issues, check:
- Flutter Web Documentation: https://flutter.dev/web
- Firebase Hosting Docs: https://firebase.google.com/docs/hosting
- Netlify Docs: https://docs.netlify.com/

---

Built with ❤️ using Flutter

