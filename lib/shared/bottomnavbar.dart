import 'package:dhiahydroponics/about/about.dart';
import 'package:dhiahydroponics/home/home.dart';
import 'package:dhiahydroponics/profile/profile.dart';
import 'package:dhiahydroponics/topics/topics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0; // Track the currently selected index.
  final PageController _pageController = PageController(initialPage: 0);

  // List of page content widgets.
  final List<Widget> _pages = [
    // Replace these with your page content widgets.
    const HomeScreen(),
    const TopicsScreen(),
    const AboutScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (int page) {
          setState(() {
            _currentIndex = page; // Update the selected index when the page changes.
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: 20,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.graduationCap,
              size: 20,
            ),
            label: 'Topics',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bolt,
              size: 20,
            ),
            label: 'About',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.circleUser,
              size: 20,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (int idx) {
          setState(() {
            _currentIndex = idx; // Update the selected index.
          });
          // Use PageController to navigate to the selected page.
          _pageController.animateToPage(
            idx,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}