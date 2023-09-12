import 'package:dhiahydroponics/homepage/homepage.dart';
import 'package:dhiahydroponics/shared/bottomnavbar.dart';
import 'package:dhiahydroponics/topics/topics.dart';
import 'package:flutter/material.dart';
import 'package:dhiahydroponics/services/auth.dart';
import 'package:dhiahydroponics/login/login.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text("Loading..");
        }else if(snapshot.hasError){
          return const Center(
            child: Text('error'),
          );
        }else if(snapshot.hasData){
          return const HomePage();
        }else{
          return const LoginScreen();
        }
      },
    );
  }
}