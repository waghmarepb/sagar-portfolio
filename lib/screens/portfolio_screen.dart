import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            child: Column(
              children: const [
                HeroSection(),
                AboutSection(),
                SkillsSection(),
                ProjectsSection(),
                ExperienceSection(),
                ContactSection(),
                PortfolioFooter(),
              ],
            ),
          ),

          // Fixed Navigation Bar
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavigationBar(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Scroll to top
        },
        backgroundColor: const Color(0xFFFF6B35),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}

