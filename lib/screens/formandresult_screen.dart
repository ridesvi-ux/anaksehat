import 'package:flutter/material.dart';
// Import HomeScreen - sesuaikan dengan lokasi file HomeScreen lu
import 'home_screen.dart'; // Ganti nama file sesuai lokasi HomeScreen lu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatAnak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _beratController = TextEditingController();
  final _tinggiController = TextEditingController();
  final _usiaController = TextEditingController();
  
  bool _isFormComplete = false;

  @override
  void initState() {
    super.initState();
    // Tambahkan listener ke setiap controller
    _namaController.addListener(_checkFormComplete);
    _beratController.addListener(_checkFormComplete);
    _tinggiController.addListener(_checkFormComplete);
    _usiaController.addListener(_checkFormComplete);
  }

  void _checkFormComplete() {
    setState(() {
      _isFormComplete = _namaController.text.isNotEmpty &&
          _beratController.text.isNotEmpty &&
          _tinggiController.text.isNotEmpty &&
          _usiaController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _beratController.dispose();
    _tinggiController.dispose();
    _usiaController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Ambil data dari form
      String nama = _namaController.text;
      double berat = double.parse(_beratController.text);
      double tinggi = double.parse(_tinggiController.text);
      int usia = int.parse(_usiaController.text);

      // Hitung status gizi dan risiko stunting
      Map<String, dynamic> result = _hitungStatusGizi(berat, tinggi, usia);

      // Navigate ke halaman result
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            nama: nama,
            berat: berat,
            tinggi: tinggi,
            usia: usia,
            statusGizi: result['statusGizi'],
            risikoStunting: result['risikoStunting'],
          ),
        ),
      );
    }
  }

  Map<String, dynamic> _hitungStatusGizi(
      double berat, double tinggi, int usia) {
    // Rumus sederhana berdasarkan standar WHO
    // BB/U (Berat Badan menurut Umur)
    // TB/U (Tinggi Badan menurut Umur)

    String statusGizi = '';
    String risikoStunting = '';

    // Standar TB/U untuk anak (simplified)
    // Usia dalam bulan, tinggi dalam cm
    double tinggiStandar = 0;
    
    if (usia <= 12) {
      // 0-12 bulan
      tinggiStandar = 70 + (usia * 2.5); // Rata-rata pertumbuhan
    } else if (usia <= 24) {
      // 13-24 bulan
      tinggiStandar = 75 + ((usia - 12) * 1.5);
    } else if (usia <= 60) {
      // 25-60 bulan (2-5 tahun)
      tinggiStandar = 85 + ((usia - 24) * 0.8);
    } else {
      // > 5 tahun
      tinggiStandar = 110 + ((usia - 60) * 0.5);
    }

    // Hitung persentase tinggi terhadap standar
    double persentaseTinggi = (tinggi / tinggiStandar) * 100;

    // Standar BB menurut tinggi (simplified)
    double beratIdeal = (tinggi - 100) * 0.9;
    double persentaseBerat = (berat / beratIdeal) * 100;

    // Tentukan Status Gizi
    if (persentaseBerat >= 110) {
      statusGizi = 'Obesitas';
    } else if (persentaseBerat >= 90) {
      statusGizi = 'Normal';
    } else if (persentaseBerat >= 80) {
      statusGizi = 'Gizi Kurang';
    } else {
      statusGizi = 'Gizi Buruk';
    }

    // Tentukan Risiko Stunting berdasarkan TB/U
    if (persentaseTinggi >= 95) {
      risikoStunting = 'Risiko Stunting Rendah';
    } else if (persentaseTinggi >= 85) {
      risikoStunting = 'Risiko Stunting Sedang';
    } else {
      risikoStunting = 'Risiko Stunting Tinggi';
    }

    return {
      'statusGizi': statusGizi,
      'risikoStunting': risikoStunting,
    };
  }

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title dengan Image
                  Center(
                    child: Image.asset(
                      'assets/images/isiform.png',
                      height: 60,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'Isi Form',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2196F3),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Nama Anak
                  const Text(
                    'Nama Anak',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      hintText: 'Masukan Nama Anak...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama anak harus diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Berat Badan
                  const Text(
                    'Berat Badan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _beratController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukan Berat Badan (Kg)...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Berat badan harus diisi';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Masukkan angka yang valid';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Tinggi Badan
                  const Text(
                    'Tinggi Badan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _tinggiController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukan Tinggi Badan (Cm)...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tinggi badan harus diisi';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Masukkan angka yang valid';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Usia
                  const Text(
                    'Usia',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2196F3),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _usiaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukan Usia (Bulan)...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF2196F3),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Usia harus diisi';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Masukkan angka yang valid';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 60),

                  // Submit Button - WARNA BERUBAH BERDASARKAN STATUS FORM
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFormComplete 
                            ? const Color(0xFF2196F3)  // Biru jika lengkap
                            : Colors.grey[400],         // Abu-abu jika belum lengkap
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Tampilkan Hasil',
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
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String nama;
  final double berat;
  final double tinggi;
  final int usia;
  final String statusGizi;
  final String risikoStunting;

  const ResultPage({
    super.key,
    required this.nama,
    required this.berat,
    required this.tinggi,
    required this.usia,
    required this.statusGizi,
    required this.risikoStunting,
  });

  Color _getStatusColor(String status) {
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Title dengan Image
              Center(
                child: Image.asset(
                  'assets/images/result.png',
                  height: 60,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Hasil',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 60),

              // Result Items
              _buildResultItem('Nama Anak', nama),
              const SizedBox(height: 24),
              _buildResultItem('Berat Badan', '$berat Kg'),
              const SizedBox(height: 24),
              _buildResultItem('Tinggi Badan', '$tinggi Cm'),
              const SizedBox(height: 24),
              _buildResultItem('Usia', _formatUsia(usia)),
              const SizedBox(height: 24),
              _buildResultItemWithIndicator('Status Gizi', statusGizi),
              const SizedBox(height: 24),
              _buildResultItemWithIndicator('Risiko Stunting', risikoStunting),

              const Spacer(),

              // Button - Navigate ke HomeScreen
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // CARA 1: Pakai Navigator.pushAndRemoveUntil dengan widget
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (route) => false,
                    );
                    
                    // CARA 2: Pakai named route (kalau udah setup di main.dart)
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   '/home',
                    //   (route) => false,
                    // );
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
                    'Halaman Utama',
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

  String _formatUsia(int usiaBulan) {
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

  Widget _buildResultItem(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2196F3),
            ),
          ),
        ),
        const Text(
          ':',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2196F3),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2196F3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultItemWithIndicator(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2196F3),
            ),
          ),
        ),
        const Text(
          ':',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2196F3),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
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