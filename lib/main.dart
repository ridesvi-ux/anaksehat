import 'package:anak_sehat_proyek/screens/formandresult_screen.dart';
import 'package:anak_sehat_proyek/screens/home_screen.dart';
import 'package:anak_sehat_proyek/screens/onboarding_screen.dart';
import 'package:anak_sehat_proyek/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

// Import semua screen yang lu punya
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatAnak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
      home: const WelcomeScreen(), // ✅ Halaman pertama
    );
  }
}
