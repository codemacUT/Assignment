import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// A widget that allows the user to select different game modes (Sniper, Assault, SMG).
/// Displays a horizontal list of cards.
class GameModeSelector extends StatelessWidget {
  const GameModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          // The equals sign
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              ' = ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildModeCard('Sniper', 'Ongoing Arena :   20', Colors.green, imagePath: 'assets/images/sniper.png'),
                const SizedBox(width: 13),
                _buildModeCard('Assault', 'Ongoing Arena :   20', Colors.green, imagePath: 'assets/images/assault.png'),
                const SizedBox(width: 13),
                _buildModeCard('SMG', 'Ongoing Arena :   20', Colors.orange, icon: Icons.bolt),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeCard(String title, String subtitle, Color iconColor, {IconData? icon, String? imagePath}) {
    return Container(
      width: 191,
      padding: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: const Color(0xFF161616),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.08),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: ShapeDecoration(
              color: const Color(0xFF242424),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.05),
              ),
            ),
            child: Center(
              child: imagePath != null
                  ? Image.asset(imagePath, width: 24, height: 24, fit: BoxFit.fill)
                  : Icon(icon, color: iconColor, size: 24),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.10,
                      fontFamily: 'LCT Picon',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.trending_up, color: iconColor, size: 20),
                ],
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(1),
                  fontSize: 13.08,
                  fontFamily: 'Suisse Int\'l Mono',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
