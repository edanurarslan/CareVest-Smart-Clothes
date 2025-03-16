import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer'; // 📌 Loglama için kullanılıyor

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;
  LatLng? _currentPosition; // Kullanıcının mevcut konumu
  bool _isMapReady = false; // 📌 Harita yüklendi mi?

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 📌 Konumu alma fonksiyonu
  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || 
          permission == LocationPermission.deniedForever) {
        log("⚠️ Konum izni reddedildi!");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Konum izni verilmedi! Lütfen ayarlardan izin verin.")),
          );
        }
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isMapReady = true; // 📌 Harita artık hazır
      });

      log("📍 Konum alındı: ${position.latitude}, ${position.longitude}");
    } catch (e) {
      log("❌ Konum alma hatası: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Hata: Konum alınamadı! $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konum")),
      body: Column(
        children: [
          // 📌 Kullanıcının konum bilgisini ekrana yazdırıyoruz
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _currentPosition == null
                ? const Text("Konum alınıyor...")
                : Text(
                    "📍 Enlem: ${_currentPosition!.latitude}, Boylam: ${_currentPosition!.longitude}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
          ),
          Expanded(
            child: _isMapReady
                ? GoogleMap(
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
                    myLocationEnabled: true,
                    compassEnabled: true,
                    zoomControlsEnabled: true,
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
