# ENG:

# **CareVest: Smart Clothing Application**

CareVest is a **smart clothing application** that enables users to monitor their health data in real time. The app retrieves **heart rate, body temperature, blood pressure, and fall detection** data from **Firebase Firestore** and presents it to the user. Additionally, it integrates with the **Google Maps API** to display the user's current location.

---

## 📌 **Project Features**
- ✅ **User Authentication & Registration**: User login and logout with Firebase Authentication
- ✅ **Real-time Health Data**: Fetching health data from Firestore
- ✅ **Location Services**: Displaying the user's current location on a map
- ✅ **Fall Detection**: Detecting falls and fetching data from Firestore
- ✅ **Modern UI Design**: A user-friendly and visually appealing interface
- ✅ **Splash Screen**: Animated CareVest logo displayed at app startup
- ✅ **Logout Confirmation**: Asking users for confirmation before logging out

---

## 🚀 **Technologies Used**
| Technology | Description |
|------------|------------|
| **Flutter** | Mobile app development framework |
| **Firebase Authentication** | User authentication management |
| **Firebase Firestore** | Real-time NoSQL database |
| **Google Maps API** | Mapping and location services |
| **Geolocator** | Fetching user location |
| **Flutterfire CLI** | Firebase integration tool for Flutter |

---

## 🛠 **Installation & Running the Project**
### **Prerequisites**
- Flutter SDK ✅
- Android Studio or VS Code ✅
- Firebase Project ✅
- Firestore Database & Authentication enabled ✅

### **Setting Up Firebase**
1. **Create a new project** in [Firebase Console](https://console.firebase.google.com/).
2. Go to **Authentication > Sign-in Methods** and enable **Email/Password authentication**.
3. In **Firestore Database**, create the following structure:
   ```
   health_data (collection)
      ├── userId (document)
          ├── heartRate: 75
          ├── bodyTemperature: 36.5
          ├── bloodPressure: "120/80"
          ├── hasFallen: false
   ```
4. Obtain **Google Maps API** and **Geolocation API** keys and add them to `AndroidManifest.xml`.

### **Configure Firebase**
```sh
flutterfire configure
```
📌 This command generates the `firebase_options.dart` file.

### **Install Dependencies**
```sh
flutter pub get
```

### **Run the Application**
#### **📱 Run on Android/iOS Emulator**
```sh
flutter run
```

#### **🌐 Run on Web Browser**
```sh
flutter run -d chrome
```

---

## 📲 **Screenshots**
| Home Screen | Login Screen | Health Data |
|------------|-------------|------------|
| ![Home](https://via.placeholder.com/150) | ![Login](https://via.placeholder.com/150) | ![Health Data](https://via.placeholder.com/150) |

---

## 🎨 **App Features**
### 🔑 **User Authentication**
- User login, registration, and logout with **Firebase Authentication**.
- **Password reset** functionality in the login screen.

### 📊 **Real-Time Health Monitoring**
- **Fall Detection**: Retrieves fall detection data from Firestore in real time.
- **Health Data Display**: Fetches and displays heart rate, body temperature, and blood pressure from Firebase.

### 🗺 **Location Services**
- Uses the **Google Maps API** to display the user’s real-time location.

### ✨ **Splash Screen**
- When the app starts, the **CareVest logo appears with an animation**, then redirects to the login screen.

### 🔒 **Logout Confirmation**
- When a user logs out, a **confirmation dialog** asks: *"Are you sure you want to log out?"* before proceeding.

---

## 🔥 **Development Roadmap**
✅ Firebase Authentication integrated  
✅ Health data fetched from Firestore  
✅ Google Maps API integration completed  
✅ Splash screen and modern UI design added  
🔜 **Emergency notifications (e.g., sending SMS or push notifications upon fall detection)**  
🔜 **iOS support implementation**  

---

## 📜 **License**
This project is licensed under the **MIT License**.  

---

# TR:

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
