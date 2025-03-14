import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreTestScreen extends StatefulWidget {
  const FirestoreTestScreen({super.key});

  @override
  FirestoreTestScreenState createState() => FirestoreTestScreenState();
}

class FirestoreTestScreenState extends State<FirestoreTestScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _controller = TextEditingController();

  // 📌 Firestore’a mesaj ekleyen fonksiyon
  Future<void> _addData() async {
    String text = _controller.text;
    if (text.isNotEmpty) {
      try {
        print("📡 Firestore’a mesaj ekleniyor...");
        await _firestore.collection('messages').add({
          'text': text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _controller.clear();
        print("✅ Mesaj Firestore’a başarıyla eklendi!");
      } catch (e) {
        print("❌ Firestore Hata: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Hata: Firestore’a veri eklenemedi!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Test')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Mesaj Gir',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addData,
            child: const Text('Firebase’e Mesaj Ekle'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  print("❌ Firestore Okuma Hatası: ${snapshot.error}");
                  return Center(child: Text("Hata: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  print("⚠️ Firestore'da hiç mesaj yok!");
                  return const Center(child: Text("Henüz mesaj yok!"));
                }
                print("✅ Firestore'dan veri alındı, ${snapshot.data!.docs.length} mesaj var.");
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Card(
                      child: ListTile(
                        title: Text(document['text']),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
