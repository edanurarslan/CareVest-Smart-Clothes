# CareVest: Akıllı Kıyafet Uygulaması

CareVest, kullanıcıların sağlık verilerini anlık olarak takip etmelerini sağlayan akıllı bir kıyafet uygulamasıdır. Uygulama, **nabız, vücut sıcaklığı, tansiyon ve düşme durumu** gibi sağlık verilerini **Firebase Firestore** üzerinden çeker ve kullanıcıya sunar. Aynı zamanda **konum servisi** ile Google Maps API kullanarak kullanıcının mevcut konumunu gösterir.

## 📌 Proje İçeriği
- ✅ **Kullanıcı Girişi & Kayıt**: Firebase Authentication ile kullanıcı girişi ve çıkışı
- ✅ **Gerçek Zamanlı Sağlık Verileri**: Firestore’dan sağlık verilerini çekme
- ✅ **Konum Servisi**: Kullanıcının mevcut konumunun harita üzerinde gösterilmesi
- ✅ **Düşme Algılama**: Kullanıcının düşme durumu Firestore’dan çekilir
- ✅ **Estetik UI**: Kullanıcı dostu modern arayüz
- ✅ **Splash Screen**: Açılışta CareVest logosunun animasyonlu gösterimi
- ✅ **Çıkış Onayı**: Kullanıcı çıkış yaparken onay sorulması

---

## 🚀 Kullanılan Teknolojiler
| Teknoloji | Açıklama |
|-----------|---------|
| **Flutter** | Mobil uygulama geliştirme çerçevesi |
| **Firebase Authentication** | Kullanıcı kimlik doğrulama |
| **Firebase Firestore** | Gerçek zamanlı veri tabanı |
| **Google Maps API** | Harita ve konum servisleri |
| **Geolocator** | Kullanıcının konum bilgisini alma |
| **Flutterfire CLI** | Firebase entegrasyonu için |

---

## 🛠 Kurulum ve Çalıştırma
### **Gereksinimler**
- Flutter SDK ✅
- Android Studio veya VS Code ✅
- Firebase Projesi oluşturulmuş ✅
- Firebase Firestore ve Authentication etkinleştirilmiş ✅


### **Firebase Yapılandırması**
1. **Firebase Console'da** yeni bir proje oluşturun: [Firebase Console](https://console.firebase.google.com/)
2. **Authentication > Oturum Açma Yöntemleri** kısmından **E-posta/Şifre** doğrulamasını açın.
3. **Firestore Database** kısmından **Veritabanı Kurulumu** yapın ve aşağıdaki formatta veri ekleyin:
   ```
   health_data (koleksiyon)
      ├── userId (doküman)
          ├── heartRate: 75
          ├── bodyTemperature: 36.5
          ├── bloodPressure: "120/80"
          ├── hasFallen: false
   ```
4. **Google Maps API** ve **Geolocation API** anahtarlarını alın ve `AndroidManifest.xml` dosyanıza ekleyin.

### **Firebase Konfigürasyonunu Yükleyin**
```sh
flutterfire configure
```
📌 Bu işlem, `firebase_options.dart` dosyanızı oluşturacaktır.

### **Bağımlılıkları Yükleyin**
```sh
flutter pub get
```

### **Uygulamayı Çalıştırın**
#### **📱 Android / iOS Emülatörde Çalıştırma**
```sh
flutter run
```

#### **🌐 Web Tarayıcısında Çalıştırma**
```sh
flutter run -d chrome
```

---

## 📲 **Ekran Görüntüleri**
| Ana Sayfa | Kullanıcı Girişi | Sağlık Verileri |
|-----------|-----------------|----------------|
| ![Ana Sayfa](https://via.placeholder.com/150) | ![Giriş Ekranı](https://via.placeholder.com/150) | ![Veri Görüntüleme](https://via.placeholder.com/150) |

---

## 🎨 **Uygulama Özellikleri**
### 🔑 **Kullanıcı Kimlik Doğrulama**
- Firebase Authentication kullanarak kullanıcı girişi ve kayıt işlemleri.
- Giriş ekranı **şifre sıfırlama özelliği** içerir.

### 📊 **Gerçek Zamanlı Sağlık Takibi**
- **Düşme Algılama**: Kullanıcının düşme durumu Firestore'dan anlık olarak alınır.
- **Sağlık Verileri**: Nabız, vücut sıcaklığı ve tansiyon bilgileri Firebase üzerinden gösterilir.

### 🗺 **Konum Servisi**
- Google Maps API kullanılarak kullanıcının mevcut konumu harita üzerinde gösterilir.

### ✨ **Splash Screen**
- Uygulama açıldığında **CareVest logosu süslü bir şekilde ekranda belirir** ve ardından giriş ekranına yönlendirilir.

### 🔒 **Çıkış Onay Ekranı**
- Kullanıcı çıkış yaparken **"Çıkış yapmak istediğinize emin misiniz?"** şeklinde bir onay penceresi açılır.

---

## 🔥 **Geliştirme Yol Haritası**
✅ Firebase Authentication eklendi  
✅ Sağlık verileri Firestore üzerinden çekildi  
✅ Google Maps API entegre edildi  
✅ Splash Screen ve estetik UI eklendi  
🔜 **Acil durum bildirimleri (örn: düşme anında SMS veya bildirim gönderme)**  
🔜 **iOS desteği eklenmesi**  

---

## 📜 **Lisans**
Bu proje **MIT Lisansı** altında sunulmaktadır.
