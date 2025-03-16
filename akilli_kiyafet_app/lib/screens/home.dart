import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'maps.dart';
import 'settings.dart';
import 'about.dart';
import 'splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? healthData;

  @override
  void initState() {
    super.initState();
    _fetchHealthData();
  }

  Future<void> _fetchHealthData() async {
    String? userId = _auth.currentUser?.uid;
    if (userId == null) return;

    try {
      _firestore.collection('health_data').doc(userId).snapshots().listen((snapshot) {
        if (snapshot.exists) {
          setState(() {
            healthData = snapshot.data();
          });
        }
      });
    } catch (e) {
      print("🔥 Firebase Hatası: $e");
    }
  }

  Future<bool> _showLogoutDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Çıkış Yap"),
            content: const Text("Oturumu kapatmak istediğinizden emin misiniz?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("İptal"),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
                    (route) => false,
                  );
                },
                child: const Text("Evet"),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sağlık Takip Uygulaması"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: healthData == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatusCard(),
                  const SizedBox(height: 20),
                  _buildHealthInfoCard("❤️ Nabız", "${healthData!['heartRate']} bpm"),
                  _buildHealthInfoCard("🌡 Vücut Sıcaklığı", "${healthData!['bodyTemperature']} °C"),
                  _buildHealthInfoCard("🔵 Tansiyon", healthData!['bloodPressure']),
                  const SizedBox(height: 20),
                  _buildNavigationButton("🔧 Ayarlar", const SettingsScreen()),
                  _buildNavigationButton("🌍 Konumu Göster", const MapsScreen()),
                  _buildNavigationButton("ℹ️ Hakkında", const AboutScreen()),
                ],
              ),
      ),
    );
  }

  Widget _buildStatusCard() {
    bool hasFallen = healthData?['hasFallen'] ?? false;
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

  Widget _buildNavigationButton(String text, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(text),
    );
  }
}
