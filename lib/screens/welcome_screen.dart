import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Logo di atas
              const SizedBox(height: 40),
              const Text(
                'SehatAnak',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2196F3),
                  letterSpacing: 0.5,
                ),
              ),

              // Garis melengkung bawah logo (smile) + titik
              Container(
                width: 80,
                height: 20, // Naikin tinggi biar lengkungan keliatan
                margin: const EdgeInsets.only(top: 1),
                child: CustomPaint(
                  painter: SmilePainter(
                    curveDepth: 2.5, // ATUR LENGKUNGAN DI SINI
                    dotSize: 3.0,    // ATUR UKURAN TITIK DI SINI
                  ),
                ),
              ),

              const Spacer(),

              // Gambar ilustrasi family
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/1.png',
                  fit: BoxFit.contain,
                  // Kalo gambarnya belum ada, ganti pake placeholder
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.family_restroom,
                        size: 120,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),

              // Text Selamat Datang!
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Deskripsi
              const Text(
                'Selamat datang Orang tua Hebat di aplikasi untuk membantu orang tua memantau tumbuh kembang anak dan mencegah stunting sejak dini.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2196F3),
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Tombol Lewati
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Lewati',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2196F3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Navigasi ke halaman selanjutnya
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
                        print('Button pressed!');
                      },
                      backgroundColor: const Color(0xFF2196F3),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom painter buat garis smile di bawah logo
class SmilePainter extends CustomPainter {
  final double curveDepth; // Kedalaman lengkungan
  final double dotSize;    // Ukuran titik

  const SmilePainter({
    this.curveDepth = 2,
    this.dotSize = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Gambar garis lengkung
    final paint = Paint()
      ..color = const Color(0xFF2196F3)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, 0);

    path.quadraticBezierTo(
      size.width / 2,           // Titik kontrol X (tengah)
      size.height * curveDepth, // Titik kontrol Y (kedalaman)
      size.width,               // Titik akhir X (kanan)
      0,                        // Titik akhir Y (atas)
    );

    canvas.drawPath(path, paint);

    // Gambar titik di tengah lengkungan
    final dotPaint = Paint()
      ..color = const Color(0xFF2196F3)
      ..style = PaintingStyle.fill;

    // Hitung posisi titik di tengah kurva
    final dotX = size.width / 2;
    final dotY = size.height * curveDepth * 0.2; // 75% dari kedalaman

    // Gambar lingkaran kecil
    canvas.drawCircle(
      Offset(dotX, dotY),
      dotSize, // Ukuran titik
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}