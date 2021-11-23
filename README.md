PROGETTO ING. SOFTWARE 2021 DAIDONE, DRISSI, IANITCHII, MARCHESI

INTRODUZIONE
Avventura testuale

OBBIETTIVI GIOCO
Sconfiggere il boss finale 

LOGICA
Il giocatore parte da un punto casuale della mappa. Il suo livello iniziale � zero. Per poter sconfiggere
il boss finale deve prima salire di livello esplorando il resto della mappa. Il giocatore si pu� muovere
solamente verso: alto/basso/destra/sinistra. L'utente pu� visualizzare con la mappa i punti in cui � gi�
passato e quelli in cui c'� qualcosa di importante.
Ogni volta che entra in una stanza si verifica un evento: L'utente pu� decidere cosa fare usando i pulsanti
azione che gli permettono di scegliere tra 1 o pi� azioni.
La mappa � una matrice 5x5 dove in ogni casella pu� essere presente:
	. Un nemico da sconfiggere
	. Una cassa da aprire
	. Nulla
	. ...

E' possibile raccogliere oggetti e visualizzarli nell'inventario.
Se si incontra un nemico avviene un combattimento (vedi COMBATTIMENTO per maggiori informazioni)
Il giocatore parte con 4 vite, nelle varie stanze � possibile trovare una vita aggiuntiva cumulabile alle
4 con cui parte. Se il giocatore perde tutte le vite perde la partita e deve ricominciare da capo.




LIVELLO GIOCATORE
Il giocatore pu� salire di livello:
	.raccogliendo oggetti
	.esplorando zone nuove della mappa 
	.sconfiggendo nemici
	...



COMBATTIMENTO
Ogni volta che il giocatore arriva in una casella con un nemico, visualizza la probabilit� di vincere e 
come azioni disponibili ha: provare a combattere o fuggire. Se sceglie di fuggire rimane nella stanza, 
stessa cosa se combatte. 
Il combattimento � una battaglia di probabilit�, in base al tipo di nemico la probabilit� di sconfiggerlo
cambia. Inoltre influenzano la probabilit� di battere un nemico: 
	.Livello del giocatore
	.Oggetti che possiede nell'inventario
	. ...

Se il giocatore perde una battaglia con un nemico perde una vita.	


OGGETTI
Gli oggetti che un giocatore pu� trovare:
	.Frecce
	.Spada lunga
	.Ascia
	.Bastone
	.Pozioni
	.Scudo
	.Chiavi
	. ...

REQUIREMENTS
	Must Have
		. Combattimento
		. Raccolta oggetti
		. Vite personaggio

	Should Have
		.Icons per ogni oggetto nell'inventario
		.Musica di sottofondo
		.Ogni volta che inizia una partita le stanze della mappa cambiano cosa contengono

	Could Have
		. Utilizzo degli oggetti
		. Capacit� max di oggetti trasportabili tramite peso oggetti

	Wont Have
	
