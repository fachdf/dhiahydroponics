import 'package:dhiahydroponics/topics/topics.dart';
import 'package:flutter/material.dart';
import 'package:dhiahydroponics/services/auth.dart';
import 'package:dhiahydroponics/login/login.dart';
import 'package:dhiahydroponics/shared/shared.dart';
import 'package:dhiahydroponics/homepage/homepage.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}