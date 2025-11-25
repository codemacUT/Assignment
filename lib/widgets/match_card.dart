import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// A card widget displaying details of a specific match.
/// Includes the match image, date, type, entry fees, and stats.
class MatchCard extends StatelessWidget {
  final String imagePath;
  final String logoPath;

  const MatchCard({
    super.key,
    required this.imagePath,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ... (Date Row code remains same)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Match    Date    -    '  ,
                      style: AppTextStyles.monoSmall,
                    ),
                    TextSpan(
                      text: '  Sun    Oct    05    |    2:30pm',
                      style: AppTextStyles.monoSmall.copyWith(
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFF181818),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: Text(
                    '?',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        // The Card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 11),
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.cardBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.01),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Container(
                height: 169,
                width: double.infinity,
                color: const Color(0xFF2B2A2A), // Placeholder color
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.image, color: Colors.white54, size: 50),
                  ),
                ),
              ),
              
              // Middle Section (Black/Dark Grey) with Gradient Shade
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.2, -1.0), // Start from top-ish right
                    end: Alignment(0.2, 1.0),   // End at bottom-ish left
                    stops: [0.48, 0.48, 0.52, 0.52], // Adjust stops for the angle
                    colors: [
                      Color(0xFF1E1E1E), 
                      Color(0xFF1E1E1E),
                      Color(0xFF131313), 
                      Color(0xFF131313),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left: Battle Royal
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BATTLE ROYAL',
                            style: AppTextStyles.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Erangle',
                            style: AppTextStyles.bodySmallGrey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    
                    // Center: Logo
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue.withOpacity(0.3), width: 2),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Image.asset(
                          logoPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    // Right: Entry Fees
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'ENTRY FEES',
                            style: AppTextStyles.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '₹ 59/player',
                            style: AppTextStyles.bodySmallGrey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Section (Stats)
              Container(
                padding: const EdgeInsets.all(16.0),
                color: AppColors.cardBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Prize Pool
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('PRIZE POOL:', style: AppTextStyles.bodySmall),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text('₹ 3000', style: AppTextStyles.bodySmall),
                            const SizedBox(width: 8),
                            Container(width: 4, height: 4, color: AppColors.brightRed),
                            const SizedBox(width: 8),
                            const Text('500 ELO', style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ],
                    ),
                    
                    // Squads
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: '23/',
                                style: AppTextStyles.bodySmall,
                              ),
                              TextSpan(
                                text: '25',
                                style: AppTextStyles.labelRed,
                              ),
                              const TextSpan(
                                text: ' SQUADS',
                                style: AppTextStyles.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('KNOCKOUT', style: AppTextStyles.bodySmallGrey),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
