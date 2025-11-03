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

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

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

    return Container(
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
      child: Center(
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
                          flex: isTablet ? 1 : 3,
                          child: _buildContent(context, isMobile),
                        ),
                        if (!isMobile) SizedBox(width: isTablet ? 40 : 80),
                        if (!isMobile)
                          Expanded(
                            flex: isTablet ? 1 : 2,
                            child: _buildAvatar(),
                          ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildAvatar(),
        const SizedBox(height: 32),
        _buildContent(context, true),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Name
        Text(
          'Sagar Kumbhar',
          style: AppTextStyles.heroTitle.copyWith(
            fontSize: isMobile ? 36 : 56,
          ),
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
              '5+ Years Experience',
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
          style: AppTextStyles.bodyText.copyWith(
            fontSize: isMobile ? 14 : 16,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),

        const SizedBox(height: 32),

        // Contact Info
        Wrap(
          spacing: 24,
          runSpacing: 12,
          alignment:
              isMobile ? WrapAlignment.center : WrapAlignment.start,
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
          alignment:
              isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildSocialIcon(FontAwesomeIcons.linkedin, AppUrls.linkedin),
            _buildSocialIcon(FontAwesomeIcons.github, AppUrls.github),
            _buildSocialIcon(
                FontAwesomeIcons.stackOverflow, AppUrls.stackoverflow),
            _buildSocialIcon(FontAwesomeIcons.twitter, AppUrls.twitter),
          ],
        ),

        const SizedBox(height: 40),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment:
              isMobile ? WrapAlignment.center : WrapAlignment.start,
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

  Widget _buildAvatar() {
    final isMobile = ResponsiveHelper.isMobile(context);
    final size = isMobile ? 250.0 : 350.0;
    
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.orangeGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryOrange.withOpacity(0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.primaryOrange),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.bodyText.copyWith(fontSize: 14),
        ),
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
          child: FaIcon(
            icon,
            size: 20,
            color: AppColors.primaryOrange,
          ),
        ),
      ),
    );
  }
}

