import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../data/experience_data.dart';
import '../models/experience_model.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _isVisible = false;
  final List<Experience> _experiences = getExperienceData();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        width: double.infinity,
        color: AppColors.offWhite,
        padding: ResponsiveHelper.getScreenPadding(context).copyWith(
          top: AppSpacing.xxxl * 2,
          bottom: AppSpacing.xxxl * 2,
        ),
        child: Column(
          children: [
            // Section Title
            Text(
              'Work Experience',
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

            // Timeline
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: _experiences
                    .asMap()
                    .entries
                    .map((entry) =>
                        _buildExperienceCard(entry.value, entry.key, isMobile))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(
      Experience experience, int index, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          if (!isMobile)
            Column(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.orangeGradient,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryOrange.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                if (index < _experiences.length - 1)
                  Container(
                    width: 2,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryOrange,
                          AppColors.primaryOrange.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
              ],
            )
                .animate(target: _isVisible ? 1 : 0)
                .fadeIn(duration: 600.ms, delay: (300 + index * 200).ms)
                .scale(begin: const Offset(0, 0)),

          if (!isMobile) const SizedBox(width: 32),

          // Content Card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: experience.isCurrent
                    ? Border.all(
                        color: AppColors.primaryOrange.withOpacity(0.3),
                        width: 2)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company and Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          experience.company,
                          style:
                              AppTextStyles.cardTitle.copyWith(fontSize: 22),
                        ),
                      ),
                      if (experience.isCurrent)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: AppColors.orangeGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'CURRENT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Position
                  Text(
                    experience.position,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryOrange,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Duration
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: AppColors.lightGrey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${experience.startDate} - ${experience.endDate} (${experience.duration})',
                        style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Responsibilities
                  ...experience.responsibilities.map((resp) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.primaryOrange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              resp,
                              style: AppTextStyles.bodyText.copyWith(
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 16),

                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: experience.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryOrange,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
                .animate(target: _isVisible ? 1 : 0)
                .fadeIn(duration: 600.ms, delay: (400 + index * 200).ms)
                .slideX(begin: 0.2, end: 0),
          ),
        ],
      ),
    );
  }
}

