import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapBottomSheet extends StatefulWidget {
  final Function(String) onLocationSelected;

  const MapBottomSheet({Key? key, required this.onLocationSelected}) : super(key: key);

  @override
  _MapBottomSheetState createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {
  LatLng? _selectedLocation;
  String _selectedAddress = "Fetching current location...";
  GoogleMapController? _mapController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _selectedAddress = "Location services are disabled.";
        _isLoading = false;
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _selectedAddress = "Location permission denied.";
          _isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _selectedAddress = "Location permissions are permanently denied.";
        _isLoading = false;
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _selectedLocation = currentLatLng;
        _selectedAddress = "${position.latitude}, ${position.longitude}";
        _isLoading = false;
      });

      if (_mapController != null) {
        _mapController!.animateCamera(CameraUpdate.newLatLngZoom(currentLatLng, 15));
      }
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _selectedAddress = "Failed to get current location.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          Text("Pick Location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _selectedLocation ?? LatLng(37.7749, -122.4194),
                      zoom: 15,
                    ),
                    onMapCreated: (controller) {
                      setState(() {
                        _mapController = controller;
                      });
                      if (_selectedLocation != null) {
                        _mapController!.animateCamera(CameraUpdate.newLatLngZoom(_selectedLocation!, 15));
                      }
                    },
                    onTap: (position) {
                      setState(() {
                        _selectedLocation = position;
                        _selectedAddress = "${position.latitude}, ${position.longitude}";
                      });
                    },
                    markers: _selectedLocation != null
                        ? {
                            Marker(
                              markerId: MarkerId("selected"),
                              position: _selectedLocation!,
                              infoWindow: InfoWindow(title: "Selected Location"),
                            ),
                          }
                        : {},
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Selected Location:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(_selectedAddress, textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedLocation != null) {
                      widget.onLocationSelected(_selectedAddress);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Confirm Location"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
