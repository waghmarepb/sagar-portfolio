import '../models/experience_model.dart';

List<Experience> getExperienceData() {
  return [
    Experience(
      company: 'Brilliantech Software Pvt Ltd',
      position: 'Senior Developer',
      duration: '3 years',
      startDate: '2022',
      endDate: 'Present',
      isCurrent: true,
      responsibilities: [
        'Progressed from Junior to Senior Developer role',
        'Developed and maintained multiple Flutter mobile applications',
        'Built responsive web applications using modern frameworks',
        'Collaborated with cross-functional teams in Baner, Pune office',
        'Implemented best practices for code quality and performance',
        'Mentored junior developers and conducted code reviews',
        'Participated in full software development lifecycle',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'React.js',
        'Node.js',
        'Python',
        'MongoDB',
        'MySQL',
        'Firebase',
        'Git',
        'REST APIs',
      ],
    ),
  ];
}
