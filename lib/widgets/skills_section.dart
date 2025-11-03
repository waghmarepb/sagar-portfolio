import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../data/skills_data.dart';
import '../models/skill_model.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _isVisible = false;
  final List<SkillCategory> _categories = getSkillsData();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return VisibilityDetector(
      key: const Key('skills-section'),
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
              'Skills & Expertise',
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

            // Skills Categories
            ..._categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: _buildSkillCategory(category, index, isMobile),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
      SkillCategory category, int index, bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1400),
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: category.isPrimary 
                  ? AppColors.primaryOrange.withOpacity(0.08)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: category.isPrimary
                  ? Border.all(color: AppColors.primaryOrange.withOpacity(0.3), width: 2)
                  : Border.all(color: AppColors.offWhite, width: 1),
            ),
            child: Row(
              children: [
                if (category.isPrimary)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.orangeGradient,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryOrange.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          'PRIMARY EXPERTISE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (category.isPrimary) const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    category.name,
                    style: AppTextStyles.cardTitle.copyWith(
                      fontSize: isMobile ? 20 : 26,
                      fontWeight: FontWeight.bold,
                      color: category.isPrimary
                          ? AppColors.primaryOrange
                          : AppColors.textDark,
                    ),
                  ),
                ),
                Icon(
                  category.isPrimary ? Icons.emoji_events : Icons.code,
                  color: category.isPrimary 
                      ? AppColors.primaryOrange 
                      : AppColors.lightGrey,
                  size: 28,
                ),
              ],
            ),
          )
              .animate(target: _isVisible ? 1 : 0)
              .fadeIn(duration: 600.ms, delay: (300 + index * 100).ms)
              .slideX(begin: -0.2, end: 0),

          const SizedBox(height: 24),

          // Skills Grid
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: category.skills
                  .asMap()
                  .entries
                  .map((entry) => _buildSkillCard(
                        entry.value,
                        index,
                        entry.key,
                        isMobile,
                        category.isPrimary,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
    Skill skill,
    int categoryIndex,
    int skillIndex,
    bool isMobile,
    bool isPrimary,
  ) {
    final width = isMobile ? double.infinity : 380.0;

    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isPrimary
            ? Border.all(color: AppColors.primaryOrange.withOpacity(0.4), width: 2)
            : Border.all(color: AppColors.offWhite, width: 1),
        boxShadow: [
          BoxShadow(
            color: isPrimary 
                ? AppColors.primaryOrange.withOpacity(0.1)
                : Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
            spreadRadius: isPrimary ? 2 : 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skill Name and Icon
          Row(
            children: [
              if (skill.iconUrl != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isPrimary 
                        ? AppColors.primaryOrange.withOpacity(0.1)
                        : AppColors.offWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    skill.iconUrl!,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.code, size: 40, color: AppColors.primaryOrange),
                  ),
                ),
              if (skill.iconUrl != null) const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.name,
                      style: AppTextStyles.cardTitle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${skill.proficiency.toInt()}% Proficiency',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isPrimary 
                            ? AppColors.primaryOrange 
                            : AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Progress Bar with Gradient
          Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: _isVisible ? skill.proficiency : 0),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return FractionallySizedBox(
                    widthFactor: value / 100,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        gradient: isPrimary
                            ? AppColors.orangeGradient
                            : LinearGradient(
                                colors: [
                                  AppColors.lightGrey,
                                  AppColors.darkGrey.withOpacity(0.5),
                                ],
                              ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: isPrimary
                            ? [
                                BoxShadow(
                                  color: AppColors.primaryOrange.withOpacity(0.4),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Experience with icon
          Row(
            children: [
              Icon(
                Icons.work_outline,
                size: 16,
                color: AppColors.lightGrey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  skill.experience,
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
        .animate(target: _isVisible ? 1 : 0)
        .fadeIn(
            duration: 600.ms,
            delay: (400 + categoryIndex * 100 + skillIndex * 50).ms)
        .slideY(begin: 0.2, end: 0)
        .scale(begin: const Offset(0.95, 0.95));
  }
}

