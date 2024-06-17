import 'New_Restaurant.dart';

class Table {
  final String id;
  final int tableNo;
  final int capacity;
  final String status;
  final String qr;
  final New_Resturant? restaurant;

  Table({
    required this.id,
    required this.tableNo,
    required this.capacity,
    required this.status,
    required this.qr,
    this.restaurant,
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      id: json['id'] as String,
      tableNo: json['tableNo'] as int,
      capacity: json['capacity'] as int,
      status: json['status'] as String,
      qr: json['qr'] as String,
      restaurant: json['restaurant'] != null
          ? New_Resturant.fromJson(json['restaurant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tableNo': tableNo,
      'capacity': capacity,
      'status': status,
      'qr': qr,
      'restaurant': restaurant?.toJson(),
    };
  }
}
