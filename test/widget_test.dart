import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment/main.dart';

void main() {
  testWidgets('App renders HomeScreen and widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the HomeScreen is displayed
    expect(find.text('Esports'), findsOneWidget);
    expect(find.text('Game Modes'), findsOneWidget);
    
    // Verify reusable widgets are present
    expect(find.text('Sniper'), findsOneWidget); // GameModeSelector
    expect(find.text('SOLO'), findsOneWidget); // FilterSection
    expect(find.text('BATTLE ROYAL'), findsWidgets); // MatchCard (multiple)
    
    // Verify Bottom Navigation Bar items
    expect(find.text('esports'), findsWidgets); // BottomNavBar (and title)
    expect(find.text('profile'), findsOneWidget);
  });
}
