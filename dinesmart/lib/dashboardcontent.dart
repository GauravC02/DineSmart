import 'package:flutter/material.dart';
import 'restaurantdine.dart'; // Import the RestaurantDinePage

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RestaurantDinePage()), // Navigate to RestaurantDinePage
              );
            },
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'DINE',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              'Delivery',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
