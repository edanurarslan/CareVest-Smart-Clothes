import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';
import 'screens/home.dart';
import 'screens/settings.dart';
import 'screens/maps.dart';
import 'screens/about.dart';
import 'theme.dart'; // 📌 Tema dosyası
import 'services/firebase_messaging_service.dart'; // 📌 Bildirim servisi

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 📌 Firebase bildirimlerini başlat
  FirebaseMessagingService().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CareVest',
      theme: appTheme, // 📌 Tema dosyası
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/maps': (context) => const MapsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
