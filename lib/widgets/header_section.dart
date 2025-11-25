import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

/// The header section of the home screen.
/// Contains the ELO badge, Game Selector, Category Buttons (Arena, Zenith League, Championship),
/// and the "Esports | Registered Matches" tabs.
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Row: ELO and Game Selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ELO Badge
              Container(
                width: 113,
                height: 37,
                decoration: ShapeDecoration(
                  gradient: AppColors.redGradient,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.12),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 38,
                      height: 38,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6.12),
                          bottomLeft: Radius.circular(6.12),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('assets/images/image.png'),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        '1500 ELO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'Suisse Int\'l Mono',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.29,
                        ),
                      ),
                    ),
                  ],
                )
              ),
              
              // Game Selector
              Container(
                width: 150, // Approximate width
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFD7333A),
                      Color(0xFF520001),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(2), // Border width
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF222222), // Grey background
                    borderRadius: BorderRadius.circular(7), // Slightly smaller radius
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(
                            'assets/images/gameselector.png',
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.white),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Category Buttons (Arena, Zenith League, Championship)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryButton(
                'Arena',
                const Color(0xFF090089), // Blue
                Image.asset(
                  'assets/images/arena.png',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
              ),),
              const SizedBox(width: 20),
              _buildCategoryButton(
                'Zenith\nLeague',
                const Color(0xFFFF3D00), // Orange
                Image.asset(
                  'assets/images/league.png',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(width: 20),
              _buildCategoryButton(
                'Championship',
                Colors.white,
                Image.asset(
                  'assets/images/championship.png',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
                iconColor: Colors.red,
                textColor: Colors.white,
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 15.0), // Align with the buttons
                child: Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Tabs (Esports | Registered Matches)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text tops
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center underline relative to text
                children: [
                  Text(
                    'Esports',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.red.withOpacity(1),
                          blurRadius: 100,
                          offset: const Offset(0,10),
                        ),
                        Shadow(
                          color: Colors.red.withOpacity(1),
                          blurRadius: 100,
                          offset: const Offset(0,10),
                        ),
                        Shadow(
                          color: Colors.red.withOpacity(0.5),
                          blurRadius: 100,
                          offset: const Offset(0,10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4), // Increased spacing slightly
                  Container(
                    width: 30,
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                         BoxShadow(
                          color: AppColors.primaryRed.withOpacity(0.8),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Padding(
                padding: EdgeInsets.only(top: 0), // Adjust if needed to match baseline
                child: Text(
                  '|',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(width: 20),
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    'Registered Matches',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 3),
        const Divider(color: AppColors.borderColor, height: 3, thickness: 1),
      ],
    );
  }

  Widget _buildCategoryButton(String label, Color color,Widget icon, {Color iconColor = Colors.white, Color textColor = Colors.white}) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
            border: label == 'Arena' ? Border.all(color: Colors.white, width: 2) : null,
          ),
          child: Center(child: icon),),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontFamily: 'Suisse Int\'l Mono',
          ),
        ),
      ],
    );
  }
}
