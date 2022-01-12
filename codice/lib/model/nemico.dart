import 'package:codice/functions/creazione_partita.dart';
import 'package:codice/model/domanda.dart';

class Nemico {
  Nemico(
      {required this.nome,
      required this.immagine,
      required this.livello,
      required this.disciplina,
      required this.dialogoCombattimento})
      : listaDomande =
            CreazionePartita().creaDomandeNemico(livello, disciplina);

  final String nome;
  final String immagine;
  // Livello indica la difficoltà del nemico
  final LivelloNemico livello;
  final Disciplina disciplina;
  // La lista viene creata dal costruttore, che pesca domande con stessa disciplina e difficoltà del nemico, dal database.
  final List<Domanda> listaDomande;
  // Se bool = true allora la string è una domanda
  // NB: Il dialogo è fisso per ogni nemico. Le domande invece cambiano da partita a partita
  final List<Map<String, bool>> dialogoCombattimento;
  // Index della domanda attualmente visualizzata
  int indexDomandaCorrente = 0;
  // Danno che il nemico infligge in caso di domanda sbagliata
  //int danno;

  void nextDomanda() {
    indexDomandaCorrente++;
  }

  void resetIndexDomanda() {
    indexDomandaCorrente = 0;
  }
}

// DISCIPLINE LEGATE ALLE DOMANDE ED AI NEMICI
enum Disciplina { MATEMATICA, DATABASE, FISICA, EMBEDDED }

// Indica la difficoltà del nemico. In base a questo dipendono la difficoltà delle domande
enum LivelloNemico { BASSO, MEDIO, ALTO }
