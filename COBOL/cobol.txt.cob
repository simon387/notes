http://ennebi.solira.org/cobol/page1.html

1      IDENTIFICATION DIVISION.
       PROGRAM-ID. NameOfProgram.
       [AUTHOR. YourName.]
	   other entries here
2      ENVIRONMENT DIVISION.
	   aliases
3      DATA DIVISION.
	   01 var PIC 9(6).
	   01 var PIC 9(6)V99.
	   01 var PICTURE X(10).
	   01 var PIC S9(4)V9(4).
	   01 var PIC 9(18).
	   01 GrossPay PIC 9(5)V99 VALUE ZEROS.
	   01 CustomerName PIC X(20) VALUE SPACES.
	   01 CustDiscount PIC V99 VALUE .25.
	   FILE SECTION.
	   File Section entries.
	   WORKING-STORAGE SECTION.
	   WS entries.
4      PROCEDURE DIVISION.
	   
123456			numero di sequenza della riga nell'ambito del programma
123				numero di pagina
   456			numero di riga
				normale, settima blank
	  -			continuazione riga precedente
	  *			riga di commento
	  /			riga di commento
	  D			serve per il Debugging
	   8-72		proposizioni ZONA A
	       c	proposizioni ZONA B c=12esima
	   73-80	identificazione del programma
	   
      *STRUTTURA BASE.
	  
	   IDENTIFICATION DIVISION.
	   PROGRAM-ID. nome-del-programma.
	   AUTHOR. Simone.
	   ENVIRONMENT DIVISION.
	  *questa divisione specifica in 2 distinte sezioni un metodo standard per
	  *esprimere i collegamenti fra programma ed elaboratore
	   CONFIGURATION SECTION.
	  *vengono fornite le specifiche dell'elaboratore utilizzato in sede di compilazione
	  *ed in sede di esecuzione del programma
	   SOURCE-COMPUTER. sigla-elaboratore.
	   OBJECT-COMPUTER. sigla-elaboratore.
	   SPECIAL-NAMES.
	       DECIMAL-POINT IS COMMA.
	       CURRENCY SIGN IS costante.
	   INPUT-OUTPUT SECTION.
	  *viene precisata l'assegnazione dei flussi alle varie periferiche del sistema,
	  *e vengono fornite informazioni circa la gestione e le modalita di elaborazione
	  *dei flussi stessi
	   FILE-CONTROL.
	  *ad ogni flusso si associa la periferica relativa
	       SELECT nome-flusso ASSIGN TO sigla-unità-periferica.
	   I-O-CONTROL.
	  *
	   DATA DIVISION.
	   FILE-SECTION.
	   WORKING-STORAGE SECTION.
	   LINKAGE SECTION.
	   COMMUNICATION SECTION.
	   REPORT SECTIOIN.
	  *
	   PROCEDURE DIVISION.
	   
01 e 77 non fanno parte di campi di gruppo

VALUE IS inizializza

se si divide la procedure division in sezioni, gli va dato un nome
	nome-sezione SECTION.

ACCEPT

DISPLAY

OPEN predispone un flusso all'elaborazione

CLOSE

READ trasferisce record logici di un flusso in un'area di memoria accessibile al programmatore
	attraverso i nomi-dato assegnati nella File Description (FD) di quel flusso
	OPEN INPUT
	READ nome-flusso AT END istruzione-imperativa.

WRITE consente di trasferire in output un record logico
	WRITE nome-record

MOVE copia dati dalla memoria centrale alla memoria centrale

ADD nome TO nome.
ADD a b c GIVING d.

SUBTRACT a b FROM c.
SUBTRACT a b GIVING c.

MULTIPLY a BY b c
MULTIPLY a BY b GIVING c d

DIVIDE a INTO b c.
DIVIDE a INTO b GIVING c d

IF test istruzioni1 ELSE istruzioni2.
IF test isturzioni1. istruzioni2.

a IS [NOT] GREATER THAN b
           LESS THAN
		   EQUAL TO

a IS [NOT] NUMERIC
		   ALPHABETIC
		   
GO TO nome-procedura.

PERFORM nome-procedura [THROUGH nome-procedura2]
                        THRU

STOP RUN. finisce il programma
STOP costante. arresto temporaneo

FILLER : dato riempitivo

simbolo S : segno
PICTURE S9(n)

simbolo V : virgola virtuale
m cifre int n cifre decimali
PICTURE 9(m)V9(n)

SPECIAL-NAMES.
	DECIMAL-POINT IS COMMA.

simbolo Z : sopprime gli zeri inutili nelle picture numeriche
PIC interna	contenuto	PIC di output	output
V99			34			Z99,999			00,340
V9			0			99,Z			00,0
v9			0			ZZ,Z			,0
9(5)		03595		ZZ.ZZZ			3.3595
9(5)		00123		ZZ.ZZZ			123
9(3)V99		02345		ZZZ.ZZ9,9		23,4

simbolo 0 : inserisce 0 indipendentemente dal contenuto del campo che deve essere portato in output
	inserisce, NON SOSTITUISCE!
PIC interna	contenuto	PIC di output	output
9(5)V99		0012345		999099,9000		001023,4000
9(4)		1234		9090			3040
9(5)		00012		99000			12000

simbolo $ : 2 possibilità d'uso, per pic numeriche editate come simbolo monetario
PIC interna	contenuto	PIC di output	output
9(4)		1234		$ZZZ9			 $1234
9(4)		0005		$ZZZ9			 $   5
9(4)		0005		$$$$$			    $5
9(4)		0005		$$$ZZ			   $ 5
9(4)		1234		$$.$$$			$1.234
9(4)		0123		$$.$$$			  $123

SPECIAL-NAMES.
	CURRENCY SIGN IS E F G H I M N O Q T U Y J W K = > <
	*rimpiazza il dollaro	

simboli + -
il + permette di visualizzare il segno di qualunque numero pos or neg
il - solo quando il numero è negativo
possono stare a dx o a sx
PIC interna	contenuto	PIC di output	output
S9(4)		1234 pos	ZZ.ZZZ+			1.234+
S9(4)		1234 neg	ZZ.ZZZ+			1.234-
S9(4)V9		12345 pos	ZZ.ZZZ,9-		1.234,5
S9(4)V9		12345 neg	ZZ.ZZZ,9-		1.234,5-
PIC interna	contenuto	PIC di output	output
S9(4)		1234 pos	+Z.ZZZ			+1.234
S9(4)		1234 neg	+Z.ZZZ			-1.234
S9(4)		1234 pos	+ZZ.ZZZ			+ 1.234
c'è anche il terzo modo, 	quello ripetuto

simboli CR e DB : evidenziano valori negativi

simbolo * : come Z ma gli zeri ed i separatori non significativi che si trovano in corrispondenza di zone del campo di output descritte dal simbolo asterisco vengono sostituite cin il simbolo asterisco
PIC interna	contenuto	PIC di output	output
9(3)		055			**9				*55
9(3)		055			*.**9			***55
9(4)		4455		***.**9			**4.455

simbolo B : inserisci caratteri blank
PIC interna	contenuto	PIC di output	output
X(4)		ROMA		XBXBXBX			R O M A
X(5)		AXT32		XXXBXX			AXT 32
9(4)		1234		ZBZBZBZ			1 2 3 4
9(4)		0123		ZBZBZBZ			  1 2 3

simbolo / : inserisce il simbolo barra
PIC interna	contenuto	PIC di output	output
9(6)		210273		99/99/99		21/02/73
X(6)		12345A		X(5)/X			12345/A

SPACE costante figurativa

categoria numerica : PIC costituita da 9 S V, costante ZERO, literals

categoria alfanumerica : PIC costituita da A X 9, purchè non num

categoria numerica editata : PIC con almeno un Z * $ , . + - CR DB
	oppure 0 B / senza A e X
	oppure un campo BLANK WHEN ZERO
	
categoria alfanumerica editata : almeno un B o / ed almeno un A o X

clausola REDEFINES
numero-di-livello nome-dato-1 REDEFINES nome-dato-2.
ridefinisce un campo, fa riferimento sempre al primo nome, sempre stesso numero di livello
01 A PIC X(10).
01 A1 REDEFINES A PIC 9(10).

esempio MOVE
A PIC X(4) VALUE "ROMA".
B PIC X(6).
MOVE A TO B.
B = "ROMA  "
campo ricevente alfanumerico viene caricato da sinistra verso destra!
per incolonnare a destra usare la JUST RIGHT al momento della definizione
B PIC X(6) JUST RIGHT.
MOVE A TO B.
B = "  ROMA"

il segno dei campi di categoria numerica
SIGN IS LEADING
		TRAILING
SEPARATE CHARACTER

se una variabile PICTURE 9,99 vale 0 si ottiene 0,00
se invece fosse stata PICTURE 9,99 BLANK WHEN ZERO si ottiene "  "

66 nome-dato RENAMES nome-dato1 [THRU nome-dato2].
esempio:
	01 CAMPO.
	   02 A PIC ...
	   02 B PIC ...
	   02 C PIC ...
	   02 D PIC ...
	   02 E PIC ...
	66 AREA RENAMES B THRU D.
	equivale a:
	01 CAMPO.
	   02 A PIC ...
	   02 AREA.
	      03 B PIC ...
	      03 C PIC ...
		  03 D PIC ...
	   02 E PIC ...

assegnazione di nomi-condizione
88 nome-condizione VALUE IS costante1 [THRU costante 2] [costante 3[THRU costante4]] ...
	esempio:
	sia C un campo di PICTURE 99, si vogliono individuare, per poterli trattare diversamente i seguenti casi:
	CASO-1: 7, 25-32, 74-81
	CASO-2: 11, 18-24, 82-99
	CASO-3: i rimanenti valori compresi tra 0 e 99
	
	basterà definire il campo C e predisporre opportuni livelli 88
	
	01 C PIC 99.
	   88 CASO-1 VALUES ARE 7 25 THRU 32 74 THRU 81.
	   88 CASO-2 VALUES ARE 11 18 THRU 24 82 THRU 99.
	  
	e per individuare il caso che interessa, basterà scivere in PROCEDURE DIVISION.
	IF CASO-1 ... .
	IF CASO-2 ... .

diversi modi di trattare i dati numerici
USAGE IS DISPLAY.
USAGE IS COMPUTATIONAL.
USAGE IS COMP.

clausola REVERSED per flussi di input, parte dalla fine

con LOCK il flusso non potrà essere riaperto

READ nome-flusso [INTO nome-dato] [AT END istruzione].

WRITE nome-record [FROM nome-dato]

clausola ROUNDED

ON SIZE ERROR ... . ...
gestisce x/0 e overflow

REMAINDER nome-dato
mette in nome-dato il resto della divisione
	DIVIDE A BY B GIVING C REMAINDER R.
	
il verbo COMPUTE per la matematica
	COMPUTE X = ((A + B)(A - B))**(1/3)
	
clausola CORRESPONDING
	per operazioni tra campi di ugual nome di gruppi diversi

test di segno nome-dato IS [NOT] NEGATIVE|POSITIVE|ZERO

GO TO nome-procedura.

da una PERFORM si ritorna:
	dopo l'esecuzione dell'ultima istruzione di nome-procedura
	con EXIT
	
PERFORM nome-procedura1 [THRU nome-procedura2] {nome-dato|intero} TIMES.

PERFORM nome-procedura1 [THRU nome-procedura2] UNTIL condizione.

con il verbo INSPECT si possono contare o sostituire, contare sostituire uno o più caratteri in un campo
	VALORE : ABCDEAAABBCXEE
	CONT   : 0
	INSPECT VALORE TALLYING CONT FOR ALL "A"
	CONT   : 4
	
	CAMPO : AABBBCDDABBCCCD
	INSPECT CAMPO REPLACING CHARACTERS BY "X" BEFORE INITIAL "C".
	CAMPO : XXXXXCDDABBCCCD
	
	AREA  : RXXBQWY    ""
	COUNT : 0
	INSPECT AREA TALLYING COUNT LEADING SPACE AFTER INITIAL SPACE REPLACING ALL "X" BY "B" 
			SPACE BY "*" AFTER INITIAL SPACE.
	AREA  : RBBBQWY*** ""
	COUNT : 3
	
il verbo STRING consente di fondere i contenuti parziali o completi di 2 o più campi in un singolo campo

UNSTRING (verbo) fa il contrario

verbo ENTER
	ENTER nome-linguaggio
	in PROCEDURE DIVISION.
	ENTER COBOL.
	
****capitolo 8****

tabelle, definizione

numero-di-livello nome-dato OCCURS intero TIMES PIC IS ... .
numero-di-livello nome-dato|FILLER OCCURS intero TIMES.
	01 TABELLA.
	   02 ELEM OCCURS 50 TIMES PIC X(25).

	01 TAB-PREZZI.
	   02 ELEM-ART OCCURS 120 TIMES.
	      03 COD-ART PIC X(7).
		  03 PRU     PIC 9(6).
		  
    01 TAB.
	   02 FILLER OCCURS 15 TIMES.
	      03 COD PIC X.
		  03 SPED PIC X(30).
		  
	01 REC-DIP.
	   02 MATR PIC X(5).
	   02 TRAT-ALIQUO OCCURS 8 TIMES PIC 9(7).

accedere ai dati
	   
	01 TABELLA.
	   02 EL-PROV OCCURS 150 TIMES.
	      03 CAP	 PIC 9(5).
		  03 NOME-PR PIC X(15).

	EL-PROV(4)
	CAP(8)
	NOME-PR(40)
	
	oppure
	
	EL-PROV(IND)
	CAP(IND)
	NOME-PR(IND)
	
caricamento tabelle, con VALUE o da flussi

	01 TAB.
	   02 TAB-MESI PIC X(36) VALUE "GENFEBMARAPRMAGGIULUGAGOSETOTTNOVDIC".
	   02 MESE REDEFINES TAB-MESI PIC X(3) OCCURS 12 TIMES.
	   
	oppure
	
	01 VALORI.
	   02 FILLER PIC 9(4)V99 VALUE 5.3.
	   02 FILLER PIC 9(4)V99 VALUE .08.
	   02 FILLER PIC 9(4)V99 VALUE 124.1.
	   02 FILLER PIC 9(4)V99 VALUE 7.
	   02 FILLER PIC 9(4)V99 VALUE 3.14.
	01 TAB-VAL REDEFINES VALORI.
	   02 VAL PIC 9(4)V99 OCCURS 5 TIMES.
	   
caricamento da flussi da vedere con flussi moderni

ricerca tabellare

tabelle gestite dal sistema

numero di livello nome-dato OCCURS intero TIMES INDEXED BY nome-indice1 [nome-indice2] ...
	tabella indexata:
	01 TAB.
	   02 CAMPO OCCURS 50 TIMES INDEXED BY IND.
	      03 CODTAB PIC X(4).
		  03 DESTAB PIC X(25).
	se si vuole indicare la ventesima DESTAB si scrive DESTAB(20) oppure DESTAB(IND) dove IND è stao preventivamente caricato in modo da puntare al 20simo elemento
	
indirizzamento relativo

nome-dato(nome-indice[{+|-} intero])

USAGE IS INDEX.

il verbo SET
SET nome-indice TO nome-indice|identificatore|costante
                UP BY nome-dato|costante
				DOWN BY nome-dato|costante
	esempi:
	SET X1 TO 4.
	SET X1 TO X2.
	SET INDICE UP BY 3.
	SET CAMPO DOWN BY VAL.

verbo SEARCH
	SEARCH nome-dato [VARYING{nome-indice|identificatore}]
	[AT END istruzioni1]
	WHEN condizione1 {istruzioni2|NEXT SENTENCE}
	[WHEN condizione2 {istruzioni3|NEXT SENTENCE}]...
	
	esempi
	
	WORKING-STORAGE SECTION.
	01 TABELLA.
	   02 ARTICOLO OCCURS 20 TIMES INDEXED BY IND.
	      03 COD PIC X(5).
	      03 DES PIC X(20).
		  
	PROCEDURE DIVISION.
	RICERCA.
	    SET IND TO 1
		SEARCH ARTICOLO AT END GO TO NON-TROV
		WHEN COD(IND) = COD-RICERCA GO TO TROV.
	
	WORKING-STORAGE SECTION.
	01 TAB-SCONTI.
	   02 SCONTI PIC X(30) VALUE "100535479007213861211709101529".
	   02 R-SC REDEFINES SCONTI.
	      03 SC PIC 99 OCCURS 15 TIMES INDEXED BY IND1.
	01 TAB-ARTICOLI.
	   02 ARTICOLO OCCURS 15 TIMES INDEXED BY IND2.
	      03 COD PIC X(5).
		  03 DES PIC X(30).
		  
	PROCEDURE DIVISION.
	RICERCA.
	    SET IND1 IND2 TO 1
		SEARCH ARTICOLO VARYING IND1
		AT END GO TO NON-TROVATO
		WHEN COD(IND2)=COD-RICERDA
		MOVE COD(IND2) TO COD-ST
		MOVE DES(IND2) TO DES-ST
		MOVE SC(IND1) TO SC-ST
		WRITE RIGA BEFORE 2 MOVE SPACE TO RIGA+
		GO TO LETTURA.
		
tabelle multidimensionali
	01 STATO.
	   02 REGIONE OCCURS 25 TIMES.
	      03 COD-REG PIC XX.
		  03 DES-REG PIC X(20).
		  03 PROVINCIA OCCURS 10 TIMES.
		     04 COD-PRO PIC XX.
			 04 DES-PRO PIC X(20).
	
	COD-REG(IND1)
	COD-PRO(5 VAL)
	DES-PRO(IND2 6)
	DES_PRO(IND1 IND2)
	
indexing
	01 STATO
	   02 REGIONE OCCURS 25 TIMES
	      INDEXED BY NUM1.
		  03 COD-REG PIC XX.
		  03 DES-REG PIC X(20).
		  03 PROVINCIA OCCURS 10 TIMES
		     INDEXED BY NUM2.
			 04 COD-PRO PIC XX.
			 04 DES-PRO PIC X(20).

indice con campo 77 : elementare, non può essere esteso			 

PERFORM ... VARYING...
	PERFORM nome-procedura1[THRU nome-procedura2]
	VARYING nome-dato1|nome-indice1 FROM nome-dato2|nome-indice2|costante1
	BY nome-dato3|costante2 UNTIL condizione.
	
	esempi:
	
	PERFORM PRX VARYING CONTATORE
	FROM 100 BY -10 UNTIL CONTATORE = -30.
	PERFORM STA VARYING CONT1 FROM -100
	BY -20 UNTIL ALFA = -200.
	PERFORM CT THRU EX-CT VARYING INDICE
	FROM A B PASSO UNTIL INDICE < C.
	
	vogliamo stampare dei moduli di sollecito per tutti i clienti della tabella TAB-SALDI che hanno un saldo negativo; è stato caricato, come ultimo elemento di tabella un cliente fittizio con saldo zero
	
	WORKING-STORAGE SECTION.
	77 X PIC 99.
	77 A PIC 99 VALUE 1.
	
	01 TAB-SALDI.
	   02 CLIENTE OCCURS 91.
	      03 COD PIC X(5).
		  03 SALDO PIC S9(7).
		  
	PROCEDURE DIVISION.
	...
	CERCA.
	    PERFORM INIZIO-ST THRU FINE-ST
		VARYING X FROM A BY 1
		UNTIL SALDO(X) NOT < 0.
		IF X NOT < 90 GO TO CONTINUA.
		ADD 1 X GIVING A
		GO TO CERCA.
	
	INIZIO-ST.
	    ...
	FINE-ST. EXIT.
	
	CONTINUA.
	    ...
	

****capitolo 9****

organizzazione sequenziale

riferimenti in ENVIRONMENT DIVISION.

	in ENVIRONMENT DIVISION i riferimenti ai flussi sono riportati nei paragrafi FILE-CONTROL ed I-O-CONTROL della INPUT-OUTPUT SECTION.
	In FILE-CONTROL per ogni flusso di elaborazione viene scritta una SELECT che per flussi organizzati in modo sequenziale ha la seguente struttura:
		SELECT [OPTIONAL] nome-flusso
		  ASSIGN TO nome-periferica
		  [FILE STATUS IS nome-dato]

riferimenti in DATA DIVISION

	il momento della DATA DIVISION in cui sono interessate le descrizioni dei flusi sono le FD File Desciption di DILE SECTION
	in FD vengono specificati:
	la presenza o meno delle etichette
	la lunghezza dei record logici e fisici
	
	FD nome-flusso
	    [BLOCK CONTAINS [intero1 TO] intero2 RECORDS|CHARACTERS]
		LABEL RECORD IS STANDARD
		
riferimenti in PROCEDURE DIVISION

	per quanto riguarda i verdi di PROCEDURE DIVIISION si presentano sotanzialmente solo alcune novita rispetto alle note introduttive sull'input per flussi sequenziali. I Flussi organizzati in modo sequenziale si prestano ad essere trattati anche in output in accodamento e in input/output infatti è consentita la riregistrazione dei record.
	
OPEN READ WRITE REWRITE

REWRITE nome-record [FROM nome-dato]

PROCEDURE DIVISION.
DECLARATIVES
    ERR1 SECTION.
	    USE ... .
	A1. ...
	...
END DECLARATIVES.

****APPENDICE A****

****APPENDICE B****

****APPENDICE C****

****APPENDICE D****

****APPENDICE E****

****APPENDICE F****

*

COMP-1 = int

