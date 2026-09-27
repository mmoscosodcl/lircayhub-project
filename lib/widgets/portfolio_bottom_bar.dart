import 'package:flutter/material.dart';

class PortfolioBottomBar extends StatelessWidget {
  final Color primaryColor;
  final bool isDark;

  const PortfolioBottomBar({
    super.key,
    required this.primaryColor,
    required this.isDark,
  });

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isSelected) {
    final unselectedColor = isDark ? const Color(0xFF9E9E9E) : const Color(0xFF757575);
    final color = isSelected ? primaryColor : unselectedColor;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final barBg = isDark
        ? const Color.fromARGB(242, 16, 22, 34)
        : const Color.fromARGB(242, 255, 255, 255);

    return BottomAppBar(
      color: barBg,
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home, 'Home', true),
          _buildNavItem(context, Icons.person, 'About', false),
          const SizedBox(width: 48), // Gap for the centerDocked FAB
          _buildNavItem(context, Icons.show_chart, 'Career', false),
          _buildNavItem(context, Icons.grid_view, 'Projects', false),
        ],
      ),
    );
  }
}
