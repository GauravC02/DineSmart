// signup.dart

import 'package:flutter/material.dart';
import 'dart:ui';
import 'auth.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/restaurants.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: Center(
              child: Container(
                height: 520.0,
                width: 300.0,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildTextField(
                        label: 'Email',
                        controller: _emailController,
                        icon: Icons.email,
                      ),
                      SizedBox(height: 20.0),
                      _buildTextField(
                        label: 'Username',
                        controller: _usernameController,
                        icon: Icons.person,
                      ),
                      SizedBox(height: 20.0),
                      _buildTextField(
                        label: 'Password',
                        controller: _passwordController,
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      _buildTextField(
                        label: 'Confirm Password',
                        controller: _confirmPasswordController,
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: () => Auth.signup(
                          context: context,
                          email: _emailController.text,
                          username: _usernameController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _navigateToLogin,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
          ),
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
