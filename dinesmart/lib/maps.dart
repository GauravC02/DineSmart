import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng pinLocation = LatLng(27.7172, 85.324); // Default location
  String locationName = ""; // Location name initialized as empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: pinLocation,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('pin'),
            position: pinLocation,
            infoWindow: InfoWindow(
              title: locationName, // Display the location name above the pin
            ),
          ),
        },
        onTap: _handleTap,
        onMapCreated: (GoogleMapController controller) {
          // Handle the map controller if needed
        },
      ),
    );
  }

  // Method to handle taps on the map
  void _handleTap(LatLng tappedPoint) async {
    setState(() {
      pinLocation = tappedPoint;
    });

    // Reverse geocoding to get the address of the tapped location
    List<Placemark> placemarks = await placemarkFromCoordinates(
      tappedPoint.latitude,
      tappedPoint.longitude,
    );

    // Extracting the first placemark (most accurate result)
    if (placemarks != null && placemarks.isNotEmpty) {
      locationName = placemarks[0].name ?? "";
    } else {
      locationName =
          ""; // If no address found, set locationName to empty string
    }

    setState(() {}); // Update the UI to reflect changes in locationName
  }
}
