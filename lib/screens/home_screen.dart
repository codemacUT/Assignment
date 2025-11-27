import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../providers/match_provider.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/filter_section.dart';
import '../widgets/game_mode_selector.dart';
import '../widgets/header_section.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch matches when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MatchProvider>(context, listen: false).fetchMatches();
    });
  }

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
                  Consumer<MatchProvider>(
                    builder: (context, provider, child) {
                      if (provider.isLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(color: AppColors.brightRed),
                          ),
                        );
                      }

                      if (provider.errorMessage != null) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Error: ${provider.errorMessage}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }

                      if (provider.matches.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'No matches found.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.matches.length,
                        itemBuilder: (context, index) {
                          final match = provider.matches[index];
                          // Cycle through images for variety since API doesn't provide them
                          final imagePath = [
                            'assets/images/image 30.png',
                            'assets/images/image 31.png',
                            'assets/images/image 35.png'
                          ][index % 3];
                          final logoPath = [
                            'assets/images/Ellipse 904.png',
                            'assets/images/Ellipse 906.png'
                          ][index % 2];

                          return MatchCard(
                            imagePath: imagePath,
                            logoPath: logoPath,
                            title: match.title,
                            description: match.body,
                          );
                        },
                      );
                    },
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
