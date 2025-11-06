import 'package:flutter/material.dart';

class StuntingInfoPage extends StatelessWidget {
  const StuntingInfoPage({Key? key}) : super(key: key);

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
                  'assets/images/apa.png',
                  width: 280,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              // Definisi Stunting
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF1E88E5),
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Stunting ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text:
                          'adalah gangguan pertumbuhan dan perkembangan pada anak di bawah usia lima tahun akibat kekurangan gizi kronis, infeksi berulang, dan stimulasi psikososial yang tidak memadai, yang membuat tinggi badan anak lebih pendek dari usianya. Kondisi ini tidak hanya berdampak pada fisik, tetapi juga dapat mempengaruhi perkembangan otak, kognitif, dan kekebalan tubuh anak',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Section Penyebab
              const Text(
                'Penyebab',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'Asupan gizi tidak memadai: Kekurangan nutrisi sejak dalam kandungan hingga dua tahun pertama kehidupan (periode 1000 HPK) merupakan penyebab utama.',
              ),
              _buildBulletPoint(
                'Infeksi berulang: Penyakit infeksi yang sering terjadi dapat menghambat pertumbuhan optimal.',
              ),
              _buildBulletPoint(
                'Kurangnya stimulasi: Kurangnya rangsangan psikososial juga berkontribusi pada kondisi stunting.',
              ),
              const SizedBox(height: 30),
              // Section Gejala
              const Text(
                'Gejala',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'Anak memiliki tinggi badan lebih pendek dibandingkan anak seusianya.',
              ),
              _buildBulletPoint(
                'Proporsi tubuh mungkin terlihat normal, tetapi anak tampak lebih kecil atau lebih muda dari usianya.',
              ),
              _buildBulletPoint(
                'Berat badan rendah atau tidak sesuai dengan usianya.',
              ),
              _buildBulletPoint(
                'Terhambatnya perkembangan tulang.',
              ),
              const SizedBox(height: 30),
              // Section Dampak
              const Text(
                'Dampak',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'Fisik: Gagal tumbuh, berat badan lahir rendah, pertumbuhan terhambat.',
              ),
              _buildBulletPoint(
                'Kognitif: Hambatan dalam perkembangan kognitif dan motorik.',
              ),
              _buildBulletPoint(
                'Kesehatan: Kekebalan tubuh lemah dan meningkatkan risiko penyakit tidak menular di kemudian hari, seperti diabetes dan penyakit jantung.',
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