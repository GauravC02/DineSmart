import 'package:dinesmart/Models/Location.dart';
import '../Address.dart';

class ResturantRequest {
  final String name;
  final Address address;
  final Location location;
  final String email;
  final String phone;
  final DateTime createdAt;

  ResturantRequest({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    Location? location,
    DateTime? createdAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        location = location ?? Location(latitude: 0, longitude: 0);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address.toJson(),
      'phone': phone,
      'email': email,
      'location': location.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
