import 'package:dinesmart/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dashboard.dart'; // Import your homepage file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 400.0, // Increased width
              height: 400.0, // Increased height
            ),
            SizedBox(height: 20.0),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 1000),
              child: Text(
                '', // Empty string instead of 'DINE SMART' text
                style: TextStyle(
                  fontSize: 40.0, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Pacifico', // Use a custom font
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
