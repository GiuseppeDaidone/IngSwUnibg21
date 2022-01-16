import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/partita.dart';

// flutter run -d chrome --web-renderer html
// flutter run --profile

void main() {
  runApp(
    // Partita Provider
    ChangeNotifierProvider<Partita>(
      lazy: false,
      create: (_) => Partita(),
      builder: (context, partita) {
        return const MyApp();
      },
    ),
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
