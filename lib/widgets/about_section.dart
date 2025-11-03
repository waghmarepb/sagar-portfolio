import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: ResponsiveHelper.getScreenPadding(context).copyWith(
          top: AppSpacing.xxxl * 2,
          bottom: AppSpacing.xxxl * 2,
        ),
        child: Column(
          children: [
            // Section Title
            Text(
              'About Me',
              style: AppTextStyles.sectionTitle.copyWith(
                fontSize: isMobile ? 32 : 42,
              ),
            )
                .animate(target: _isVisible ? 1 : 0)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, end: 0),

            const SizedBox(height: 16),

            // Underline
            Container(
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                gradient: AppColors.orangeGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            )
                .animate(target: _isVisible ? 1 : 0)
                .scale(duration: 600.ms, delay: 200.ms),

            const SizedBox(height: 48),

            // Content
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                children: [
                  // Main Description
                  Text(
                    'Passionate Flutter Developer with 3+ years of experience in building cross-platform applications. Specialized in Flutter/Dart with extensive full-stack expertise across multiple technologies.',
                    style: AppTextStyles.bodyText.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      height: 1.8,
                      color: AppColors.textDark,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn(duration: 600.ms, delay: 300.ms)
                      .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 24),

                  Text(
                    'Currently working at Brilliantech Software Pvt Ltd in Baner, Pune, where I have progressed from Junior to Senior Developer. My expertise spans mobile, web, and desktop development, with a strong focus on creating exceptional user experiences and performant applications.',
                    style: AppTextStyles.bodyText.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn(duration: 600.ms, delay: 500.ms)
                      .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 48),

                  // Stats
                  Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildStat('3+', 'Years Experience'),
                      _buildStat('10+', 'Projects Completed'),
                      _buildStat('100K+', 'App Downloads'),
                      _buildStat('100%', 'Client Satisfaction'),
                    ]
                        .asMap()
                        .entries
                        .map((entry) => entry.value
                            .animate(target: _isVisible ? 1 : 0)
                            .fadeIn(
                                duration: 600.ms,
                                delay: (700 + entry.key * 100).ms)
                            .scale(begin: const Offset(0.8, 0.8)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.offWhite, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => AppColors.orangeGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.bodyText.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

