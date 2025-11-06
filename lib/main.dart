import 'package:anak_sehat_proyek/screens/formandresult_screen.dart';
import 'package:anak_sehat_proyek/screens/home_screen.dart';
import 'package:anak_sehat_proyek/screens/onboarding_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      // SOLUSI 1: Ganti home ke Onboarding kalau mau mulai dari onboarding
      // atau ke HomeScreen kalau mau langsung ke home
      home: const Onboarding_screen(), // Atau HomeScreen()
      
      // SOLUSI 2: Pakai named routes (lebih proper)
      initialRoute: '/onboarding', // atau '/home'
      routes: {
        '/onboarding': (context) => const Onboarding_screen(),
        '/home': (context) => const HomeScreen(),
        '/form': (context) => const FormPage(),
      },
    );
  }
}