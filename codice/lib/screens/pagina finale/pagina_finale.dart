import 'package:codice/screens/pagina%20home/pagina_home.dart';
import 'package:codice/screens/pagina%20inserimento%20nome/pagina_inserimento_nome.dart';
import 'package:flutter/material.dart';

// PAGINA FINALE [PAG4]

class PaginaFinale extends StatelessWidget {
  const PaginaFinale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Column(
        children: <Widget>[
          const Expanded(
            child: SizedBox(),
          ),

          // TITOLO
          const Expanded(
            child: Text(
              "Congratulazioni Per Aver Completato Il Gioco",
              style: TextStyle(fontSize: 50),
            ),
          ),

          // BOX STATISTICHE
          Expanded(
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(right: 100, left: 100),
              color: Colors.green[800],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // DESCRIZIONE BOX STATISTICHE
                    const Text(
                      "Statistiche Partita",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
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
                            Text("Tempo Impiegato:"),

                            // Domande Sbagliate
                            Text("Domande Sbagliate:"),

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
                          children: const <Widget>[
                            // Tempo Impiegato
                            Text("30:67"),

                            // Domande Sbagliate
                            Text("3"),

                            // Oggetti Utilizzati
                            Text("2"),
                          ],
                        ),

                        // Colonna Label
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text("Domande Totali:"),
                            Text("Vite Perse:"),
                            Text("Difficoltà selezionata:"),
                          ],
                        ),

                        const SizedBox(
                          width: 50,
                        ),

                        // Colonna Dati
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text("15"),
                            Text("3"),
                            Text("Difficile"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // PULSANTE TORNA ALLA HOME
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const PaginaHome();
                      }),
                    );
                  },
                  child: const Text("Torna alla home"),
                ),

                // PULSANTE GIOCA ANCORA
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const PaginaInserimentoNome();
                      }),
                    );
                  },
                  child: const Text("Gioca Ancora"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
