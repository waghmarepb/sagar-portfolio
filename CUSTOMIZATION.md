# Customization Guide

This guide will help you customize the portfolio with your own information.

## 📝 Personal Information

### 1. Update Constants

Edit `lib/utils/constants.dart`:

```dart
class AppUrls {
  static const String email = 'your-email@gmail.com';
  static const String phone = '+91 YOUR_PHONE';
  static const String location = 'Your City, State';
  static const String linkedin = 'https://www.linkedin.com/in/yourprofile';
  static const String github = 'https://github.com/yourprofile';
  static const String stackoverflow = 'https://stackoverflow.com/users/yourprofile';
  static const String twitter = 'https://twitter.com/yourprofile';
}
```

### 2. Change Colors

In `lib/utils/constants.dart`, modify the color scheme:

```dart
class AppColors {
  static const Color primaryOrange = Color(0xFFFF6B35); // Change to your brand color
  static const Color darkOrange = Color(0xFFE55527);    // Darker shade
  // ... other colors
}
```

### 3. Update Hero Section

Edit `lib/widgets/hero_section.dart`:

- Change the name: `'Sagar Kumbhar'` → `'Your Name'`
- Update titles in `AnimatedTextKit`
- Change the avatar image URL
- Modify description text

## 🎯 Skills

### Add/Remove Skills

Edit `lib/data/skills_data.dart`:

```dart
Skill(
  name: 'Your Technology',
  proficiency: 90,              // 0-100
  experience: 'X years',
  category: 'Category Name',
  iconUrl: 'https://icon-url.svg',
),
```

### Create New Category

```dart
SkillCategory(
  name: 'Your Category',
  isPrimary: false,             // Set true for featured category
  skills: [
    // Add skills here
  ],
),
```

## 💼 Projects

### Add Your Projects

Edit `lib/data/projects_data.dart`:

```dart
Project(
  title: 'Your Project Name',
  description: 'Detailed description of your project',
  technologies: ['Tech1', 'Tech2', 'Tech3'],
  features: [
    'Feature 1',
    'Feature 2',
    // Add more features
  ],
  imageUrl: 'https://unsplash.com/photos/your-image?w=800&q=80',
  liveUrl: 'https://your-demo.com',           // Optional
  githubUrl: 'https://github.com/you/repo',   // Optional
  playStoreUrl: 'https://play.google.com/...',// Optional
  appStoreUrl: 'https://apps.apple.com/...',  // Optional
  category: 'Flutter',  // Flutter, Full-Stack, Python, PHP, Desktop
  isFeatured: true,     // Show featured badge
  stats: '50K+ Users',  // Optional
),
```

### Project Categories

Available categories:
- `Flutter` - Flutter mobile/web apps
- `Full-Stack` - Full-stack web projects
- `Python` - Python/Django/Flask projects
- `PHP` - PHP/Laravel projects
- `Desktop` - Desktop applications

## 🏢 Work Experience

### Update Experience

Edit `lib/data/experience_data.dart`:

```dart
Experience(
  company: 'Your Company Name',
  position: 'Your Position',
  duration: 'X years',
  startDate: 'Mon YYYY',
  endDate: 'Present',        // Or 'Mon YYYY'
  isCurrent: true,           // Set false for past jobs
  responsibilities: [
    'Responsibility 1',
    'Responsibility 2',
    // Add more
  ],
  technologies: [
    'Tech1',
    'Tech2',
    // Add more
  ],
),
```

## 🎨 Design Customization

### 1. Change Font

Edit `lib/main.dart`:

```dart
textTheme: GoogleFonts.robotoTextTheme(),  // Change 'roboto' to any Google Font
```

Available fonts: Poppins, Roboto, Montserrat, Open Sans, Lato, etc.

### 2. Modify Spacing

Edit `lib/utils/constants.dart`:

```dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  // Adjust as needed
}
```

### 3. Animation Speed

Edit `lib/utils/constants.dart`:

```dart
class AnimationDurations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}
```

## 🖼️ Images

### Replace Avatar

1. Upload your avatar to a service like Imgur or use a direct URL
2. Update in `lib/widgets/hero_section.dart`:

```dart
image: NetworkImage('YOUR_AVATAR_URL'),
```

### Project Images

Use high-quality images from:
- [Unsplash](https://unsplash.com/) - Free high-quality images
- [Pexels](https://pexels.com/) - Free stock photos
- Your own project screenshots

Format: `https://images.unsplash.com/photo-ID?w=800&q=80`

## 📱 Contact Form

### Add Form Backend

To make the contact form functional:

1. **Using Firebase:**

```dart
// Add firebase_core and cloud_firestore to pubspec.yaml
// Initialize Firebase
// Submit form data to Firestore
```

2. **Using EmailJS:**

```dart
// Add http package
// Send form data to EmailJS API
```

3. **Using FormSubmit:**

Change form action to:
```dart
action: 'https://formsubmit.co/your-email@example.com'
```

## 🌐 Meta Tags & SEO

Edit `web/index.html`:

```html
<title>Your Name - Flutter Developer Portfolio</title>
<meta name="description" content="Your custom description">
<meta name="keywords" content="your, keywords, here">

<!-- Open Graph -->
<meta property="og:title" content="Your Name - Portfolio">
<meta property="og:description" content="Your description">
<meta property="og:image" content="https://your-domain.com/preview.jpg">
<meta property="og:url" content="https://your-domain.com">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Your Name - Portfolio">
<meta name="twitter:description" content="Your description">
<meta name="twitter:image" content="https://your-domain.com/preview.jpg">
```

## 🎯 Sections

### Remove a Section

In `lib/screens/portfolio_screen.dart`, comment out the section:

```dart
Column(
  children: const [
    HeroSection(),
    AboutSection(),
    // SkillsSection(),  // Commented out
    ProjectsSection(),
    // ...
  ],
)
```

### Add a New Section

1. Create a new widget in `lib/widgets/`
2. Import it in `portfolio_screen.dart`
3. Add it to the Column

## 📊 Analytics

### Add Google Analytics

1. Get your GA4 Measurement ID from Google Analytics

2. Add to `web/index.html` before `</head>`:

```html
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 🔧 Advanced Customization

### Add Particles Effect

Install `particles_flutter` package and add to hero section:

```dart
Stack(
  children: [
    CircularParticle(...),
    // Your content
  ],
)
```

### Add Dark Mode

1. Create a theme provider
2. Add theme toggle button
3. Define dark theme colors in constants

### Add More Animations

Use packages:
- `flutter_animate` - Advanced animations
- `animated_text_kit` - Text animations
- `lottie` - Lottie animations

## 📝 Content Tips

### Writing Project Descriptions

- Start with the problem solved
- Highlight key features
- Mention impact (users, downloads, etc.)
- Keep it concise (2-3 sentences)

### Skills Organization

- Put most important skills first
- Group related technologies
- Be honest about proficiency levels
- Update regularly

### Experience Section

- Focus on achievements, not just duties
- Use action verbs
- Quantify results when possible
- Highlight relevant technologies

## 🚀 Performance Tips

1. **Optimize Images**: Use WebP format, compress images
2. **Lazy Loading**: Load images only when visible
3. **Code Splitting**: Use deferred loading for large sections
4. **Caching**: Enable proper caching headers

## 📞 Need Help?

- Flutter Documentation: https://flutter.dev/docs
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter
- Flutter Community: https://flutter.dev/community

---

Happy Customizing! 🎨

