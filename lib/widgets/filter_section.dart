import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// A section containing filter chips for Match Types (Solo, Duo, Squad).
class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 10.0),
        child: Row(
          children: [
            Expanded(child: _buildFilterChip('SOLO', 0, AppColors.darkContainer, 'assets/images/solo.png')),
            const SizedBox(width: 12),
            Expanded(child: _buildFilterChip('DUO', 2, AppColors.mediumContainer, 'assets/images/duo.png')),
            const SizedBox(width: 12),
            Expanded(child: _buildFilterChip('SQUAD', 4, AppColors.lightContainer, 'assets/images/squad.png')),
          ],
        )
    );
  }

  Widget _buildFilterChip(
      String label,
      int stripes,
      Color baseColor,
      String imagePath,
      ) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(10.24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Gentle diagonal stripes
          ...List.generate(stripes, (i) {
            return Positioned(
              left: i * 28.0,
              top: 0,
              bottom: 0,
              child: Transform.rotate(
                angle: 65,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white.withOpacity(0.07),
                        Colors.white.withOpacity(0.00),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),

          // Foreground content
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTextStyles.monoTiny,
                ),
                const SizedBox(width: 8),
                Image.asset(imagePath, width: 16, height: 16, fit: BoxFit.contain),
              ],
            ),
          ),
        ],
      ),
    );
  }
}