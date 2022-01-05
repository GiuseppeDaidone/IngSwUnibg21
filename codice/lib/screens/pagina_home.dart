import 'package:codice/screens/pagina_inserimento_nome.dart';
import 'package:flutter/material.dart';

// PAGINA HOME [PAG1]

class PaginaHome extends StatelessWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Center(
                  child: Image.asset("images/homegif.gif"),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // TITLE
                  const Text(
                    "Pandora Quest",
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // PULSANTE NUOVA PARTITA
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaginaInserimentoNome();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[800],
                      minimumSize: const Size(200, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: const Text("Nuova Partita"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
