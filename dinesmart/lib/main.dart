// main.dart
import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Import your splash screen file
import 'login.dart'; // Import your login file
import 'signup.dart'; // Import your signup file

void main() {
  runApp(LoginSignupApp());
}

class LoginSignupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
