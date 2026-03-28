import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2 Praktikum Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 118, 156, 222)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Praktikum: Scroll & Event'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Poin 3: State untuk ganti gambar secara dinamis
  bool _showImage = true;

  // Poin 4: Fungsi Event (Logika Toggle)
  void _toggleDisplay() {
    setState(() {
      _showImage = !_showImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- AREA GAMBAR / WARNA DINAMIS ---
            const Text(
              "Tampilan Gambar / Warna:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _showImage ? Colors.grey[200] : const Color.fromARGB(255, 67, 140, 213),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: _showImage
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        // Menggunakan gambar pemandangan laut yang jernih
                        'https://picsum.photos/id/10/800/600', 
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                    )
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.palette_rounded, size: 70, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            "Mode Warna Aktif",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
            ),

            const SizedBox(height: 25),

            // --- TATA LETAK TOMBOL ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: _toggleDisplay,
                icon: Icon(_showImage ? Icons.color_lens : Icons.image),
                label: Text(
                  _showImage ? "Klik untuk Ganti ke Warna" : "Klik untuk Ganti ke Gambar",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 76, 255),
                  foregroundColor: Colors.white, // Diubah ke putih agar teks terbaca jelas di tombol biru
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // --- AREA DESKRIPSI PEMANDANGAN (SCROLLABLE) ---
            const Text(
              "Deskripsi Pemandangan (Scrollable):",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 250, // Tinggi tetap agar area scroll aktif di dalam kotak
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color.fromARGB(255, 57, 47, 255), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const SingleChildScrollView(
                child: Text(
                  "Pemandangan ini menyuguhkan harmoni visual yang memukau antara rimbunnya hutan tropis dan luasnya cakrawala samudra. Di bagian depan, deretan pohon cemara dan vegetasi hijau yang padat berdiri tegak, dengan detail pucuk-pucuk pohon yang menangkap cahaya matahari, menciptakan gradasi warna hijau tua hingga zaitun yang alami.\n\n"
                  "Di balik garis pepohonan tersebut, terbentang pemandangan laut lepas yang berwarna biru safir yang sangat jernih. Gradasi warna air laut yang semakin menjauh semakin menyatu dengan warna langit di garis horisontal, memberikan kesan ketenangan dan ruang yang tak terbatas. Komposisi foto ini diambil dengan sudut pandang dari ketinggian, memberikan perspektif yang luas bagi siapa saja yang memandangnya.\n\n"
                  "Kesegaran udara seolah terpancar dari kombinasi warna alami ini. Langit yang bersih tanpa awan di kejauhan menegaskan cuaca yang cerah, sangat cocok untuk menggambarkan suasana liburan di pesisir atau wisata pegunungan yang menghadap langsung ke laut. Detail tekstur pada setiap daun dan riak air yang tenang di kejauhan menjadikan foto ini sebuah karya visual yang sangat jernih dan tajam.\n\n"
                  "--- REPETISI TEKS UNTUK SCROLL ---\n\n"
                  "Pemandangan laut ini juga mencerminkan betapa indahnya ekosistem alam yang terjaga. Birunya samudera yang kontras dengan hijaunya hutan menciptakan sebuah simfoni warna yang menyejukkan mata. Bayangkan hembusan angin laut yang menyapu sela-sela pepohonan cemara, membawa aroma garam dan kesegaran hutan secara bersamaan.\n\n"
                  "Setiap elemen dalam foto ini bekerja sama untuk menciptakan rasa damai. Dari gradasi warna laut yang dalam hingga detail terkecil dari dedaunan di area depan, semuanya mengundang kita untuk sejenak melupakan rutinitas dan kembali ke alam. Fitur scroll ini memastikan kamu dapat membaca seluruh detail puitis ini tanpa hambatan.\n\n"
                  "--- AKHIR DARI DESKRIPSI ---",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, height: 1.6, color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}