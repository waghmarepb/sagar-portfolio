import '../models/project_model.dart';

List<Project> getProjectsData() {
  return [
    // FLUTTER PROJECTS (Priority)
    Project(
      title: 'E-Commerce Super App',
      description: 'Full-featured e-commerce platform with multi-vendor support, real-time inventory management, and seamless payment integration.',
      technologies: ['Flutter', 'Firebase', 'Stripe', 'GetX'],
      features: [
        '50K+ downloads',
        'Real-time inventory tracking',
        'Multi-vendor marketplace',
        'Secure payment gateway',
        'Push notifications',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1557821552-17105176677c?w=800&q=80',
      playStoreUrl: 'https://play.google.com',
      appStoreUrl: 'https://apps.apple.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Flutter',
      isFeatured: true,
      stats: '50K+ Downloads',
    ),
    
    Project(
      title: 'Social Media Platform',
      description: 'Feature-rich social networking app with real-time messaging, stories, video calls, and content sharing capabilities.',
      technologies: ['Flutter', 'Node.js', 'MongoDB', 'Socket.io'],
      features: [
        'Real-time chat & video calls',
        'Stories & content sharing',
        '100K+ active users',
        'Advanced media handling',
        'In-app notifications',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1611162617474-5b21e879e113?w=800&q=80',
      liveUrl: 'https://demo.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Flutter',
      isFeatured: true,
      stats: '100K+ Users',
    ),
    
    Project(
      title: 'Healthcare Management System',
      description: 'Comprehensive healthcare solution with telemedicine, appointment scheduling, and AI-powered symptom checker.',
      technologies: ['Flutter Web/Mobile', 'Firebase', 'ML Kit'],
      features: [
        'Appointment booking system',
        'Telemedicine consultations',
        'AI symptom checker',
        'Medical records management',
        'Prescription tracking',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&q=80',
      liveUrl: 'https://healthcare-demo.com',
      category: 'Flutter',
      isFeatured: true,
    ),
    
    Project(
      title: 'Finance Tracker App',
      description: 'Personal finance management app with budget planning, investment tracking, and intelligent bill reminders.',
      technologies: ['Flutter', 'SQLite', 'Charts', 'Biometric Auth'],
      features: [
        'Budget planning & tracking',
        'Investment portfolio management',
        'Bill reminders & alerts',
        'Expense categorization',
        'Financial insights & reports',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=800&q=80',
      playStoreUrl: 'https://play.google.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Flutter',
      isFeatured: true,
    ),
    
    Project(
      title: 'Educational Platform',
      description: 'E-learning platform with live classes, interactive quizzes, and comprehensive progress tracking for students.',
      technologies: ['Flutter', 'Django', 'PostgreSQL', 'WebRTC'],
      features: [
        'Live video classes',
        'Interactive quiz system',
        'Progress tracking dashboard',
        'Assignment submissions',
        'Course materials library',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1501504905252-473c47e087f8?w=800&q=80',
      liveUrl: 'https://edu-platform.com',
      category: 'Flutter',
      isFeatured: true,
    ),
    
    // FULL-STACK PROJECTS
    Project(
      title: 'Real Estate Platform',
      description: 'Modern real estate marketplace with virtual tours, advanced search filters, and integrated booking system.',
      technologies: ['React.js', 'Node.js', 'MongoDB', 'Mapbox'],
      features: [
        '360° virtual property tours',
        'Advanced search & filters',
        'Real-time booking system',
        'Interactive maps',
        'Agent dashboard',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&q=80',
      liveUrl: 'https://realestate-demo.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Full-Stack',
    ),
    
    Project(
      title: 'Task Management System',
      description: 'Collaborative task management tool with Kanban boards, team collaboration features, and time tracking.',
      technologies: ['React', 'Express.js', 'MySQL', 'Redis'],
      features: [
        'Kanban & list views',
        'Team collaboration tools',
        'Time tracking & reporting',
        'Project analytics',
        'Integration with third-party tools',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80',
      liveUrl: 'https://taskmanager-demo.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Full-Stack',
    ),
    
    Project(
      title: 'AI-Powered Blog Platform',
      description: 'Intelligent blogging platform with auto-tagging, content recommendations, and SEO optimization features.',
      technologies: ['Django', 'PostgreSQL', 'Celery', 'NLTK'],
      features: [
        'AI-powered auto-tagging',
        'Content recommendations',
        'SEO optimization',
        'Rich text editor',
        'Analytics dashboard',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1499750310107-5fef28a66643?w=800&q=80',
      liveUrl: 'https://blog-platform.com',
      category: 'Python',
    ),
    
    Project(
      title: 'Inventory Management System',
      description: 'Enterprise inventory management solution with multi-warehouse support, barcode scanning, and analytics.',
      technologies: ['Django REST', 'React', 'PostgreSQL'],
      features: [
        'Multi-warehouse management',
        'Barcode scanning',
        'Real-time stock tracking',
        'Analytics dashboard',
        'Automated reordering',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1553413077-190dd305871c?w=800&q=80',
      liveUrl: 'https://inventory-demo.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Python',
    ),
    
    Project(
      title: 'Microservices API Gateway',
      description: 'Scalable API gateway with rate limiting, authentication, and load balancing for microservices architecture.',
      technologies: ['Flask', 'Docker', 'RabbitMQ', 'MongoDB'],
      features: [
        'Rate limiting & throttling',
        'API authentication',
        'Load balancing',
        'Request routing',
        'Monitoring & logging',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=800&q=80',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Python',
    ),
    
    Project(
      title: 'CMS Platform',
      description: 'Multi-tenant content management system with plugin architecture and comprehensive REST API.',
      technologies: ['Laravel', 'Vue.js', 'MySQL'],
      features: [
        'Multi-tenant architecture',
        'Plugin system',
        'REST API',
        'Role-based access control',
        'Media management',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1547658719-da2b51169166?w=800&q=80',
      liveUrl: 'https://cms-demo.com',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'PHP',
    ),
    
    Project(
      title: 'Data Analysis Tool',
      description: 'Desktop application for data analysis with CSV/Excel processing, interactive charts, and report generation.',
      technologies: ['PyQt5', 'Pandas', 'Matplotlib'],
      features: [
        'CSV/Excel import',
        'Interactive visualizations',
        'Statistical analysis',
        'Report generation',
        'Export to multiple formats',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800&q=80',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Desktop',
    ),
    
    Project(
      title: 'System Monitor',
      description: 'Real-time system monitoring tool with alerts, performance tracking, and historical data analysis.',
      technologies: ['Tkinter', 'psutil', 'SQLite'],
      features: [
        'Real-time system monitoring',
        'Performance alerts',
        'Historical data tracking',
        'Resource usage graphs',
        'Process management',
      ],
      imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80',
      githubUrl: 'https://github.com/sagarkumbhar',
      category: 'Desktop',
    ),
  ];
}

