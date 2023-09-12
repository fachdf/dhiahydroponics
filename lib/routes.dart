import 'package:dhiahydroponics/about/about.dart';
import 'package:dhiahydroponics/profile/profile.dart';
import 'package:dhiahydroponics/home/home.dart';
import 'package:dhiahydroponics/login/login.dart';
import 'package:dhiahydroponics/quiz/quiz.dart';
import 'package:dhiahydroponics/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
  '/topics': (context) => const TopicsScreen(),
};