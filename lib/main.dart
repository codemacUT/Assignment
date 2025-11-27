import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/match_repository.dart';
import 'data/services/dio_client.dart';
import 'providers/match_provider.dart';
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
    return MultiProvider(
      providers: [
        Provider<DioClient>(
          create: (_) => DioClient(),
        ),
        ProxyProvider<DioClient, MatchRepository>(
          update: (_, dioClient, __) => MatchRepository(dioClient: dioClient),
        ),
        ChangeNotifierProvider<MatchProvider>(
          create: (context) => MatchProvider(
            matchRepository: Provider.of<MatchRepository>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Esports App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Use the primary background color for the app scaffold
          scaffoldBackgroundColor: AppColors.backgroundBlack,
          useMaterial3: true,
        ),
        home: HomeScreen(), // The main screen of the app
      ),
    );
  }
}
