/*import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/settings.dart';
import 'screens/about.dart';
import 'screens/maps.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Key eklendi ✅

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
        '/maps': (context) => const MapsScreen(), // Harita sayfası eklendi
      },
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase yapılandırma dosyası

// Sayfa importları
import 'screens/home.dart';
import 'screens/settings.dart';
import 'screens/about.dart';
import 'screens/maps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 📌 Firebase'in doğru şekilde başlatıldığından emin olalım
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akıllı Kıyafet Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
        '/maps': (context) => const MapsScreen(), // 🌍 Harita sayfası eklendi
      },
    );
  }
}
