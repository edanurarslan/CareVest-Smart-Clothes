import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Key eklendi ✅

  @override
  HomeScreenState createState() => HomeScreenState(); // Private class kaldırıldı
}

class HomeScreenState extends State<HomeScreen> {
  // Şimdilik sahte veriler (dummy data)
  bool hasFallen = false; // Düşme durumu
  int heartRate = 75; // Nabız (bpm)
  double bodyTemperature = 36.5; // Vücut sıcaklığı (°C)
  String bloodPressure = "120/80"; // Tansiyon (mmHg)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sağlık Takip Uygulaması"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, "/settings");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 20),
            _buildHealthInfoCard("❤️ Nabız", "$heartRate bpm"),
            _buildHealthInfoCard("🌡 Vücut Sıcaklığı", "$bodyTemperature °C"),
            _buildHealthInfoCard("🔵 Tansiyon", bloodPressure),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/about");
              },
              child: const Text("Hakkında"),
            ),
          ],
        ),
      ),
    );
  }

  // Düşme durumu kartı
  Widget _buildStatusCard() {
    return Card(
      color: hasFallen ? Colors.redAccent : Colors.greenAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Düşme Durumu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              hasFallen ? "🔴 DÜŞME ALGILANDI!" : "🟢 GÜVENDE",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Genel sağlık bilgisi kartları (Nabız, Tansiyon, Sıcaklık)
  Widget _buildHealthInfoCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.health_and_safety, size: 40, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
