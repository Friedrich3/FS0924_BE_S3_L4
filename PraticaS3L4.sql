CREATE TABLE Impiegati(
	IDImpiegato INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Cognome VARCHAR(50) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	CodiceFiscale  VARCHAR(17) NOT NULL,
	Eta INT NOT NULL,
	RedditoMensile DECIMAL(7,2) NOT NULL,
	DetrazioneFiscale Bit NOT NULL
)
CREATE TABLE Impiego(
IDImpiego INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
TipoImpiego VARCHAR(50) NOT NULL,
Assunzione DATETIME NOT NULL
--1. Creare le relazioni tra le due tabelle applicando la corretta integrità referenziale, 
CONSTRAINT FK_Impiegato_Impiego FOREIGN KEY(IDImpiego) REFERENCES Impiegati(IDImpiegato)
)
--2. Popolare le tabelle con almeno 20 impiegati e i relativi dati dell’impiego,
	--1
INSERT INTO Impiegati VALUES('Rossi','Marco','RSSMRC85A01H501Z',40,'3200.00',1);
INSERT INTO Impiego VALUES('Amministrativo','2010-15-03 08:30:00');
	--2
INSERT INTO Impiegati VALUES('Bianchi',	'Laura','BNCLRA92C45F205Q',33,'2800.00',1);
INSERT INTO Impiego VALUES('Commerciale','2015-20-06 09:00:00');
	--3
INSERT INTO Impiegati VALUES('Verdi','Luca','VRDLCU78D12L219S',47,'4500.00',1);
INSERT INTO Impiego VALUES('Tecnico','2012-10-01 10:15:00');
	--4
INSERT INTO Impiegati VALUES('Gialli','Anna','GLLNNA83E22M052V',41,'3700.00',1);
INSERT INTO Impiego VALUES('Dirigente','2019-01-09 08:45:00');
	--5
INSERT INTO Impiegati VALUES('Neri','Paolo','NRIPLO90F14N234W',35,'3300.00',1);
INSERT INTO Impiego VALUES('Operativo','2023-12-04 09:30:00');
	--6
INSERT INTO Impiegati VALUES('Moretti','Elisa','MRTELS88G30R111Y',37,'2900.00',0);
INSERT INTO Impiego VALUES('Amministrativo','2008-25-11 08:00:00');
	--7
INSERT INTO Impiegati VALUES('Conti','Fabio','CNTFBA79H21C456Z',46,'4200.00',1);
INSERT INTO Impiego VALUES('Commerciale','2017-14-02 10:45:00');
	--8
INSERT INTO Impiegati VALUES('Colombo','Chiara','CLBCHR84I15D789A',40,'3400.00',0);
INSERT INTO Impiego VALUES('Tecnico','2020-30-05 09:15:00');
	--9
INSERT INTO Impiegati VALUES('Romano','Matteo','RMNMTT91L18E111B',24,'3100.00',1);
INSERT INTO Impiego VALUES('Dirigente','2016-19-08 08:30:00');
	--10
INSERT INTO Impiegati VALUES('Ferri','Sara','FRRSRA86M25F222C',39,'3800.00',1);
INSERT INTO Impiego VALUES('Operativo','2007-22-07 10:00:00');
--11
INSERT INTO Impiegati VALUES('Esposito','Andrea','ESPAND82A29G333D',43,'4100.00',0);
INSERT INTO Impiego VALUES('Amministrativo','2018-05-12 08:15:00');
--12
INSERT INTO Impiegati VALUES('Ricci','Giulia','RCCGLI89B17H444E',36,'3000.00',0);
INSERT INTO Impiego VALUES('Commerciale','2021-28-03 09:45:00');
--13
INSERT INTO Impiegati VALUES('Marino','Stefano','MRNSTF81C05I555F',44,'4300.00',1);
INSERT INTO Impiego VALUES('Tecnico','2009-13-10 10:30:00');
--14
INSERT INTO Impiegati VALUES('Greco','Francesca','GRCFNC93D13L666G',32,'2700.00',1);
INSERT INTO Impiego VALUES('Dirigente','2014-02-04 08:00:00');
--15
INSERT INTO Impiegati VALUES('Bruno','Simone','BRNSMN87E19M777H',38,'3500.00',0);
INSERT INTO Impiego VALUES('Operativo','2022-07-07 09:00:00');
--16
INSERT INTO Impiegati VALUES('Rizzo','Martina','RZZMTN80F22N888I',45,'4600.00',1);
INSERT INTO Impiego VALUES('Amministrativo','2005-17-02 08:30:00');
--17
INSERT INTO Impiegati VALUES('Lombardi','Davide','LMBDVD92G18R999J',33,'2900.00',0);
INSERT INTO Impiego VALUES('Commerciale','2013-09-11 10:15:00');
--18
INSERT INTO Impiegati VALUES('Barbieri','Federica','BRBFRD85H24S111K',40,'3600.00',1);
INSERT INTO Impiego VALUES('Tecnico','2024-29-01 08:45:00');
--19
INSERT INTO Impiegati VALUES('Vitale','Alessandro','VTLALS88I30T222L',37,'3200.00',0);
INSERT INTO Impiego VALUES('Dirigente','2006-21-05 09:15:00');
--20
INSERT INTO Impiegati VALUES('De Luca','Valentina','DLCVLN79L11U333M',46,'4400.00',1);
INSERT INTO Impiego VALUES('Operativo','2025-14-02 10:00:00');

--3. Successivamente creare le seguenti interrogazioni per mezzo di T-SQL: a. Visualizzare tutti gli impiegati oltre i 29 anni;  
SELECT * FROM Impiegati WHERE Eta > 29;
--b. Visualizzare tutti gli impiegati con un reddito di almeno 800 euro mensili;
SELECT * FROM Impiegati WHERE RedditoMensile> 800.00;
--c. Visualizzare tutti gli impiegati che posseggono la detrazione fiscale;
SELECT * FROM Impiegati WHERE DetrazioneFiscale = 1;
--d. Visualizzare tutti gli impiegati che non posseggono la detrazione fiscale;
SELECT * FROM Impiegati WHERE DetrazioneFiscale = 0;
--e. Visualizzare tutti gli impiegati cui il cognome cominci con una lettera G e li visualizzi in ordine alfabetico;
SELECT * FROM Impiegati WHERE Cognome LIKE ('G%') ORDER BY Cognome ASC;
--f. Visualizzare il numero totale degli impiegati registrati nella base dati;
SELECT COUNT(*) FROM Impiegati
--g. Visualizzare il totale dei redditi mensili di tutti gli impiegati;
SELECT SUM(RedditoMensile) FROM Impiegati
--h. Visualizzare la media dei redditi mensili di tutti gli impiegati;
SELECT AVG(RedditoMensile) FROM Impiegati
--i. Visualizzare l’importo del reddito mensile maggiore;
SELECT MAX(RedditoMensile) FROM Impiegati
--j. Visualizzare l’importo del reddito mensile minore;
SELECT MIN(RedditoMensile) FROM Impiegati
--k. Visualizzare gli impiegati assunti dall’ 01/01/2007 all’ 01/01/2008;
SELECT Impiegati.Nome, Impiegati.Cognome, Impiego.Assunzione
FROM Impiegati
INNER JOIN
Impiego ON
IDImpiegato = IDImpiego
WHERE Impiego.Assunzione BETWEEN '2007-01-01' AND '2008-01-01'
--l. Tramite una query parametrica che identifichi il tipo di impiego, visualizzare tutti gli impiegati che corrispondono a quel tipo di impiego;
SELECT Impiegati.Nome, Impiegati.Cognome, Impiego.TipoImpiego
FROM Impiegati
INNER JOIN Impiego ON IDImpiegato = IDImpiego
WHERE Impiego.TipoImpiego = 'Operativo'
--m. Visualizzare l’età media dei lavoratori all’interno dell’azienda
SELECT AVG(Eta) FROM Impiegati