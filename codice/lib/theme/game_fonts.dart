import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

// Classe che contiene i Fonts + textStyle utilizzati nell'applicazione

class GameFonts {
  final TextStyle titoloPaginaHome = GoogleFonts.gloriaHallelujah(
      textStyle: const TextStyle(
    fontSize: 100,
    color: Colors.white,
  ),);

  final TextStyle pulsantePaginaHome = GoogleFonts.gloriaHallelujah(
    textStyle: const TextStyle(
      color: Colors.white,
    ),
  );
}
