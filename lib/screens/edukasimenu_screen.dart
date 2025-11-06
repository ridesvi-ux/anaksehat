import 'package:anak_sehat_proyek/screens/edukasi_one.dart';
import 'package:anak_sehat_proyek/screens/edukasi_there.dart';
import 'package:anak_sehat_proyek/screens/edukasi_two.dart';
import 'package:flutter/material.dart';

class EdukasiPage extends StatelessWidget {
  const EdukasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Header Edukasi dengan gambar PNG
          Center(
            child: Image.asset(
              'assets/images/edukasi.png',
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Button Apa itu Stunting
                  GestureDetector(
                    onTap: () {
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StuntingInfoPage(),
                                ),
                              );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/btnapaitustunting.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Button Tips Mencegah Stunting
                  GestureDetector(
                    onTap: () {
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TipsMencegahStuntingPage(),
                                ),
                              );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/btntips.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Button Nutrisi & Gizi Anak
                  GestureDetector(
                    onTap: () {
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NutrisiGiziAnakPage(),
                                ),
                              );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/btngizi.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Tombol Kembali
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E88E5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Kembali',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}