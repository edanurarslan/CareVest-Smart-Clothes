import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key}); // Key eklendi ✅

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bağlantı Seçenekleri",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Wifi veya Bluetooth bağlantı ayarları buraya gelecek
              },
              child: const Text("Bağlantıyı Ayarla"),
            ),
          ],
        ),
      ),
    );
  }
}
