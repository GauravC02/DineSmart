// auth.dart

import 'package:flutter/material.dart';

class Auth {
  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      // Perform your login logic here

      // After successful login, navigate to the dashboard
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      _showErrorDialog(context, 'Please enter email and password.');
    }
  }

  static Future<void> signup({
    required BuildContext context,
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    if (email.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        // Perform your signup logic here
        print('Email: $email, Username: $username, Password: $password');
      } else {
        _showErrorDialog(
            context, 'Password and confirm password do not match.');
      }
    } else {
      _showErrorDialog(context, 'Please fill all fields.');
    }
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
