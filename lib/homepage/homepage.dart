import 'package:dhiahydroponics/shared/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:dhiahydroponics/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar()
    );
  }
}