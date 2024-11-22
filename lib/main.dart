//main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:weatherapplication/screen/home_screen.dart';
import 'package:weatherapplication/screen/registration_screen.dart';
import 'Screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for web or other platforms
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA0WNco2nu5YrT0rgbY_L_q2nLt0AXOdW8",
          authDomain: "weatherapi-3eb95.firebaseapp.com",
          projectId: "weatherapi-3eb95",
          storageBucket: "weatherapi-3eb95.firebasestorage.app",
          messagingSenderId: "747646588639",
          appId: "1:747646588639:web:15c0638647ab6b87d9bb6a",
          measurementId: "G-E3ZLTBYTQ6"
      ),
    );
  } else {
    await Firebase.initializeApp(); // For mobile platforms
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}