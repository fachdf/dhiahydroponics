import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    var bottomPadding=mediaQueryData.padding.bottom;
    if (user != null){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Profile'),
        ),
        body: ElevatedButton(
            child: Text('signout'),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            }),
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ElevatedButton(
            child: Text('signout'),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            }),
            bottomNavigationBar: BottomNavBar(),
      ),
    ); 
  }
}