import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "About",
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Text(
          "Kalkulator Ric\n\n"
          "Aplikasi kalkulator sederhana dengan UI modern tema kuning hitam.\n"
          "Dibuat menggunakan Flutter dengan state management Provider.\n\n"
          "Fitur:\n"
          "- Operasi dasar (+ - × ÷)\n"
          "- Dukungan tanda kurung ()\n"
          "- Clear, Delete, dan perhitungan otomatis\n"

          "RICKI MAULANA ABDILLAH - 221080200127\n",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
