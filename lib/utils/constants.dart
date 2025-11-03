import 'package:flutter/material.dart';

// Colors
class AppColors {
  static const Color primaryOrange = Color(0xFFFF6B35);
  static const Color darkOrange = Color(0xFFE55527);
  static const Color lightOrange = Color(0xFFFF8F6B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF8F9FA);
  static const Color darkGrey = Color(0xFF2C3E50);
  static const Color lightGrey = Color(0xFF95A5A6);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFF6C757D);
  
  // Gradient
  static const LinearGradient orangeGradient = LinearGradient(
    colors: [primaryOrange, darkOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient lightGradient = LinearGradient(
    colors: [Colors.white, offWhite],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// Text Styles
class AppTextStyles {
  static TextStyle heroTitle = const TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
    height: 1.2,
  );
  
  static TextStyle heroSubtitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryOrange,
    height: 1.4,
  );
  
  static TextStyle sectionTitle = const TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );
  
  static TextStyle cardTitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );
  
  static TextStyle bodyText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
    height: 1.6,
  );
  
  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

// Spacing
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;
}

// Breakpoints
class Breakpoints {
  static const double mobile = 768;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

// Animation Durations
class AnimationDurations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}

// URLs
class AppUrls {
  static const String email = 'sagar@gmail.com';
  static const String phone = '+91 7066090965';
  static const String location = 'Pune, Maharashtra';
  static const String linkedin = 'https://www.linkedin.com/in/sagarkumbhar';
  static const String github = 'https://github.com/sagarkumbhar';
  static const String stackoverflow = 'https://stackoverflow.com/users/sagarkumbhar';
  static const String twitter = 'https://twitter.com/sagarkumbhar';
}

