import 'package:flutter/material.dart';

class NutrisiGiziAnakPage extends StatelessWidget {
  const NutrisiGiziAnakPage({Key? key}) : super(key: key);

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
                  'assets/images/nutrisi.png',
                  width: 280,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              // Deskripsi
              const Text(
                'Untuk mencegah stunting, pastikan anak mendapatkan nutrisi seimbang yang mencakup protein, karbohidrat kompleks, lemak sehat, vitamin, dan mineral dari berbagai sumber seperti ikan, telur, daging ayam, kacang-kacangan, sayuran, dan buah-buahan. Selain itu, penting bagi ibu hamil untuk mengonsumsi makanan kaya protein, zat besi, dan asam folat, serta memberikan ASI eksklusif pada bayi dan makanan pendamping ASI (MPASI) yang bergizi setelah usia 6 bulan.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1E88E5),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              // Section Nutrisi penting pencegah stunting
              const Text(
                'Nutrisi penting pencegah stunting',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'Protein: Esensial untuk pertumbuhan sel, jaringan, otot, dan organ. Sumbernya bisa dari protein hewani (ikan, telur, daging ayam) atau nabati (kacang-kacangan, tahu, tempe).',
              ),
              _buildBulletPoint(
                'Karbohidrat: Menyediakan energi, utamakan karbohidrat kompleks seperti nasi, roti, dan pasta.',
              ),
              _buildBulletPoint(
                'Lemak Sehat: Dibutuhkan sebagai sumber energi untuk pertumbuhan. Alpukat adalah salah satu sumber lemak sehat yang baik.',
              ),
              _buildBulletPoint(
                'Vitamin: Banyak jenis vitamin yang dibutuhkan, termasuk vitamin A dan E, vitamin B kompleks, serta vitamin D yang penting untuk tulang.',
              ),
              const SizedBox(height: 30),
              // Section Contoh Makanan
              const Text(
                'Contoh Makanan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E88E5),
                ),
              ),
              const SizedBox(height: 15),
              _buildBulletPoint(
                'Protein: Ikan, telur, daging ayam, hati ayam, susu, yogurt, tahu, tempe, dan kacang-kacangan.',
              ),
              _buildBulletPoint(
                'Sayur dan buah: Bervariasi sesuai kebutuhan, pilih yang kaya serat dan antioksidan seperti buah beri.',
              ),
              _buildBulletPoint(
                'Karbohidrat: Nasi, roti, dan pasta.',
              ),
              _buildBulletPoint(
                'Sumber lain: oatmeal yang kaya serat, dan susu untuk melengkapi nutrisi.',
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