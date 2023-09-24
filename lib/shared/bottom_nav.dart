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

  void onTabTapped(int index) {
      setState(() {_currentIndex = index;});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        _buildNavItem(FontAwesomeIcons.houseChimney, 'Home', 0),
        _buildNavItem(FontAwesomeIcons.graduationCap, 'Topics', 1),
        _buildNavItem(FontAwesomeIcons.bolt, 'About', 2),
        _buildNavItem(FontAwesomeIcons.circleUser, 'Profile', 3),
      ],
      // onTap: (int idx) {
      //   setState(() {
      //     _currentIndex = idx; // Update the selected index.
      //   });
      //   switch (idx) {
      //     case 0:
      //       _currentIndex = 0;
      //       //Navigator.pushNamed(context, '/');
      //       _pageController.animateToPage(
      //       idx,
      //       duration: const Duration(milliseconds: 300),
      //       curve: Curves.easeInOut,
      //     );
      //       break;
      //     case 1:
      //       _currentIndex = 1;
      //      // Navigator.pushNamed(context, '/topics');
      //       break;
      //     case 2:
      //       _currentIndex = 2;
      //       Navigator.pushNamed(context, '/about');
      //       break;
      //     case 3:
      //       _currentIndex = 3;
      //       Navigator.pushNamed(context, '/profile');
      //       break;
      //   }
      // },
      //onTap: _currentIndex,
      onTap: onTabTapped,
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index; // Update the selected index.
          });
        },
        child: Icon(
          icon,
          size: 20,
          color: _currentIndex == index ? Colors.red : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}