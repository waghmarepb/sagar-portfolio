import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';
import 'custom_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _projectType = 'Flutter';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Thank you! I\'ll get back to you soon.'),
          backgroundColor: AppColors.primaryOrange,
          behavior: SnackBarBehavior.floating,
        ),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return VisibilityDetector(
      key: const Key('contact-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
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
              'Get In Touch',
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

            const SizedBox(height: 16),

            Text(
              'Have a project in mind? Let\'s discuss how I can help you.',
              style: AppTextStyles.bodyText.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            )
                .animate(target: _isVisible ? 1 : 0)
                .fadeIn(duration: 600.ms, delay: 300.ms),

            const SizedBox(height: 48),

            // Contact Content
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: isMobile
                  ? Column(
                      children: [
                        _buildContactInfo(isMobile),
                        const SizedBox(height: 48),
                        _buildContactForm(isMobile),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildContactForm(isMobile),
                        ),
                        const SizedBox(width: 64),
                        Expanded(
                          flex: 1,
                          child: _buildContactInfo(isMobile),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Me a Message',
              style: AppTextStyles.cardTitle,
            ),
            const SizedBox(height: 24),

            // Name Field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Your Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Email Field
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Your Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Project Type Dropdown
            DropdownButtonFormField<String>(
              value: _projectType,
              decoration: InputDecoration(
                labelText: 'Project Type',
                prefixIcon: const Icon(Icons.work),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: const [
                DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
                DropdownMenuItem(value: 'Web', child: Text('Web')),
                DropdownMenuItem(value: 'Backend', child: Text('Backend')),
                DropdownMenuItem(value: 'Desktop', child: Text('Desktop')),
                DropdownMenuItem(
                    value: 'Full-Stack', child: Text('Full-Stack')),
              ],
              onChanged: (value) {
                setState(() => _projectType = value!);
              },
            ),

            const SizedBox(height: 16),

            // Message Field
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Message',
                prefixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Send Message',
                onPressed: _submitForm,
                icon: Icons.send,
              ),
            ),
          ],
        ),
      ),
    )
        .animate(target: _isVisible ? 1 : 0)
        .fadeIn(duration: 600.ms, delay: 400.ms)
        .slideX(begin: isMobile ? 0 : -0.2, end: 0);
  }

  Widget _buildContactInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: AppTextStyles.cardTitle,
        ),
        const SizedBox(height: 24),

        // Email
        _buildInfoCard(
          Icons.email,
          'Email',
          AppUrls.email,
          'mailto:${AppUrls.email}',
        ),

        const SizedBox(height: 16),

        // Phone
        _buildInfoCard(
          Icons.phone,
          'Phone',
          AppUrls.phone,
          'tel:${AppUrls.phone}',
        ),

        const SizedBox(height: 16),

        // Location
        _buildInfoCard(
          Icons.location_on,
          'Location',
          AppUrls.location,
          null,
        ),

        const SizedBox(height: 32),

        // Social Media
        Text(
          'Follow Me',
          style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            _buildSocialButton(
              FontAwesomeIcons.linkedin,
              AppUrls.linkedin,
            ),
            const SizedBox(width: 12),
            _buildSocialButton(
              FontAwesomeIcons.github,
              AppUrls.github,
            ),
            const SizedBox(width: 12),
            _buildSocialButton(
              FontAwesomeIcons.stackOverflow,
              AppUrls.stackoverflow,
            ),
            const SizedBox(width: 12),
            _buildSocialButton(
              FontAwesomeIcons.twitter,
              AppUrls.twitter,
            ),
          ],
        ),
      ],
    )
        .animate(target: _isVisible ? 1 : 0)
        .fadeIn(duration: 600.ms, delay: 600.ms)
        .slideX(begin: isMobile ? 0 : 0.2, end: 0);
  }

  Widget _buildInfoCard(
      IconData icon, String title, String value, String? url) {
    return GestureDetector(
      onTap: url != null ? () => _launchUrl(url) : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: AppColors.orangeGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: AppColors.orangeGradient,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryOrange.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FaIcon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

