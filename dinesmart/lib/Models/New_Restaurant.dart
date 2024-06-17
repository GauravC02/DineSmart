import "dart:io";

import "Address.dart";
import "Location.dart";
import "Table.dart";
import 'dart:convert';

class New_Resturant {
  String id;
  String name;
  final Address? address;
  String phone;
  Location location;
  String email;
  DateTime createdAt;
  String menuId;
  Set<Table>? tables;

  New_Resturant({
    required this.id,
    required this.name,
    this.address,
    required this.phone,
    required this.location,
    required this.email,
    required this.createdAt,
    required this.menuId,
    this.tables,
  });

  factory New_Resturant.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("JSON data is null");
    }
    return New_Resturant(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] != null
          ? Address.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      phone: json['phone'] as String? ??
          "", // Handle null or provide default value
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      email: json['email'] as String? ??
          "", // Handle null or provide default value
      createdAt: DateTime.tryParse(json['createdAt'] as String) ??
          DateTime.now(), // Handle null or default date
      menuId: json['menuId'] as String? ??
          "", // Handle null or provide default value
      tables: (json['tables'] as List<dynamic>?)
          ?.map((item) => Table.fromJson(item as Map<String, dynamic>))
          .toSet(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address?.toJson(),
      'phone': phone,
      'location': location.toJson(),
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'menuId': menuId,
      'tables': tables?.map((table) => table.toJson()).toList(),
    };
  }
}
