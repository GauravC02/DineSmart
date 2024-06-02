import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import Google Maps Flutter

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(27.7172, 85.324), // Kathmandu, Nepal
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          // Handle the map controller if needed
        },
      ),
    );
  }
}
