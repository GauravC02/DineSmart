// auth.dart

import 'package:dinesmart/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  static String? _username;

  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final response = await http.post(
        Uri.parse('http://192.168.1.72:9090/auth/getToken'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        _username = responseData['username'];

        Navigator.pushReplacementNamed(
          context,
          '/dashboard',
          arguments: _username,
        );
      } else {
        _showErrorDialog(context, 'Invalid email or password.');
      }
    } else {
      _showErrorDialog(context, 'Please enter email and password.');
    }
  }

  static Future<void> signup({
    required BuildContext context,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
  }) async {
    if (email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        final response = await http.post(
          Uri.parse('http://192.168.1.72:9090/user/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          // After successful signup, navigate to the login page
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          _showErrorDialog(context, 'Signup failed. Please try again.');
        }
      } else {
        _showErrorDialog(
            context, 'Password and confirm password do not match.');
      }
    } else {
      _showErrorDialog(context, 'Please fill all fields.');
    }
  }

  static Future<void> validateToken({
    required BuildContext context,
    required String token,
  }) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.72:9090/auth/validate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Token is valid
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: _username,
      );
    } else {
      _showErrorDialog(context, 'Invalid or expired token.');
    }
  }

  static Future<void> updateUser({
    required BuildContext context,
    required String email,
    required String newPassword,
    required String token,
  }) async {
    final response = await http.put(
      Uri.parse('http://192.168.1.72:9090/auth/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'newPassword': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      _showSuccessDialog(context, 'User updated successfully.');
    } else {
      _showErrorDialog(context, 'Update failed. Please try again.');
    }
  }

  static Future<void> deleteUser({
    required BuildContext context,
    required String email,
    required String token,
  }) async {
    final response = await http.delete(
      Uri.parse('http://192.168.1.72:9090/auth/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      _showSuccessDialog(context, 'User deleted successfully.');
      Navigator.pushReplacementNamed(context, '/signup');
    } else {
      _showErrorDialog(context, 'Delete failed. Please try again.');
    }
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
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

  static void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SUCCESS'),
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
