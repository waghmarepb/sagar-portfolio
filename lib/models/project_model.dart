class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String imageUrl;
  final String? liveUrl;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String category;
  final bool isFeatured;
  final String? stats;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    required this.imageUrl,
    this.liveUrl,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.category,
    this.isFeatured = false,
    this.stats,
  });
}

