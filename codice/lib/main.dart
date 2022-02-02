import 'package:codice/model/partita_stats.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/utils/partita_stats_locator.dart';
import 'package:flutter/material.dart';

// flutter run -d chrome --web-renderer html
// flutter run --profile

// Calcolo complessità: flutter pub run dart_code_metrics:metrics analyze lib
// File non utilizzati: flutter pub run dart_code_metrics:metrics check-unused-files lib

void main() {
  // imposto il locator per rendere visibile l'oggetto PartitaStats()
  PartitaStatsLocator().setup();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ingswproject",
      home: PaginaHome(),
    );
  }
}
