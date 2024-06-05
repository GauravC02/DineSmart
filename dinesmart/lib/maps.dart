import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng currentLocation = LatLng(0, 0); // Default location
  String locationName = ""; // Location name initialized as empty
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    _setCurrentLocation();
  }

  // Method to set the current location to the user's current location
  void _setCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
    _getAddressFromLatLng(currentLocation);
    // Listen to location changes and update currentLocation
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
      _getAddressFromLatLng(currentLocation);
    });
  }

  // Method to get address from latitude and longitude
  void _getAddressFromLatLng(LatLng latLng) async {
    // Use geocoding to fetch the address from coordinates if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 14.0,
        ),
        markers: {}, // Remove all markers
        onTap: _handleTap,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Method to handle taps on the map
  void _handleTap(LatLng tappedPoint) {
    // Handle taps on the map if needed
  }
}

class CustomOverlay extends StatefulWidget {
  final String overlayId;
  final Function(BuildContext) overlayWidgetBuilder;
  final LatLng position;

  CustomOverlay({
    required this.overlayId,
    required this.overlayWidgetBuilder,
    required this.position,
  });

  @override
  _CustomOverlayState createState() => _CustomOverlayState();
}

class _CustomOverlayState extends State<CustomOverlay> {
  @override
  Widget build(BuildContext context) {
    final overlayWidget = widget.overlayWidgetBuilder(context);
    final overlay = OverlayEntry(
      builder: (context) => Positioned(
        left: widget.position.latitude,
        top: widget.position.longitude,
        child: overlayWidget,
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Overlay.of(context)?.insert(overlay);
    });

    return SizedBox.shrink();
  }
}
