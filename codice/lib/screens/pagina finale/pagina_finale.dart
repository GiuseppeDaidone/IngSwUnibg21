import 'package:codice/model/partita.dart';
import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/screens/pagina%20inserimento%20nome/pagina_inserimento_nome.dart';
import 'package:codice/theme/game_fonts.dart';
import 'package:codice/theme/game_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// PAGINA FINALE [PAG4]

class PaginaFinale extends StatelessWidget {
  const PaginaFinale({Key? key, required this.isDead}) : super(key: key);

  final bool isDead;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.green[300],
        body: Column(
          children: <Widget>[
            const Expanded(
              child: SizedBox(),
            ),

            // TITOLO
            isDead
                ? Expanded(
                    child: Text(
                      "GAME OVER",
                      style: GameFonts().hallelujaFont(size: 50),
                    ),
                  )
                : Expanded(
                    child: Text(
                      "Congratulazioni Per Aver Completato Il Gioco",
                      style: GameFonts().hallelujaFont(size: 50),
                    ),
                  ),

            // BOX STATISTICHE
            Consumer<Partita>(
              builder: (context, partita, _) {
                return Expanded(
                  child: Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(right: 100, left: 100),
                    color: Colors.green[800],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          // DESCRIZIONE BOX STATISTICHE
                          Text(
                            "Statistiche Partita",
                            textAlign: TextAlign.start,
                            style: GameFonts().hallelujaFont(size: 30),
                          ),

                          const SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Colonna Label
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  // Tempo Impiegato
                                  Text("Tempo Impiegato: "),

                                  // Domande Sbagliate
                                  Text("Domande Sbagliate:"),
                                ],
                              ),

                              const SizedBox(
                                width: 50,
                              ),

                              // Colonna Dati
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // Tempo Impiegato
                                  Text(
                                    DateTime.now()
                                        .difference(
                                          partita.getIstanteInizioPartita(),
                                        )
                                        .toString()
                                        .substring(0, 11),
                                  ),

                                  // Domande Sbagliate
                                  Text(
                                      partita.getDomandeSbagliate().toString()),
                                ],
                              ),

                              // Colonna Label
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text("Domande Totali:"),

                                  // Oggetti Utilizzati
                                  Text("Oggetti Utilizzati:"),
                                ],
                              ),

                              const SizedBox(
                                width: 50,
                              ),

                              // Colonna Dati
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(partita.getDomandeRisposte().toString()),

                                  // Oggetti Utilizzati
                                  Text(
                                    partita.getOggettiUtilizzati().toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // PULSANTI A FONDO PAGINA
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // PULSANTE TORNA ALLA HOME
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: GameTheme.buttonColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaginaHome();
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      height: size.height / 13,
                      width: size.width / 7,
                      child: Center(
                        child: Text(
                          "Torna alla home",
                          style: GameFonts().hallelujaFont(size: 20),
                        ),
                      ),
                    ),
                  ),

                  // PULSANTE GIOCA ANCORA
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: GameTheme.buttonColor,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PaginaInserimentoNome();
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      height: size.height / 13,
                      width: size.width / 7,
                      child: Center(
                        child: Text(
                          "Gioca Ancora",
                          style: GameFonts().hallelujaFont(size: 20),
                        ),
                      ),
                    ),
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
