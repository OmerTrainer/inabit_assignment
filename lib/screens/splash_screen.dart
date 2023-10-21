import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:inabit_assignment/main.dart';
import 'package:inabit_assignment/screens/article_details_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ArticleDetailsScreen.routeName: (context) =>
            const ArticleDetailsScreen(),
      },
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Icons.newspaper,
        nextScreen: const MyApp(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
