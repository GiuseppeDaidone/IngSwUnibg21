import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key, required this.nomePulsante, required this.onPressed})
      : super(key: key);

  final String nomePulsante;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: GameTheme.buttonColor,
        ),
        onPressed: onPressed,
        child: Text(
          nomePulsante,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
