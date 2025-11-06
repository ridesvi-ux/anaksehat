import 'package:anak_sehat_proyek/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:anak_sehat_proyek/screens/home_screen.dart';


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
                  'assets/images/1.png',
                  fit: BoxFit.contain,
               
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
 
              const Text(
                'Selamat datang Orang tua Hebat di aplikasi untuk membantu orang tua memantau tumbuh kembang anak dan mencegah stunting sejak dini.',
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
                    GestureDetector(
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  },
  child: const Text(
    'Lewati',
    style: TextStyle(
      fontSize: 18,
      color: Color(0xFF2196F3),
      fontWeight: FontWeight.w500,
    ),
  ),
),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Onboarding_screen(),
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
 
class SmilePainter extends CustomPainter {
  final double curveDepth;  
  final double dotSize;  

  const SmilePainter({this.curveDepth = 2, this.dotSize = 3.0});

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
