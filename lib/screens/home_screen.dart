import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'formandresult_screen.dart';
import 'edukasimenu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Data default
  Map<String, dynamic> _summaryData = {
    'hasData': false,
    'nama': '-',
    'berat': 0.0,
    'tinggi': 0.0,
    'usia': 0,
    'statusGizi': '-',
    'risikoStunting': '-',
  };

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  // FUNGSI BUAT LOAD DATA DARI SHARED PREFERENCES
  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDataString = prefs.getString('lastCheckupData');
    
    if (savedDataString != null) {
      final savedData = json.decode(savedDataString);
      setState(() {
        _summaryData = savedData;
      });
    }
  }

  String _formatUsia(int usiaBulan) {
    if (usiaBulan == 0) return '-';
    if (usiaBulan < 12) {
      return '$usiaBulan Bulan';
    } else {
      int tahun = usiaBulan ~/ 12;
      int bulan = usiaBulan % 12;
      if (bulan == 0) {
        return '$tahun Tahun';
      } else {
        return '$tahun Tahun $bulan Bulan';
      }
    }
  }

  Color _getStatusColor(String status) {
    if (status == '-') return Colors.grey;
    if (status.contains('Normal') || status.contains('Rendah')) {
      return Colors.green;
    } else if (status.contains('Sedang')) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header biru dengan greeting
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
                    // Smile icon
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: CustomPaint(
                        painter: SmilePainter(
                          color: Colors.white,
                          curveDepth: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Fitur Utama
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

                    // Grid 2 menu
                    Row(
                      children: [
                        Expanded(
                          child: _buildMenuCard(
                            icon: Icons.child_care,
                            title: 'Cek Pertumbuhan\nAnak',
                            onTap: () async {
                              // Navigate ke form dan refresh data saat balik
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormPage(),
                                ),
                              );
                              // Reload data setelah balik dari form
                              _loadSavedData();
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildMenuCard(
                            icon: Icons.menu_book,
                            title: 'Edukasi Gizi',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EdukasiPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Summary
                    const Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Summary Card - TAMPIL DINAMIS
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
                      child: _summaryData['hasData'] == true
                          ? Column(
                              children: [
                                _buildSummaryRow(
                                  'Nama Anak',
                                  _summaryData['nama'],
                                ),
                                const SizedBox(height: 16),
                                _buildSummaryRow(
                                  'Berat Badan',
                                  '${_summaryData['berat']} Kg',
                                ),
                                const SizedBox(height: 16),
                                _buildSummaryRow(
                                  'Tinggi Badan',
                                  '${_summaryData['tinggi']} Cm',
                                ),
                                const SizedBox(height: 16),
                                _buildSummaryRow(
                                  'Usia',
                                  _formatUsia(_summaryData['usia']),
                                ),
                                const SizedBox(height: 16),
                                _buildSummaryRow(
                                  'Status Gizi',
                                  _summaryData['statusGizi'],
                                  isStatus: true,
                                ),
                                const SizedBox(height: 16),
                                _buildSummaryRow(
                                  'Risiko Stunting',
                                  _summaryData['risikoStunting'],
                                  isStatus: true,
                                ),
                              ],
                            )
                          : _buildNoDataWidget(),
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

  // WIDGET KALAU BELUM ADA DATA
  Widget _buildNoDataWidget() {
    return Column(
      children: [
        Icon(
          Icons.inbox_outlined,
          size: 80,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 16),
        Text(
          'Belum Ada Data',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Silakan cek pertumbuhan anak\nterlebih dahulu',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormPage(),
              ),
            );
            _loadSavedData();
          },
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            'Cek Sekarang',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2196F3),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
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
            label,
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
                  decoration: BoxDecoration(
                    color: _getStatusColor(value),
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