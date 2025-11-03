import '../models/skill_model.dart';

List<SkillCategory> getSkillsData() {
  return [
    // PRIMARY EXPERTISE
    SkillCategory(
      name: 'Flutter & Mobile Development',
      isPrimary: true,
      skills: [
        Skill(
          name: 'Flutter/Dart',
          proficiency: 95,
          experience: '5+ years - Expert Level',
          category: 'Primary',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
        ),
        Skill(
          name: 'Firebase',
          proficiency: 90,
          experience: 'Cloud Functions, Firestore, Auth',
          category: 'Primary',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg',
        ),
        Skill(
          name: 'State Management',
          proficiency: 92,
          experience: 'GetX, Riverpod, Bloc',
          category: 'Primary',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
        ),
        Skill(
          name: 'Flutter Web & Desktop',
          proficiency: 88,
          experience: 'Cross-platform Development',
          category: 'Primary',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
        ),
      ],
    ),
    
    // FRONTEND
    SkillCategory(
      name: 'Frontend Technologies',
      skills: [
        Skill(
          name: 'React.js',
          proficiency: 85,
          experience: 'Hooks, Redux, Context API',
          category: 'Frontend',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg',
        ),
        Skill(
          name: 'HTML5/CSS3',
          proficiency: 90,
          experience: 'Modern Web Standards',
          category: 'Frontend',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg',
        ),
        Skill(
          name: 'JavaScript',
          proficiency: 88,
          experience: 'ES6+, TypeScript',
          category: 'Frontend',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg',
        ),
      ],
    ),
    
    // BACKEND
    SkillCategory(
      name: 'Backend Technologies',
      skills: [
        Skill(
          name: 'Node.js',
          proficiency: 85,
          experience: 'Express.js, REST APIs, JWT',
          category: 'Backend',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg',
        ),
        Skill(
          name: 'Python',
          proficiency: 88,
          experience: '4+ years',
          category: 'Backend',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg',
        ),
        Skill(
          name: 'PHP',
          proficiency: 80,
          experience: 'OOP, MVC Pattern',
          category: 'Backend',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/php/php-original.svg',
        ),
      ],
    ),
    
    // FRAMEWORKS
    SkillCategory(
      name: 'Frameworks',
      skills: [
        Skill(
          name: 'Django',
          proficiency: 82,
          experience: 'DRF, Celery, Channels',
          category: 'Framework',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/django/django-plain.svg',
        ),
        Skill(
          name: 'Flask',
          proficiency: 85,
          experience: 'RESTful APIs, SQLAlchemy',
          category: 'Framework',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flask/flask-original.svg',
        ),
        Skill(
          name: 'Laravel',
          proficiency: 80,
          experience: 'Eloquent ORM, Blade',
          category: 'Framework',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/laravel/laravel-plain.svg',
        ),
      ],
    ),
    
    // DATABASES
    SkillCategory(
      name: 'Databases',
      skills: [
        Skill(
          name: 'MongoDB',
          proficiency: 85,
          experience: 'Aggregation, Indexing',
          category: 'Database',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg',
        ),
        Skill(
          name: 'MySQL',
          proficiency: 87,
          experience: 'Complex Queries, Stored Procedures',
          category: 'Database',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg',
        ),
        Skill(
          name: 'PostgreSQL',
          proficiency: 82,
          experience: 'Advanced SQL',
          category: 'Database',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg',
        ),
      ],
    ),
    
    // DESKTOP
    SkillCategory(
      name: 'Desktop Development',
      skills: [
        Skill(
          name: 'PyQt5',
          proficiency: 78,
          experience: 'Cross-platform Desktop Apps',
          category: 'Desktop',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/qt/qt-original.svg',
        ),
        Skill(
          name: 'Tkinter',
          proficiency: 75,
          experience: 'Python GUI Applications',
          category: 'Desktop',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg',
        ),
        Skill(
          name: 'Flutter Desktop',
          proficiency: 88,
          experience: 'Windows, macOS, Linux',
          category: 'Desktop',
          iconUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
        ),
      ],
    ),
  ];
}

