import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF2196F3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bagaimana kabar sikecil?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    Container(
                      width: 80,
                      height: 30,
                      child: CustomPaint(
                        painter: SmilePainter(
                          color: Colors.white,
                          curveDepth: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fitur Utama',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    const SizedBox(height: 20),
 
                    Row(
                      children: [
                        Expanded(
                          child: _buildMenuCard(
                            icon: Icons.child_care,
                            title: 'Cek Pertumbuhan\nAnak',
                            onTap: () {
                              print('Navigate to Cek Pertumbuhan');
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildMenuCard(
                            icon: Icons.menu_book,
                            title: 'Edukasi Gizi',
                            onTap: () {
                              print('Navigate to Edukasi Gizi');
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
 
                    const Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    const SizedBox(height: 20),
 
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildSummaryRow(
                            'Nama Anak',
                            'Okami Urslan',
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryRow(
                            'Berat Badan',
                            '14 Kg',
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryRow(
                            'Tinggi Badan',
                            '95 Cm',
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryRow(
                            'Usia',
                            '1 Tahun',
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryRow(
                            'Status Gizi',
                            'Risiko Stunting Rendah',
                            isStatus: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: const Color(0xFF2196F3),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2196F3),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isStatus = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Text(
          ':',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF2196F3),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2196F3),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (isStatus)
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// Custom painter buat garis smile
class SmilePainter extends CustomPainter {
  final Color color;
  final double curveDepth;

  const SmilePainter({
    this.color = Colors.white,
    this.curveDepth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, 0);

    path.quadraticBezierTo(
      size.width / 2,
      size.height * curveDepth,
      size.width,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}