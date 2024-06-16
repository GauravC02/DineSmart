import 'package:flutter/material.dart';

class User {
  String firstName;
  String? middleName;
  String lastName;
  String email;
  String password;
  String phone;
  String address;

  User({
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });

  // Method for converting a User instance to a map
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }
}
