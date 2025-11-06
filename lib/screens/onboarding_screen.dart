import 'package:anak_sehat_proyek/screens/third_onboarding.dart';
import 'package:flutter/material.dart';

class Onboarding_screen extends StatelessWidget {
  const Onboarding_screen({Key? key}) : super(key: key);

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
 
              Container(
                width: 80,
                height: 20,
                margin: const EdgeInsets.only(top: 1),
                child: CustomPaint(
                  painter: SmilePainter(
                    curveDepth: 2.5,
                    dotSize: 3.0,
                  ),
                ),
              ),

              const Spacer(),
 
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/2.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.height,
                        size: 120,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),
 
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cek Pertumbuhan Anak',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 16),
 
              const Text(
                'Masukkan data anak seperti umur, tinggi, dan berat badan untuk kami bantu analisis apakah pertumbuhannya sudah sesuai.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2196F3),
                  height: 1.5,
                ),
              ),

              const Spacer(), 
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol Lewati di kiri
                    const Text(
                      'Lewati',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2196F3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
 
                    Row(
                      children: [ 
                        FloatingActionButton(
                          heroTag: 'back_btn',
                          backgroundColor: const Color(0xFF2196F3),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
 
                        FloatingActionButton(
                          heroTag: 'next_btn',
                          backgroundColor: const Color(0xFF2196F3),
                          onPressed: () {
                            Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ThirdOnboarding(),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                          ),
                        );
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
class SmilePainter extends CustomPainter {
  final double curveDepth;
  final double dotSize;

  const SmilePainter({
    this.curveDepth = 1.5,
    this.dotSize = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2196F3)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, 0);

    path.quadraticBezierTo(
      size.width / 2,
      size.height * curveDepth,
      size.width,
      0,
    );

    canvas.drawPath(path, paint);

    final dotPaint = Paint()
      ..color = const Color(0xFF2196F3)
      ..style = PaintingStyle.fill;

    final dotX = size.width / 2;
    final dotY = size.height * curveDepth * 0.2;

    canvas.drawCircle(
      Offset(dotX, dotY),
      dotSize,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
