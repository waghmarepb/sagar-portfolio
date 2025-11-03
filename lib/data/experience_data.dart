import '../models/experience_model.dart';

List<Experience> getExperienceData() {
  return [
    Experience(
      company: 'Tech Solutions Inc.',
      position: 'Senior Flutter Developer',
      duration: '5 years',
      startDate: 'Jan 2020',
      endDate: 'Present',
      isCurrent: true,
      responsibilities: [
        'Lead Flutter development team of 8 developers',
        'Architected 5 production Flutter apps with 500K+ combined users',
        'Implemented CI/CD pipelines reducing deployment time by 60%',
        'Mentor junior developers and conduct code reviews',
        'Collaborate with product team on feature planning and roadmap',
      ],
      technologies: [
        'Flutter',
        'Node.js',
        'MongoDB',
        'Firebase',
        'AWS',
        'Docker',
        'CI/CD',
      ],
    ),
    
    Experience(
      company: 'Startup Co.',
      position: 'Junior Full-Stack Developer',
      duration: '1.5 years',
      startDate: 'Jun 2018',
      endDate: 'Dec 2019',
      isCurrent: false,
      responsibilities: [
        'Developed 3 React web applications from scratch',
        'Built RESTful APIs using Node.js and Django',
        'Database design and optimization in MySQL and MongoDB',
        'Implemented responsive UI/UX designs',
        'Participated in agile development processes',
      ],
      technologies: [
        'React',
        'Python',
        'PHP',
        'MySQL',
        'Node.js',
        'Laravel',
        'Git',
      ],
    ),
  ];
}

