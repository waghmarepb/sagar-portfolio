import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _isVisible = false;
  String _selectedCategory = 'All';
  final List<Project> _allProjects = getProjectsData();

  List<String> get _categories {
    final categories = _allProjects.map((p) => p.category).toSet().toList();
    return ['All', ...categories];
  }

  List<Project> get _filteredProjects {
    if (_selectedCategory == 'All') return _allProjects;
    return _allProjects.where((p) => p.category == _selectedCategory).toList();
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

    return VisibilityDetector(
      key: const Key('projects-section'),
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
              'Featured Projects',
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

            const SizedBox(height: 32),

            // Category Filter
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: _categories
                  .map((category) => _buildCategoryChip(category))
                  .toList(),
            )
                .animate(target: _isVisible ? 1 : 0)
                .fadeIn(duration: 600.ms, delay: 300.ms),

            const SizedBox(height: 48),

            // Projects Grid
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: _filteredProjects
                  .asMap()
                  .entries
                  .map((entry) =>
                      _buildProjectCard(entry.value, entry.key, isMobile))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = _selectedCategory == category;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = category),
      child: AnimatedContainer(
        duration: AnimationDurations.normal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.orangeGradient : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.lightGrey,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryOrange.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(Project project, int index, bool isMobile) {
    final width = isMobile ? double.infinity : 380.0;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: project.isFeatured
            ? Border.all(color: AppColors.primaryOrange.withOpacity(0.3), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  project.imageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 220,
                    color: AppColors.offWhite,
                    child: const Icon(Icons.image, size: 64),
                  ),
                ),
              ),
              if (project.isFeatured)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.orangeGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          'FEATURED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (project.stats != null)
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      project.stats!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    project.category,
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Title
                Text(
                  project.title,
                  style: AppTextStyles.cardTitle.copyWith(fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  project.description,
                  style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                // Technologies
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies.take(4).map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Links
                Row(
                  children: [
                    if (project.liveUrl != null)
                      _buildProjectLink(
                        Icons.launch,
                        'Live Demo',
                        project.liveUrl!,
                      ),
                    if (project.githubUrl != null) ...[
                      if (project.liveUrl != null) const SizedBox(width: 12),
                      _buildProjectLink(
                        FontAwesomeIcons.github,
                        'GitHub',
                        project.githubUrl!,
                      ),
                    ],
                    if (project.playStoreUrl != null) ...[
                      if (project.liveUrl != null || project.githubUrl != null)
                        const SizedBox(width: 12),
                      _buildProjectLink(
                        FontAwesomeIcons.googlePlay,
                        'Play Store',
                        project.playStoreUrl!,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate(target: _isVisible ? 1 : 0)
        .fadeIn(duration: 600.ms, delay: (400 + index * 100).ms)
        .slideY(begin: 0.2, end: 0);
  }

  Widget _buildProjectLink(IconData icon, String label, String url) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 14, color: AppColors.primaryOrange),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

