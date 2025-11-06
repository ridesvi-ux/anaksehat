import 'package:flutter/material.dart';

class TipsMencegahStuntingPage extends StatelessWidget {
  const TipsMencegahStuntingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Header dengan gambar PNG
              Center(
                child: Image.asset(
                  'assets/images/tips.png',
                  width: 320,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              // Deskripsi
              const Text(
                'Pencegahan stunting meliputi pemberian ASI eksklusif, pemberian Makanan Pendamping ASI (MPASI) yang kaya protein hewani, serta pemantauan tumbuh kembang anak secara rutin di Posyandu. Ibu hamil harus menjaga nutrisi dengan mengonsumsi tablet tambah darah dan rutin memerikasakan kehamilan. Selain itu, penerapan Perilaku Hidup Bersih dan Sehat (PHBS) seperti cuci tangan pakai sabun dan sanitasi yang baik sangat penting',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1E88E5),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              // Section Untuk ibu hamil
              const Text(
                'Untuk ibu hamil',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'Konsumsi gizi seimbang: Penuhi kebutuhan nutrisi harian dan pastikan mengonsumsi makanan yang mengandung zat besi, asam folat, dan kalsium.',
              ),
              _buildBulletPoint(
                'Minum tablet tambah darah (TTD): Konsumsi TTD secara rutin sesuai anjuran (minimal 90 tablet selama kehamilan).',
              ),
              _buildBulletPoint(
                'Periksa kehamilan secara rutin: Lakukan pemeriksaan kehamilan minimal 6 kali, di mana 2 kali di antaranya harus oleh dokter menggunakan USG.',
              ),
              const SizedBox(height: 30),
              // Section Untuk bayi dan anak
              const Text(
                'Untuk bayi dan anak',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'ASI eksklusif: Berikan ASI eksklusif selama 6 bulan pertama kelahiran.',
              ),
              _buildBulletPoint(
                'MPASI yang bergizi: Lanjutkan dengan pemberian ASI dan MPASI setelah usia 6 bulan, pastikan MPASI kaya protein hewani seperti ikan, telur, atau daging.',
              ),
              _buildBulletPoint(
                'Timbang dan ukur berat badan: Bawa anak ke Posyandu setiap bulan untuk memantau pertumbuhan dan perkembangannya.',
              ),
              _buildBulletPoint(
                'Lengkapi imunisasi: Pastikan anak mendapatkan imunisasi dasar lengkap.',
              ),
              _buildBulletPoint(
                'Stimulasi dini: Berikan stimulasi pada anak sejak dalam kandungan hingga masa balita untuk merangsang perkembangan motorik, kognitif, dan emosionalnya.',
              ),
              const SizedBox(height: 40),
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
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Icon(
              Icons.circle,
              size: 6,
              color: Color(0xFF1E88E5),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF1E88E5),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}