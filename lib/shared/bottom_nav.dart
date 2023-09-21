import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0; // Track the currently selected index.

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
      onTap: (int idx) {
        setState(() {
          _currentIndex = idx; // Update the selected index.
        });
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/topics');
            break;
          case 2:
            Navigator.pushNamed(context, '/about');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
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