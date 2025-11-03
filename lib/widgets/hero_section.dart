import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';
import 'custom_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onHover: (_) {
        // Trigger subtle animation on hover
      },
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: ResponsiveHelper.getHeight(context) * 0.9,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              AppColors.offWhite,
              AppColors.primaryOrange.withOpacity(0.05),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated background shapes
            ..._buildAnimatedShapes(),

            // Content
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? screenWidth : 1400,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : (isTablet ? 40 : 60),
                  vertical: isMobile ? 40 : 80,
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
              child: isMobile
                  ? _buildMobileLayout()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildContent(context, isMobile),
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 2,
                          child: _buildFlutterImage(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(children: [_buildContent(context, true)]);
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Name
        Text(
          'Sagar Kumbhar',
          style: AppTextStyles.heroTitle.copyWith(fontSize: isMobile ? 36 : 56),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 16),

        // Animated Title
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flutter Developer',
              textStyle: AppTextStyles.heroSubtitle.copyWith(
                fontSize: isMobile ? 18 : 24,
              ),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              'Full-Stack Engineer',
              textStyle: AppTextStyles.heroSubtitle.copyWith(
                fontSize: isMobile ? 18 : 24,
              ),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              '3+ Years Experience',
              textStyle: AppTextStyles.heroSubtitle.copyWith(
                fontSize: isMobile ? 18 : 24,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
          pause: const Duration(milliseconds: 1000),
        ),

        const SizedBox(height: 24),

        // Description
        Text(
          'Passionate Flutter Developer specializing in building\nbeautiful cross-platform applications',
          style: AppTextStyles.bodyText.copyWith(fontSize: isMobile ? 14 : 16),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),

        const SizedBox(height: 32),

        // Contact Info
        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildContactItem(Icons.email, AppUrls.email),
            _buildContactItem(Icons.phone, AppUrls.phone),
            _buildContactItem(Icons.location_on, AppUrls.location),
          ],
        ),

        const SizedBox(height: 32),

        // Social Media Icons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildSocialIcon(FontAwesomeIcons.linkedin, AppUrls.linkedin),
            _buildSocialIcon(FontAwesomeIcons.github, AppUrls.github),
            _buildSocialIcon(
              FontAwesomeIcons.stackOverflow,
              AppUrls.stackoverflow,
            ),
            _buildSocialIcon(FontAwesomeIcons.twitter, AppUrls.twitter),
          ],
        ),

        const SizedBox(height: 40),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              text: 'View Projects',
              onPressed: () {
                // Scroll to projects section
                Scrollable.ensureVisible(
                  context,
                  duration: const Duration(milliseconds: 500),
                );
              },
              icon: Icons.work,
            ),
            CustomButton(
              text: 'Contact Me',
              onPressed: () {
                // Scroll to contact section
              },
              isOutlined: true,
              icon: Icons.mail,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFlutterImage() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1500),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Transform.rotate(
            angle: 0.1 * (1 - value),
            child: Opacity(
              opacity: value,
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Glow effect
                    Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.primaryOrange.withOpacity(0.2),
                            AppColors.primaryOrange.withOpacity(0.05),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    // Flutter logo
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryOrange.withOpacity(0.3),
                            blurRadius: 30,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          'https://storage.googleapis.com/cms-storage-bucket/4fd0db61df0567c0f352.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: AppColors.orangeGradient,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Icon(
                                Icons.flutter_dash,
                                size: 150,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // Floating animation
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 3),
                      builder: (context, floatValue, child) {
                        return Transform.translate(
                          offset: Offset(0, 10 * (0.5 - floatValue).abs()),
                          child: const SizedBox.shrink(),
                        );
                      },
                      onEnd: () {
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.primaryOrange),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.bodyText.copyWith(fontSize: 14)),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FaIcon(icon, size: 20, color: AppColors.primaryOrange),
        ),
      ),
    );
  }

  List<Widget> _buildAnimatedShapes() {
    return [
      // Floating circle 1
      Positioned(
        top: 100,
        right: 100,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 3),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 20 * (0.5 - value).abs()),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primaryOrange.withOpacity(0.2),
                      AppColors.primaryOrange.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
            );
          },
          onEnd: () {
            if (mounted) {
              setState(() {});
            }
          },
        ),
      ),

      // Floating circle 2
      Positioned(
        bottom: 150,
        left: 80,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 4),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(15 * (0.5 - value).abs(), 0),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.darkOrange.withOpacity(0.15),
                      AppColors.darkOrange.withOpacity(0.03),
                    ],
                  ),
                ),
              ),
            );
          },
          onEnd: () {
            if (mounted) {
              setState(() {});
            }
          },
        ),
      ),

      // Floating circle 3
      Positioned(
        top: 250,
        left: 150,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 5),
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(
                10 * (0.5 - value).abs(),
                15 * (0.5 - value).abs(),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.lightOrange.withOpacity(0.25),
                      AppColors.lightOrange.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
            );
          },
          onEnd: () {
            if (mounted) {
              setState(() {});
            }
          },
        ),
      ),

      // Code-themed decorative elements
      Positioned(top: 50, left: 50, child: _buildFloatingCode('</>')),

      Positioned(bottom: 100, right: 150, child: _buildFloatingCode('{ }')),

      Positioned(top: 180, right: 250, child: _buildFloatingCode('⚡')),
    ];
  }

  Widget _buildFloatingCode(String text) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: 0.3 + (0.2 * value),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryOrange.withOpacity(0.3),
              ),
            ),
          ),
        );
      },
      onEnd: () {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }
}
