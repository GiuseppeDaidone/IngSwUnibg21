import 'package:codice/model/personaggio.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PulsanteInventario extends StatelessWidget {
  const PulsanteInventario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 8,
      width: size.width / 13,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: GameTheme.buttonColor,
        ),
        child: const Text("Inventario"),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: size.height / 3,
                    width: size.width / 5,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(index.toString()),
                        );
                      },
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
