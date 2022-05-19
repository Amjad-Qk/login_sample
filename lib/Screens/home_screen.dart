import 'package:flutter/material.dart';
import 'package:login_sample/Screens/login_screen.dart';

import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await prefs.setStringList('userInfo', []);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE3F1F7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userInfo![0]),
              const SizedBox(height: 30),
              Text(userInfo![1]),
            ],
          ),
        ),
      ),
    );
  }
}
