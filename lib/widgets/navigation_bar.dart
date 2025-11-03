import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/responsive_helper.dart';

class PortfolioNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;
  
  const PortfolioNavigationBar({
    Key? key,
    required this.onNavigate,
  }) : super(key: key);

  @override
  State<PortfolioNavigationBar> createState() => _PortfolioNavigationBarState();
}

class _PortfolioNavigationBarState extends State<PortfolioNavigationBar> {
  String _hoveredItem = '';

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Material(
      elevation: 4,
      color: Colors.white.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => widget.onNavigate('Home'),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: AppColors.orangeGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.code,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (!isMobile)
                      const Text(
                        'Sagar Kumbhar',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Navigation Items
            if (!isMobile)
              Row(
                children: [
                  _buildNavItem('About'),
                  _buildNavItem('Skills'),
                  _buildNavItem('Projects'),
                  _buildNavItem('Experience'),
                  _buildNavItem('Contact'),
                ],
              )
            else
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _showMobileMenu(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title) {
    final isHovered = _hoveredItem == title;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hoveredItem = title),
        onExit: (_) => setState(() => _hoveredItem = ''),
        child: GestureDetector(
          onTap: () {
            widget.onNavigate(title);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isHovered
                      ? AppColors.primaryOrange
                      : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isHovered ? AppColors.primaryOrange : AppColors.textDark,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _buildMobileMenuItem('About'),
            _buildMobileMenuItem('Skills'),
            _buildMobileMenuItem('Projects'),
            _buildMobileMenuItem('Experience'),
            _buildMobileMenuItem('Contact'),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(String title) {
    return ListTile(
      leading: const Icon(Icons.arrow_forward_ios, size: 16),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        widget.onNavigate(title);
      },
    );
  }
}

