import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// A custom bottom navigation bar with specific icons and styling.
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackground,
        border: Border(
          top: BorderSide(width: 1, color: Color(0xFF280000)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Image.asset("assets/images/esports.png"), 'esports', true),
          _buildNavItem(Image.asset("assets/images/search.png"), 'group', false),
          _buildNavItem(Image.asset("assets/images/leaderboard.png"), 'group', false),
          _buildNavItem(Image.asset("assets/images/Vector.png"), 'group', false),
          _buildNavItem(Image.asset("assets/images/image.png"), 'profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(Widget icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: icon,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primaryRed : Colors.white.withOpacity(0.5),
            fontSize: 10,
            fontFamily: 'LCT Picon',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
