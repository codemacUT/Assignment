import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esports App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Use the primary background color for the app scaffold
        scaffoldBackgroundColor: AppColors.backgroundBlack,
        useMaterial3: true,
      ),
      home: HomeScreen(), // The main screen of the app
    );
  }
}
