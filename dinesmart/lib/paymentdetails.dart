import 'package:flutter/material.dart';
import 'bottomnavigationbar.dart'; // Import the BottomNavigationBarWidget
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import Google Maps Flutter
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

class PaymentDetailsPage extends StatefulWidget {
  final double totalAmount;

  PaymentDetailsPage({required this.totalAmount});

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  late GoogleMapController mapController;

  // Default location to Kathmandu, Nepal
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(27.7172, 85.324),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kInitialPosition,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _navigateToMap();
            },
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Delivery Address'),
              subtitle:
                  Text('Kathmandu, Nepal'), // Change to your delivery address
            ),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Options'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    _launchURL('https://esewa.com.np/');
                  },
                  child: Text('eSewa'),
                ),
                InkWell(
                  onTap: () {
                    _launchURL('https://khalti.com/');
                  },
                  child: Text('Khalti'),
                ),
                InkWell(
                  onTap: () {
                    _launchURL('https://www.imepay.com.np/');
                  },
                  child: Text('IME Pay'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 0, // Set the appropriate index for the selected tab
        onItemTapped: (index) {}, // Define the functionality for tapping items
      ),
    );
  }

  // Function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to navigate to the map page
  void _navigateToMap() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              MapPage()), // Create a MapPage widget to navigate to
    );
  }
}

// MapPage widget
class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Address Map'),
      ),
      body: Center(
        child: Text('Map will be displayed here'), // Display Google Maps here
      ),
    );
  }
}
