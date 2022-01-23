import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

// Classe che contiene i Fonts + textStyle utilizzati nell'applicazione

class GameFonts {
  TextStyle hallelujaFont({double? size}) {
    return GoogleFonts.gloriaHallelujah(
      textStyle: TextStyle(
        fontSize: size,
        color: Colors.white,
      ),
    );
  }

  TextStyle hallelujaFontBlack({double? size}) {
    return GoogleFonts.gloriaHallelujah(
      textStyle: TextStyle(
        fontSize: size,
      color: Colors.black,
      ),
    );
  }
}
