import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // Bildirim izinlerini al
    NotificationSettings settings = await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("📢 Bildirim izinleri verildi.");
    } else {
      log("⚠️ Bildirim izinleri reddedildi.");
    }

    // Firebase Token al ve yazdır
    String? token = await _firebaseMessaging.getToken();
    log("🔥 FCM Token: $token");

    // Bildirimleri dinle
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("📩 Bildirim Alındı: ${message.notification?.title}");
      _showNotification(message.notification?.title ?? "Uyarı",
          message.notification?.body ?? "Detaylara bakın.");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("📲 Kullanıcı bildirime tıkladı!");
    });
  }

  // 🔔 **Bildirim Gösterme Fonksiyonu**
  void _showNotification(String title, String body) async {
    var androidDetails = const AndroidNotificationDetails(
      'critical_alerts', 'Kritik Sağlık Uyarıları',
      importance: Importance.high, priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);
    await _flutterLocalNotificationsPlugin.show(
      0, title, body, notificationDetails,
    );
  }
}
