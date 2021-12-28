import 'package:flutter/material.dart';

import '../../pagina_home.dart';

class PulsanteMenu extends StatelessWidget {
  const PulsanteMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      width: size.width / 13,
      child: ElevatedButton(
        child: const Text("Menù"),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    // Pulsante Continua Partita
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Continua la partita"),
                    ),

                    // Pulsante Torna al menu principale
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return const PaginaHome();
                            }),
                          ),
                        );
                      },
                      child: const Text("Torna al menù principale"),
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}