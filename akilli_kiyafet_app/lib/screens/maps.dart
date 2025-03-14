import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;
  LatLng? _currentPosition; // Kullanıcının konumu

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Konumu alma fonksiyonu
  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konum")),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("current_location"),
                  position: _currentPosition!,
                  infoWindow: const InfoWindow(title: "Mevcut Konum"),
                )
              },
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              myLocationEnabled: true, // Kullanıcının konumunu göster
              compassEnabled: true, // Pusula göstergesi
              zoomControlsEnabled: true, // Zoom butonları
            ),
    );
  }
}
