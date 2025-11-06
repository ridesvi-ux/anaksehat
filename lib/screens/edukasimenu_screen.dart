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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Logo Edukasi
              Image.asset(
                'assets/btnedukasi.png',
                height: 80,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 60),

              // Button Apa itu Stunting
              GestureDetector(
                onTap: () {
                  // Navigate ke halaman Apa itu Stunting
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ApaItuStuntingPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/btnapaitustunting.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button Tips Mencegah Stunting
              GestureDetector(
                onTap: () {
                  // Navigate ke halaman Tips Mencegah Stunting
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TipsMencegahStuntingPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/btntips.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button Nutrisi & Gizi Anak
              GestureDetector(
                onTap: () {
                  // Navigate ke halaman Nutrisi & Gizi Anak
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NutrisiGiziAnakPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/btngizi.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Button Kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
}

// Halaman Apa itu Stunting
class ApaItuStuntingPage extends StatelessWidget {
  const ApaItuStuntingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Apa itu Stunting?',
          style: TextStyle(
            color: Color(0xFF2196F3),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ilustrasi
              Center(
                child: Image.asset(
                  'assets/btnapaitustunting.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              
              const SizedBox(height: 30),

              // Konten
              const Text(
                'Apa itu Stunting?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              const SizedBox(height: 16),
              
              const Text(
                'Stunting adalah kondisi gagal tumbuh pada anak akibat kekurangan gizi kronis, terutama pada 1000 hari pertama kehidupan (sejak janin hingga usia 2 tahun).',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text(
                'Ciri-ciri Stunting:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              const SizedBox(height: 12),
              
              _buildBulletPoint('Tinggi badan lebih pendek dari standar usianya'),
              _buildBulletPoint('Pertumbuhan tulang tertunda'),
              _buildBulletPoint('Berat badan tidak sesuai dengan usia'),
              _buildBulletPoint('Perkembangan kognitif dan motorik terhambat'),
              _buildBulletPoint('Mudah terserang penyakit'),
              
              const SizedBox(height: 24),
              
              const Text(
                'Dampak Stunting:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              const SizedBox(height: 12),
              
              _buildBulletPoint('Gangguan perkembangan otak'),
              _buildBulletPoint('Kecerdasan berkurang'),
              _buildBulletPoint('Gangguan sistem imun'),
              _buildBulletPoint('Risiko penyakit kronis di masa dewasa'),
              
              const SizedBox(height: 40),
              
              // Button Kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Tips Mencegah Stunting
class TipsMencegahStuntingPage extends StatelessWidget {
  const TipsMencegahStuntingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tips Mencegah Stunting',
          style: TextStyle(
            color: Color(0xFF2196F3),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ilustrasi
              Center(
                child: Image.asset(
                  'assets/btntips.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              
              const SizedBox(height: 30),

              _buildTipsCard(
                '1. Perbaiki Pola Makan',
                'Pastikan ibu hamil dan anak mendapat asupan gizi seimbang dengan protein, vitamin, dan mineral yang cukup.',
                Icons.restaurant,
              ),
              
              _buildTipsCard(
                '2. ASI Eksklusif',
                'Berikan ASI eksklusif selama 6 bulan pertama, lalu lanjutkan dengan MPASI yang bergizi.',
                Icons.child_care,
              ),
              
              _buildTipsCard(
                '3. Rutin Cek Kesehatan',
                'Lakukan pemeriksaan kesehatan rutin ke Posyandu atau Puskesmas untuk memantau tumbuh kembang anak.',
                Icons.medical_services,
              ),
              
              _buildTipsCard(
                '4. Sanitasi & Kebersihan',
                'Jaga kebersihan lingkungan dan sanitasi untuk mencegah infeksi yang dapat mengganggu penyerapan nutrisi.',
                Icons.clean_hands,
              ),
              
              _buildTipsCard(
                '5. Imunisasi Lengkap',
                'Pastikan anak mendapatkan imunisasi lengkap sesuai jadwal untuk melindungi dari penyakit.',
                Icons.vaccines,
              ),
              
              const SizedBox(height: 40),
              
              // Button Kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipsCard(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2196F3).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Nutrisi & Gizi Anak
class NutrisiGiziAnakPage extends StatelessWidget {
  const NutrisiGiziAnakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Nutrisi & Gizi Anak',
          style: TextStyle(
            color: Color(0xFF2196F3),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ilustrasi
              Center(
                child: Image.asset(
                  'assets/btngizi.png',
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              
              const SizedBox(height: 30),

              const Text(
                'Nutrisi Penting untuk Anak',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              
              const SizedBox(height: 20),

              _buildNutrisiCard(
                'Protein',
                'Untuk pertumbuhan dan perbaikan sel tubuh',
                'Sumber: Telur, ikan, ayam, daging, tahu, tempe',
                Colors.red.shade400,
              ),

              _buildNutrisiCard(
                'Karbohidrat',
                'Sumber energi utama untuk aktivitas anak',
                'Sumber: Nasi, roti, kentang, pasta, sereal',
                Colors.orange.shade400,
              ),

              _buildNutrisiCard(
                'Lemak Sehat',
                'Untuk perkembangan otak dan penyerapan vitamin',
                'Sumber: Alpukat, kacang-kacangan, minyak zaitun',
                Colors.amber.shade400,
              ),

              _buildNutrisiCard(
                'Vitamin & Mineral',
                'Untuk menjaga daya tahan tubuh dan metabolisme',
                'Sumber: Sayuran hijau, buah-buahan, susu',
                Colors.green.shade400,
              ),

              _buildNutrisiCard(
                'Kalsium',
                'Untuk pertumbuhan tulang dan gigi yang kuat',
                'Sumber: Susu, keju, yogurt, ikan teri',
                Colors.blue.shade400,
              ),

              _buildNutrisiCard(
                'Zat Besi',
                'Untuk pembentukan sel darah merah',
                'Sumber: Daging merah, bayam, hati ayam',
                Colors.purple.shade400,
              ),
              
              const SizedBox(height: 30),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.green.shade300,
                    width: 2,
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.green,
                      size: 32,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Tips Pemberian Makan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Berikan makan 3x sehari dengan 2x snack\n'
                      '• Variasikan menu agar tidak bosan\n'
                      '• Sajikan dalam porsi kecil tapi sering\n'
                      '• Buat suasana makan yang menyenangkan\n'
                      '• Hindari makanan tinggi gula dan garam',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Button Kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrisiCard(String title, String description, String sumber, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            sumber,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Colors.grey.shade700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}