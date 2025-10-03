import 'package:flutter/material.dart';

void main() {
  runApp(const LirikApp());
}

/// Aplikasi utama
class LirikApp extends StatelessWidget {
  const LirikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lirik Lagu Romansa Samudra",
      theme: ThemeData(
        // Tema warna utama
        primarySwatch: Colors.blue, 
        fontFamily: 'Arial',
      ),
      home: const LirikHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Halaman utama aplikasi
class LirikHomePage extends StatelessWidget {
  const LirikHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Antara Aku, Kamu, dan Samudra",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
      ),

      // Gunakan Stack → background + konten
      body: Stack(
        children: [
          _buildBackground(),
          _buildLyrics(),
        ],
      ),
    );
  }

  /// Widget untuk background
  Widget _buildBackground() {
    return Positioned.fill(
      child: Image.asset(
        // PERBAIKAN PATH: Menggunakan path yang konsisten (tanpa './' dan nama file bg_samudra.jpg)
        "assets/images/samudra.jpg",
        fit: BoxFit.cover,
        color: Colors.blueGrey.shade900.withOpacity(0.3),
        colorBlendMode: BlendMode.darken,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.blueGrey.shade900.withOpacity(0.3),
            child: const Center(
              child: Text(
                "Gagal memuat gambar background.\nPeriksa path dan pubspec.yaml.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Widget untuk konten lirik
  Widget _buildLyrics() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          VerseWidget(
            text:
                "Senyum kecil mentari cerah menyapaku\nDi tepi pantai ku menunggumu\nSapa kicau burung tak lelah bernyanyi merdu\nBernyanyi balada kau dan aku",
          ),
          SizedBox(height: 30),

          VerseWidget(
            text:
                "Tanpa ragu langkahku besar dan bermakna\nDi tanah penuh harapan kita\nPercayalah sayang ku akan kembali pulang\nJaga bangkuku di sebelahmu",
          ),
          SizedBox(height: 30),

          VerseWidget(
            text:
                "Deru birunya ombak tempat kita berjuang\nMelawan deras badai luka problema\nTak kenal siang dan malam kita tak terkalahkan\nHari ini hari milik kita\n\nAntara aku kamu dan samudra\nKita berbagi tawa dan berdansa\nWalau di tengah duka dan deras air mata\nSatu romansa kita tiada dua",
            isChorus: true,
          ),
          SizedBox(height: 30),

          VerseWidget(
            text:
                "Langit mendung pun malu duhai kekasihku\nKetika paras terangmu datang\nMentari pun salut akan cinta kasih sayang\nYang bersinar jujur di hatimu",
          ),
          SizedBox(height: 30),

          VerseWidget(
            text:
                "Tak lelah tak henti walau di depan badai menghadang\nTak lelah tak henti untuk kita selamanya\nTak lelah tak henti walau di depan badai menghadang\nTak lelah tak henti untuk kita selamanya",
            isBridge: true,
          ),
          SizedBox(height: 30),

          VerseWidget(
            text:
                "Deru birunya ombak tempat kita berjuang\nMelawan deras badai luka problema\nTak kenal siang dan malam kita tak terkalahkan\nHari ini hari kita berdua\n\nAntara aku kamu dan samudra\nKita berbagi tawa dan berdansa\nWalau di tengah duka dan deras air mata\nSatu romansa kita tiada dua",
            isChorus: true,
          ),
          SizedBox(height: 30),

          VerseWidget(
            text:
                "Antara aku kamu dan samudra\nKita berbagi tawa dan berdansa\nWalau di tengah duka dan deras air mata\nSatu romansa kita tiada dua\n\nItulah aku kamu dan samudra~",
            isChorus: true,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

/// Widget khusus untuk menampilkan bait lirik
class VerseWidget extends StatelessWidget {
  final String text;
  final bool isChorus;
  final bool isBridge;

  const VerseWidget({
    super.key,
    required this.text,
    this.isChorus = false,
    this.isBridge = false,
  });

  @override
  Widget build(BuildContext context) {
    // Pilihan warna dan gaya berdasarkan jenis verse
    final Color textColor = isChorus
        ? Colors.pink.shade50
        : (isBridge ? Colors.amber.shade200 : Colors.white);

    final double fontSize = isChorus ? 22 : 18;
    final FontWeight fontWeight =
        isChorus ? FontWeight.bold : FontWeight.w500;

    final Color boxColor = isChorus
        // Warna lebih solid dan kontras untuk Chorus
        ? Colors.blueGrey.shade900.withOpacity(0.8) 
        // Warna transparan untuk verse/bridge
        : Colors.blueGrey.shade900.withOpacity(0.4); 

    return Align(
      // Memposisikan seluruh blok lirik ke kanan (tengah ke kanan)
      alignment: Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: 0.50, // Menggunakan 50% lebar layar
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            text,
            // PERUBAHAN UTAMA: Teks rata kiri di dalam blok
            textAlign: TextAlign.left, 
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
              fontStyle: isBridge ? FontStyle.italic : FontStyle.normal,
              height: 1.5,
              shadows: const [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.black,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
