// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_page/Interface/signup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'firebase_options.dart';
import 'Interface/login.dart';
import 'Screens/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2D3E50),
          primary: const Color(0xFF2D3E50),
          secondary: const Color(0xFF3498DB),
          surface: const Color(0xFFECF0F1),
          background: const Color(0xFFF8F9FA),
        ),
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontFamily: 'Lora-VariableFont',
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF2D3E50)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: 'Lora-VariableFont',
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/location': (context) => const LocationPage(),
      },
      onGenerateRoute: (settings) {
        // Handle any undefined routes
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}