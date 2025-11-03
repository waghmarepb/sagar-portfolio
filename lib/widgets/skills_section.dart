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
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Title
          Row(
            children: [
              if (category.isPrimary)
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
                    '⭐ PRIMARY EXPERTISE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (category.isPrimary) const SizedBox(width: 16),
              Expanded(
                child: Text(
                  category.name,
                  style: AppTextStyles.cardTitle.copyWith(
                    fontSize: isMobile ? 20 : 24,
                    color: category.isPrimary
                        ? AppColors.primaryOrange
                        : AppColors.textDark,
                  ),
                ),
              ),
            ],
          )
              .animate(target: _isVisible ? 1 : 0)
              .fadeIn(duration: 600.ms, delay: (300 + index * 100).ms)
              .slideX(begin: -0.2, end: 0),

          const SizedBox(height: 24),

          // Skills Grid
          Wrap(
            spacing: 16,
            runSpacing: 16,
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
    final width = isMobile ? double.infinity : 350.0;

    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isPrimary
            ? Border.all(color: AppColors.primaryOrange.withOpacity(0.3), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                Image.network(
                  skill.iconUrl!,
                  width: 32,
                  height: 32,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.code, size: 32),
                ),
              if (skill.iconUrl != null) const SizedBox(width: 12),
              Expanded(
                child: Text(
                  skill.name,
                  style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
                ),
              ),
              Text(
                '${skill.proficiency.toInt()}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryOrange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _isVisible ? skill.proficiency : 0),
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value / 100,
                  minHeight: 8,
                  backgroundColor: AppColors.offWhite,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isPrimary ? AppColors.primaryOrange : AppColors.lightGrey,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Experience
          Text(
            skill.experience,
            style: AppTextStyles.bodyText.copyWith(fontSize: 14),
          ),
        ],
      ),
    )
        .animate(target: _isVisible ? 1 : 0)
        .fadeIn(
            duration: 600.ms,
            delay: (400 + categoryIndex * 100 + skillIndex * 50).ms)
        .slideY(begin: 0.2, end: 0);
  }
}

