import 'package:flutter/material.dart';
import 'package:login_sample/Screens/home_screen.dart';
import 'package:login_sample/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

List<String>? userInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userInfo = prefs.getStringList('userInfo');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userInfo == null || userInfo!.isEmpty ? LoginScreen() : const HomeScreen(),
    );
  }
}
