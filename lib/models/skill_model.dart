class Skill {
  final String name;
  final double proficiency;
  final String experience;
  final String category;
  final String? iconUrl;

  Skill({
    required this.name,
    required this.proficiency,
    required this.experience,
    required this.category,
    this.iconUrl,
  });
}

class SkillCategory {
  final String name;
  final List<Skill> skills;
  final bool isPrimary;

  SkillCategory({
    required this.name,
    required this.skills,
    this.isPrimary = false,
  });
}

