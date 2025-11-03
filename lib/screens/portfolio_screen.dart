import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _heroKey),
                AboutSection(key: _aboutKey),
                SkillsSection(key: _skillsKey),
                ProjectsSection(key: _projectsKey),
                ExperienceSection(key: _experienceKey),
                ContactSection(key: _contactKey),
                const PortfolioFooter(),
              ],
            ),
          ),

          // Fixed Navigation Bar - with IgnorePointer to allow interaction
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavigationBar(
              onNavigate: (section) {
                switch (section) {
                  case 'About':
                    scrollToSection(_aboutKey);
                    break;
                  case 'Skills':
                    scrollToSection(_skillsKey);
                    break;
                  case 'Projects':
                    scrollToSection(_projectsKey);
                    break;
                  case 'Experience':
                    scrollToSection(_experienceKey);
                    break;
                  case 'Contact':
                    scrollToSection(_contactKey);
                    break;
                  case 'Home':
                    scrollToTop();
                    break;
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scrollToTop,
        backgroundColor: const Color(0xFFFF6B35),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}

