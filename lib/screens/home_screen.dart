import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/filter_section.dart';
import '../widgets/game_mode_selector.dart';
import '../widgets/header_section.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // Header section displaying user info or app branding
                  const HeaderSection(),
                  const SizedBox(height: 20),
                  
                  // Section title for game modes
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Game Modes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.47,
                        fontFamily: 'Suisse Int\'l Mono',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Selector for different game modes
                  const GameModeSelector(),
                  const SizedBox(height: 20),
                  
                  // Filter Section for Match Types (Solo, Duo, Squad)
                  const FilterSection(),
                  const SizedBox(height: 10),
                  
                  // List of Match Cards
                  const MatchCard(
                    imagePath: 'assets/images/image 30.png',
                    logoPath: 'assets/images/Ellipse 904.png',
                  ),
                  const MatchCard(
                    imagePath: 'assets/images/image 31.png',
                    logoPath: 'assets/images/Ellipse 906.png',
                  ),
                  const MatchCard(
                    imagePath: 'assets/images/image 35.png',
                    logoPath: 'assets/images/Ellipse 906.png',
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
            // Custom Bottom Navigation Bar
            const CustomBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
