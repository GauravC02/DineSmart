import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late LatLng currentLocation =
      LatLng(27.7172, 85.3240); // Default coordinates for Kathmandu
  String locationName = "";
  late GoogleMapController mapController;
  LatLng? deliveryLocation;
  late StreamSubscription<Position> positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _initializeCurrentLocation();
    positionStreamSubscription =
        Geolocator.getPositionStream().listen((position) {
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
      _getAddressFromLatLng(currentLocation);
    });
  }

  @override
  void dispose() {
    positionStreamSubscription.cancel();
    super.dispose();
  }

  Future<void> _initializeCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
    _getAddressFromLatLng(currentLocation);
  }

  // Method to get address from latitude and longitude
  void _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            "${placemark.street}, ${placemark.locality}, ${placemark.country}";
        setState(() {
          // Do not update locationName here
        });
      } else {
        setState(() {
          locationName = "";
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 14.0,
              ),
              markers: {
                if (deliveryLocation != null)
                  Marker(
                    markerId: MarkerId('pin'),
                    position: deliveryLocation!,
                    infoWindow: InfoWindow(
                      title:
                          locationName, // Display the location name above the pin
                      anchor: Offset(0.5,
                          -0.5), // Adjust the anchor point to position the info window above the marker
                    ),
                  ),
              },
              onTap: _handleTap,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (deliveryLocation == null) {
                  // Show a popup dialog to the user to choose an address
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Please choose a delivery address.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Execute logic to confirm delivery address
                  _confirmAddress();
                }
              },
              child: Text('Confirm Address'),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Method to handle taps on the map
  void _handleTap(LatLng tappedPoint) {
    setState(() {
      deliveryLocation = tappedPoint;
    });
    _getAddressFromLatLng(tappedPoint);
    // Fetch the address immediately after setting deliveryLocation
    _fetchAddressForLocation(tappedPoint);
  }

  // Method to fetch the address for the tapped location and update locationName
  void _fetchAddressForLocation(LatLng latLng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            "${placemark.street}, ${placemark.locality}, ${placemark.country}";
        setState(() {
          locationName = address;
        });
      } else {
        setState(() {
          locationName = "";
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // Method to confirm the address and navigate back to CheckoutPage
  void _confirmAddress() {
    // Pass the chosen deliveryLocation back to the previous screen
    Navigator.pop(context, deliveryLocation);
  }
}
