class Experience {
  final String company;
  final String position;
  final String duration;
  final String startDate;
  final String endDate;
  final List<String> responsibilities;
  final List<String> technologies;
  final bool isCurrent;

  Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.responsibilities,
    required this.technologies,
    this.isCurrent = false,
  });
}

