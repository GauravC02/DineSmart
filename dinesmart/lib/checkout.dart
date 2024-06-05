import 'package:flutter/material.dart';
import 'maps.dart';
import 'payment.dart'; // Import the PaymentPage widget
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import LatLng class

class CheckoutPage extends StatefulWidget {
  final double totalAmount;

  CheckoutPage({required this.totalAmount});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? deliveryLocationName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _navigateToMap();
            },
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Delivery Address'),
              subtitle: Text(deliveryLocationName ?? 'Tap to choose location'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Options'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _navigateToMap() async {
    // Navigate to the MapPage and wait for the chosen location
    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(),
      ),
    );

    // Update the delivery location if a location was chosen
    if (result != null) {
      // Use Geocoding API to get the name of the location
      try {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(result.latitude, result.longitude);
        if (placemarks.isNotEmpty) {
          setState(() {
            deliveryLocationName = _buildAddressString(placemarks[0]);
          });
        }
      } catch (e) {
        print("Error getting address: $e");
      }
    }
  }

  String _buildAddressString(Placemark placemark) {
    return '${placemark.street}, ${placemark.locality}, ${placemark.country}';
  }
}
