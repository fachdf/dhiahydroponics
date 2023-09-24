import 'package:dhiahydroponics/about/about.dart';
import 'package:dhiahydroponics/home/home.dart';
import 'package:dhiahydroponics/profile/profile.dart';
import 'package:dhiahydroponics/routes.dart';
import 'package:dhiahydroponics/theme.dart';
import 'package:dhiahydroponics/topics/topics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:dhiahydroponics/services/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  int _currentIndex = 0; // Keep track of the selected tab index

  // Define the screens for your app
  final List<Widget> _screens = [
    HomeScreen(),
    TopicsScreen(),
    AboutScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
            create: (_) => FirestoreService().streamReport(),
            initialData: Report(),
            child: MaterialApp(
              theme: appTheme,
              home: Scaffold(
                body: _screens[_currentIndex], // Display the selected screen
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    // Update the current index when a tab is tapped
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.house,
                        size: 20,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.graduationCap,
                        size: 20,
                      ),
                      label: 'Topics',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.bolt,
                        size: 20,
                      ),
                      label: 'About',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        FontAwesomeIcons.circleUser,
                        size: 20,
                      ),
                      label: 'Profile',
                    ),
                  ],
                  selectedItemColor: Colors.green, // Customize the selected item color
                  unselectedItemColor: Colors.grey, // Customize the unselected item color
                ),
              ),
            ),
          );
        }
        return Text('loading');
      },
    );
  }
}
