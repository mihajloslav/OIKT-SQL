/*URAĐENI SQL ZADACI SA TABELAMA ZA TESTIRANJE By @mihajloslav
Urađeni rokovi:
- Februar 2022. (nisam siguran) (nzm koja grupa)
- Jun 2022. (II Grupa)
- II kolokvijum 2018. (I, II, III i IV Grupa)
- Januar 2018. (I i II Grupa)
- Jun 2017. (I i II Grupa)
- Septembar 2017. (I i II Grupa)
- Oktobar 2017. (I i II Grupa)*/

/*--------------------------------------------------------------------------------------*/
/*----------FEBRUARSKI ISPITNI ROK 2022.(nisam siguran)---------------------------------*/
/*--------------------------------------------------------------------------------------*/
/*Nzm koja grupa*/
/*11. Neka je data tabela: Student(sid: integer, name: char(20), surname: char(20), country: char(30),
hobby: char(20), graduation_year: integer), gde je primarni ključ sid.*/

CREATE TABLE Student(
	Sid INT PRIMARY KEY,
  	Name CHAR(20),
  	Surname CHAR(20),
  	Country CHAR(30),
  	Hobby CHAR(20),
  	Graduation_year INT
);
INSERT INTO Student
VALUES(1, 'Zoran', 'Pavlović', 'Republika Srbija', 'Košarka', 2021),
(2, 'Miloš', 'Petrović', 'Španija', 'Odbojka', 2021),
(3, 'Filip', 'Marković', 'Francuska', 'Rukomet', 2020),
(4, 'Milan', 'Jovanović', 'Republika Srbija', 'Košarka', 2021),
(5, 'Ana', 'Milovanović', 'Republika Srbija', 'Košarka', 2021),
(6, 'Nada', 'Stošić', 'Slovenija', 'Fudbal', 2019),
(7, 'Milena', 'Perić', 'Republika Srbija', 'Vaterpolo', 2020);

SELECT * FROM Student;
/*a) Napisati SQL koandu kojom se prikazuje broj studenata koji nisu iz Francuske po državama iz kojih ima
manje od 6 studenata. Komandu napisati takok da ne zavisi od trenutnog sadržaja tabele Student.*/
SELECT Country, COUNT(*) FROM Student WHERE Country != 'Francuska' GROUP BY Country HAVING COUNT(*) < 6;
SELECT Country, COUNT(*) FROM Student WHERE Country NOT IN('Francuska') GROUP BY Country HAVING COUNT(*) < 6;

/*pošto piše da ne zavisi od tabele onda ide ovako*/
SELECT Država, COUNT(*) FROM Student WHERE Država != 'Francuska' GROUP BY Država HAVING COUNT(*) < 6;
SELECT Država, COUNT(*) FROM Student WHERE Država NOT IN('Francuska') GROUP BY Država HAVING COUNT(*) < 6;

/*b) Napisati SQL komandu kojom se prikazuju svi podaci o studentima koji su diplomirali 2021-e godine ili
ranije (Graduation_year) sortirano po prezimenu (Surname) u opadajućem redosledu.*/
SELECT * FROM Student Where graduation_year <= 2021 ORDER BY Surname DESC;

/*--------------------------------------------------------------------------------------*/
/*----------------------JUNSKI ISPITNI ROK 25.06.2022-----------------------------------*/
/*--------------------------------------------------------------------------------------*/

/*---------------------------II Grupa---------------------------------*/
/*11. Neka su date sledeće dve tabele: Emp(eid: integer, did: integer, sal: integer, hobby: 
char(20)) i Dept(did: integer, dname: char(20), floor: integer, budget: real), gde su primarni 
ključevi eid u tabeli Emp i did u tabeli Dept.*/
CREATE TABLE Emp(
 	Eid INT PRIMARY KEY,
  	Did INT,
  	Sal INT,
  	Hobby CHAR(20)
);

CREATE TABLE Dept(
 	Did INT PRIMARY KEY,
  	Dname CHAR(20),
  	Floor INT,
  	Budget REAL
);

INSERT INTO Emp
VALUES (1, 10, 1000, 'Košarka'),
(2, 20, 3000, 'Odbojka'),
(3, 30, 3500, 'Rukomet'),
(4, 30, 5000, 'Košarka'),
(5, 40, 2500, 'Košarka'),
(6, 40, 2500, 'Fudbal'),
(7, 50, 3500, 'Vaterpolo');

INSERT INTO Dept
VALUES (10, 'Dept1', 1, 50000),
(20, 'Dept2', 2, 60000),
(30, 'Dept3', 3, 100000),
(40, 'Dept4', 4, 80000),
(50, 'Dept5', 5, 40000);

SELECT * FROM Emp;
SELECT * FROM Dept;

/*Napisati šta će biti rezultat sledećeg SQL upita:
SELECT 2*MIN(E.Sal), MAX(E.Sal), 2*MAX(E.Sal)-MIN(E.Sal)+23, AVG(E.Sal)+11
FROM Emp E, Dept D
WHERE E.did = D.did AND D.floor = 3 AND E.Sal >= 3501;*/
SELECT 2*MIN(E.Sal), MAX(E.Sal), 2*MAX(E.Sal)-MIN(E.Sal)+23, AVG(E.Sal)+11
FROM Emp E, Dept D
WHERE E.did = D.did AND D.floor = 3 AND E.Sal >= 3501;

/*REZULTAT: 10000, 5000, 5023, 5011*/

/*--------------------------------------------------------------------------------------*/
/*----------------------II Kolokvijum 2018.---------------------------------------------*/
/*--------------------------------------------------------------------------------------*/

/*Neka su date sledeće dve tabele: Emp(eid: integer, did: integer, ename: char(20), sal: integer, hobby: 
char(20)) i Dept(did: integer, dname: char(20), floor: integer, budget: real), gde su primarni ključevi eid
(identifikator zaposlenog) u tabeli Emp i did (identifikator organizacionog dela) u tabeli Dept. */
CREATE TABLE Emp(
 	Eid INT PRIMARY KEY,
  	Did INT,
  	Ename CHAR(20),
  	Sal INT,
  	Hobby CHAR(20)
);

CREATE TABLE Dept(
 	Did INT PRIMARY KEY,
  	Dname CHAR(20),
  	Floor INT,
  	Budget REAL
);

INSERT INTO Emp
VALUES (1, 10, 'Zoran', 1000, 'Košarka'),
(2, 20, 'Nikola', 1500, 'Odbojka'),
(3, 20, 'Filip', 2000, 'Rukomet'),
(4, 30, 'Stevan', 2500, 'Košarka'),
(5, 30, 'Goran', 2500, 'Košarka'),
(6, 40, 'Marko', 2500, 'Fudbal'),
(7, 50, 'Dragan', 3500, 'Vaterpolo');

INSERT INTO Dept
VALUES (10, 'Dept1', 1, 50000),
(20, 'Dept2', 2, 60000),
(30, 'Dept3', 3, 100000),
(40, 'Dept4', 4, 80000),
(50, 'Dept5', 5, 40000);

SELECT * FROM Emp;
SELECT * FROM Dept;

/*Tabela je ista za I, III i IV grupu!!!!!!!!!!!*/

/*---------------------------I Grupa---------------------------------*/
/*1.*/

/*a) Napisati SQL komandu kojom se prikazuje identif. org. dela (Did), ime zaposlenog i iznos plate. 
Identifikatore org. delova prikazati u opadajućem redosledu, a imena zaposlenih u rastućem.*/
SELECT Did, Ename, Sal FROM Emp ORDER BY Did DESC, Ename ASC;

/*b) Napisati SQL komandu kojom se prikazuju svi podaci o zaposlenima čije se ime završava slovom ‘n’ i koji 
imaju platu veću ili jednaku 2500 $.*/
SELECT * FROM Emp WHERE Ename Like '%n' AND Sal >= 2500;

/*2. Pretpostaviti da je data tabela Zaposleni koja ima kolonu Prezime (tipa char (25)). Napisati SQL komandu 
kojom se prikazuju svi podaci o zaposlenima čije je prezime alfabetski između (i uključujući) prezimena 
“Markovic” i “Ristic”.*/

/*Komanda*/
SELECT * FROM Zaposleni WHERE Prezime BETWEEN 'Markovic' AND 'Ristic';

/*Tabela za testiranje*/
CREATE TABLE Zaposleni(
    ID INT PRIMARY KEY,
    Ime CHAR(20),
    Prezime CHAR(25),
    Plata INT
);

INSERT INTO Zaposleni
VALUES (1, 'Zaposleni1', 'Markovic', 50000),
(2, 'Zaposleni2', 'Petrovic', 60000),
(3, 'Zaposleni3', 'Ristic', 70000),
(4, 'Zaposleni4', 'Jovanovic', 80000),
(5, 'Zaposleni5', 'Nikolic', 90000);

/*---------------------------III Grupa---------------------------------*/

/*1.*/
/*a) Napisati opštu SQL komandu (tako da ne zavisi od trenutnog sadržaja prikazanih tabela) kojom se prikazuje 
identifikator zaposlenog, ime zaposlenog i iznos plate zaposlenog za sve zaposlene čiji naziv hobija ne 
počinje slovom “V”. Prikaz sortirati tako da ime zaposlenog bude u rastućem redosledu.*/
SELECT Eid, Ename, Sal FROM Emp WHERE Ename NOT Like 'V%' ORDER BY Ename ASC;


/*b) Napisati SQL komandu kojom se prikazuju svi podaci o zaposlenima čija plata nije u opsegu (2500 $, 3500 
$).*/
SELECT * FROM Emp WHERE Sal NOT BETWEEN 2500 AND 3500;


/* 6. Pretpostaviti da je data tabela Proizvodi koja pored ostalih kolona ima i kolone Cena (tipa integer) i 
Kategorija (tipa integer). Napisati SQL komandu koristeći operator BETWEEN kojom se prikazuju svi podaci o 
proizvodima čija je cena u opsegu (uključene su krajnje vrednosti) od 100 RSD do 250 RSD i čija kategorija nije 
1, 2 ili 3. */

/*Komanda*/
SELECT * FROM Proizvodi WHERE Cena BETWEEN 100 AND 250 AND Kategorija NOT IN(1,2,3);

/*Tabela za testiranje*/
CREATE TABLE Proizvodi(
    ID INT PRIMARY KEY,
    Naziv CHAR(20),
    Cena INT,
    Kategorija INT
);

INSERT INTO Proizvodi
VALUES (1, 'Proizvod1', 100, 1),
(2, 'Proizvod2', 150, 4),
(3, 'Proizvod3', 200, 5),
(4, 'Proizvod4', 250, 2),
(5, 'Proizvod5', 300, 3),
(6, 'Proizvod6', 300, 5);

/*---------------------------IV Grupa---------------------------------*/

/*1.*/
/*a) Napisati opštu SQL komandu (tako da ne zavisi od trenutnog sadržaja prikazanih tabela) kojom se prikazuje 
identifikator zaposlenog, ime zaposlenog i iznos plate zaposlenog za sve zaposlene čiji naziv hobija ne počinje 
slovom “R”. Prikaz sortirati tako da ime zaposlenog bude u opadajućem redosledu.*/
SELECT Eid, Ename, Sal FROM Emp WHERE Ename NOT Like 'R%' ORDER BY Ename DESC;

/*b) Napisati SQL komandu kojom se prikazuju svi podaci o zaposlenima čija plata nije u opsegu (1000 $, 1500 
$). */
SELECT * FROM Emp WHERE Sal NOT BETWEEN 1000 AND 1500;

/*6. Pretpostaviti da je data tabela Proizvodi koja pored ostalih kolona ima i kolone Cena (tipa integer) i 
Kategorija (tipa integer). Napisati SQL komandu koristeći operator BETWEEN kojom se prikazuju svi podaci o 
proizvodima čija je cena u opsegu (uključene su krajnje vrednosti) od 300 RSD do 550 RSD i čija kategorija nije 
2, 3 ili 5.*/

/*Komanda*/
SELECT * FROM Proizvodi WHERE Cena BETWEEN 300 AND 550 AND Kategorija NOT IN(2,3,5);

/*Tabela za testiranje*/
CREATE TABLE Proizvodi(
    ID INT PRIMARY KEY,
    Naziv CHAR(20),
    Cena INT,
    Kategorija INT
);

INSERT INTO Proizvodi
VALUES (1, 'Proizvod1', 300, 1),
(2, 'Proizvod2', 350, 4),
(3, 'Proizvod3', 400, 5),
(4, 'Proizvod4', 550, 2),
(5, 'Proizvod5', 600, 6);


/*---------------------------II Grupa---------------------------------*/

/*1. Neka su date sledeće dve tabele: Emp(eid: integer, did: integer, ename: char(20), sal: integer, hobby: char(20)) 
i Dept(did: integer, dname: char(20), floor: integer, budget: real), gde su primarni ključevi eid u tabeli Emp i did 
u tabeli Dept. */
CREATE TABLE Emp(
 	Eid INT PRIMARY KEY,
  	Did INT,
  	Ename CHAR(20),
  	Sal INT,
  	Hobby CHAR(20)
);

CREATE TABLE Dept(
 	Did INT PRIMARY KEY,
  	Dname CHAR(20),
  	Floor INT,
  	Budget REAL
);

INSERT INTO Emp
VALUES (1, 10, 'Zoran', 1000, 'Košarka'),
(2, 20, 'Nikola', 1500, 'Odbojka'),
(3, 20, 'Filip', 2000, 'Rukomet'),
(4, 30, 'Stevan', 2500, 'Košarka'),
(5, 30, 'Goran', 1500, 'Košarka'),
(6, 40, 'Marko', 2500, 'Fudbal'),
(7, 50, 'Dragan', 3500, 'Vaterpolo');

INSERT INTO Dept
VALUES (10, 'Dept1', 1, 50000),
(20, 'Dept2', 2, 60000),
(30, 'Dept3', 3, 100000),
(40, 'Dept4', 4, 80000),
(50, 'Dept5', 5, 40000);

SELECT * FROM Emp;
SELECT * FROM Dept;

/*a) Napisati SQL komandu kojom se prikazuje identif. org. dela (Did), ime zaposlenog i iznos plate. 
Identifikatore org. delova prikazati u rastućem redosledu, a imena zaposlenih u opadajućem.*/
SELECT Did, Ename, Sal FROM Emp ORDER BY Did ASC, Ename DESC;

/*b) Napisati SQL komandu kojom se prikazuju svi podaci o zaposlenima čije se ime završava slovom ‘p’ i koji 
imaju platu veću ili jednaku 2000 $.*/
SELECT * FROM Emp WHERE Ename Like '%p' AND Sal >= 2000;

/*8. Pretpostaviti da je data tabela Zaposleni koja ima kolonu Prezime (tipa char(25)). Napisati SQL komandu 
kojom se prikazuju svi podaci o zaposlenima čije je prezime alfabetski između (i uključujući) prezimena “Arsic” 
i “Pavlovic”. */

/*Komanda*/
SELECT * FROM Zaposleni WHERE Prezime BETWEEN 'Arsic' AND 'Pavlovic';

/*Tabela za testiranje*/
CREATE TABLE Zaposleni(
    ID INT PRIMARY KEY,
    Ime CHAR(20),
    Prezime CHAR(25),
    Plata INT
);

INSERT INTO Zaposleni
VALUES (1, 'Zaposleni1', 'Arsic', 50000),
       (2, 'Zaposleni2', 'Jankovic', 60000),
       (3, 'Zaposleni3', 'Markovic', 70000),
       (4, 'Zaposleni4', 'Pavlovic', 80000),
       (5, 'Zaposleni5', 'Ristic', 90000);


/*--------------------------------------------------------------------------------------*/
/*-----------------------JANUARSKI ISPITNI ROK 30.01.2018.------------------------------*/
/*--------------------------------------------------------------------------------------*/

/*Neka je data tabela Region_Prodaja koja sadrži podatke o ostvarenim narudžbenicama i prodajama datog 
proizvoda po regionima i godinama: */
CREATE TABLE Region_Prodaja(
	Region CHAR(20),
  	Godina INT,
  	Broj_Narudzbenica INT,
  	Ukupna_Prodaja INT
);
INSERT INTO Region_Prodaja
VALUES ('Zapad', 2017, 1560, 325000),
('Zapad', 2016, 1820, 380000),
('Sever', 2017, 790, 148000),
('Sever', 2016, 995, 185000),
('Istok', 2017, 1760, 375000),
('Istok', 2016, 2220, 450000),
('Jug', 2017, 1790, 388000),
('Jug', 2016, 1695, 360000);

SELECT * FROM Region_Prodaja;

/*---------------------------I Grupa---------------------------------*/

/*11.*/

/*a) Napisati SQL upit koji izračunava ukupan broj narudžbenica za svaki region (tj. za dvogodišnji period 
prodaje).  */
SELECT Region, SUM(Broj_Narudzbenica) AS [Ukupan Broj Narudžbenica Za Svaki Region] FROM Region_Prodaja GROUP BY Region;

/*b) Napisati SQL komandu kojom se brišu podaci u poljima Ukupna_Prodaja i postavljaju na vrednost 0 
samo za 2016. godinu.*/
Update Region_Prodaja
SET Ukupna_Prodaja = 0
WHERE Godina = 2016;

/*16. Neka je data tabela Student(id: integer, broj_indeksa: char(15), ime: char(20), prezime: char (25), 
mesto_rodjenja: char(25), email: char(25)).*/

/*Ovo ovde je primer tabele*/
CREATE TABLE Student (
    id INTEGER,
    broj_indeksa CHAR(15),
    ime CHAR(20),
    prezime CHAR(25),
    mesto_rodjenja CHAR(25),
    email CHAR(25)
);

INSERT INTO Student (id, broj_indeksa, ime, prezime, mesto_rodjenja, email)
VALUES 
(1, 'BI001', 'Marko', 'Markovic', 'Beograd', NULL),
(2, 'BI002', 'Jovan', 'Jovanovic', 'Novi Sad', 'jovan@gmail.com'),
(3, 'BI003', 'Petar', 'Petrovic', 'Nis', 'petar@gmail.com'),
(4, 'BI004', 'Ivan', 'Ivanovic', 'Kragujevac', 'ivan@gmail.com'),
(5, 'BI005', 'Nikola', 'Nikolic', 'Subotica', NULL),
(6, 'BI006', 'Milos', 'Milosevic', 'Zrenjanin', 'milos@gmail.com'),
(7, 'BI007', 'Aleksandar', 'Aleksic', 'Kraljevo', 'aleksandar@gmail.com');

SELECT * FROM Student;

/*a) Prikazati SQL komandu kojom se dodaju podaci za studenta kod 
koga je id = 100, a svi ostali podaci odgovaraju Vašim podacima. */
INSERT INTo Student
VALUES (100, 'broj_indeksa', 'ime', 'prezime', 'mesto rodjenja', 'email');

/*b) Napisati SQL komandu kojom se prikazuju 
svi podaci za studente kod kojih polje email ima NULL vrednost.*/
SELECT * FROM Student WHERE email IS NULL;



/*---------------------------II Grupa---------------------------------*/

/*11.*/

/*a) Napisati SQL upit koji izračunava ukupan iznos prodaja za svaki region (tj. za dvogodišnji period 
prodaje). */
SELECT Region, SUM(Ukupna_Prodaja) AS [Ukupan Iznos Prodaja Za Svaki Region] FROM Region_Prodaja GROUP BY Region;

/*b) Napisati SQL komandu kojom se brišu podaci u poljima Broj_Narudžbenica i Ukupna_Prodaja i 
postavljaju na vrednost 0 samo za 2016. godinu. */
Update Region_Prodaja
SET Broj_Narudzbenica = 0, Ukupna_Prodaja = 0
WHERE Godina = 2016;


/*13. Neka je data tabela Student(id: integer, broj_indeksa: char(15), ime: char(20), prezime: char (25), 
mesto_rodjenja: char(25), email: char(25)).*/ 

/*Ovo ovde je primer tabele*/
CREATE TABLE Student (
    id INTEGER,
    broj_indeksa CHAR(15),
    ime CHAR(20),
    prezime CHAR(25),
    mesto_rodjenja CHAR(25),
    email CHAR(25)
);

INSERT INTO Student (id, broj_indeksa, ime, prezime, mesto_rodjenja, email)
VALUES 
(1, 'BI001', 'Marko', 'Markovic', 'Beograd', NULL),
(2, 'BI002', 'Jovan', 'Jovanovic', 'Novi Sad', 'jovan@gmail.com'),
(3, 'BI003', 'Petar', 'Petrovic', 'Nis', 'petar@gmail.com'),
(4, 'BI004', 'Ivan', 'Ivanovic', 'Kragujevac', 'ivan@gmail.com'),
(5, 'BI005', 'Nikola', 'Nikolic', 'Subotica', NULL),
(6, 'BI006', 'Milos', 'Milosevic', 'Zrenjanin', 'milos@gmail.com'),
(7, 'BI007', 'Aleksandar', 'Aleksic', 'Kraljevo', 'aleksandar@gmail.com');

SELECT * FROM Student;

/*a) Prikazati SQL komandu kojom se dodaju podaci za studenta kod koga je id = 100, a svi ostali podaci odgovaraju Vašim podacima.*/ 
INSERT INTo Student
VALUES (100, 'broj_indeksa', 'ime', 'prezime', 'mesto rodjenja', 'email');

/*b) Napisati SQL komandu kojom se prikazuju svi podaci za studente kod kojih polje email nema NULL vrednost.*/
SELECT * FROM Student WHERE email IS NOT NULL;

/*--------------------------------------------------------------------------------------*/
/*----------------------JUNSKI ISPITNI ROK 20.06.2017.----------------------------------*/
/*--------------------------------------------------------------------------------------*/

/*Neka je data tabela Region_Prodaja koja sadrži podatke o ostvarenim narudžbenicama i prodajama datog 
proizvoda po regionima i godinama*/
CREATE TABLE Region_Prodaja(
	Region CHAR(20),
  	Godina INT,
  	Broj_Narudzbenica INT,
  	Ukupna_Prodaja INT
);
INSERT INTO Region_Prodaja
VALUES ('Zapad', 2015, 1560, 325000),
('Zapad', 2016, 1820, 380000),
('Sever', 2015, 790, 148000),
('Sever', 2016, 995, 185000),
('Istok', 2015, 1760, 375000),
('Istok', 2016, 2220, 450000),
('Jug', 2015, 1790, 388000),
('Jug', 2016, 1695, 360000);

SELECT * FROM Region_Prodaja;


/*---------------------------I Grupa---------------------------------*/

/*11.*/

/*a) Napisati SQL upit koji izračunava ukupan iznos prodaja za svaki region (tj. za dvogodišnji period 
prodaje).*/
SELECT Region, SUM(Ukupna_Prodaja) AS [Ukupan Iznos Prodaja Za Svaki Region] FROM Region_Prodaja GROUP BY Region;

/*b) Napisati SQL upit koji prikazuje prosečan godišnji iznos ostvarenih prodaja po regionu samo za oblast 
obuhvaćenu regionima “Istok” i “Zapad” za 2016. godinu.*/
SELECT Region, AVG(Ukupna_Prodaja) AS [Prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu] 
FROM Region_Prodaja WHERE Godina = 2016 AND Region IN('Istok','Zapad') GROUP BY Region;

/*ili*/

SELECT Region, AVG(Ukupna_Prodaja) AS [Prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu]
FROM Region_Prodaja WHERE Godina = 2016 AND (Region = 'Istok' OR Region = 'Zapad') GROUP BY Region;



/*---------------------------II Grupa---------------------------------*/

/*11.*/

/*a) Napisati SQL upit koji izračunava ukupan broj narudžbenica za svaki region (tj. za dvogodišnji period 
prodaje). (5p) */

SELECT Region, SUM(Broj_Narudzbenica) AS [Ukupan Broj Narudžbenica Za Svaki Region] FROM Region_Prodaja GROUP BY Region;

/*b) Napisati SQL upit koji prikazuje prosečan godišnji iznos ostvarenih prodaja po regionu samo za oblast 
obuhvaćenu regionima “Sever” i “Jug” za 2016. godinu.*/
SELECT Region, AVG(Ukupna_Prodaja) AS [Prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu] 
FROM Region_Prodaja WHERE Godina = 2016 AND Region IN('Sever','Jug') GROUP BY Region;

/*ili*/

SELECT Region, AVG(Ukupna_Prodaja) AS [Prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu]
FROM Region_Prodaja WHERE Godina = 2016 AND (Region = 'Sever' OR Region = 'Jug') GROUP BY Region;

/*16. Neka je data tabela Student(id: integer, broj_indeksa: char(15), ime: char(20), prezime: char (25), 
mesto_rodjenja: char(25), email: char(25)). Prikazati SQL komandu kojom se dodaju podaci za studenta kod 
koga je id = 100, a svi ostali podaci odgovaraju Vašim podacima.*/
INSERT INTo Student
VALUES (100, 'broj_indeksa', 'ime', 'prezime', 'mesto rodjenja', 'email');

/*--------------------------------------------------------------------------------------*/
/*--------------------SEPTEMBARSKI ISPITNI ROK 03. 09. 2017-----------------------------*/
/*--------------------------------------------------------------------------------------*/

/*---------------------------I Grupa---------------------------------*/

/*11. Neka su date sledeće dve tabele: Emp(eid: integer, did: integer, sal: integer, hobby: 
char(20)) i Dept(did: integer, dname: char(20), floor: integer, budget: real), gde su primarni 
ključevi eid u tabeli Emp i did u tabeli Dept.*/
CREATE TABLE Emp(
 	Eid INT PRIMARY KEY,
  	Did INT,
  	Sal INT,
  	Hobby CHAR(20)
);

CREATE TABLE Dept(
 	Did INT PRIMARY KEY,
  	Dname CHAR(20),
  	Floor INT,
  	Budget REAL
);

INSERT INTO Emp
VALUES (1, 10, 1000, 'Košarka'),
(2, 20, 1500, 'Odbojka'),
(3, 30, 2000, 'Rukomet'),
(4, 30, 2500, 'Košarka'),
(5, 40, 2300, 'Košarka'),
(6, 40, 2900, 'Fudbal'),
(7, 50, 3500, 'Vaterpolo');

INSERT INTO Dept
VALUES (10, 'Dept1', 1, 50000),
(20, 'Dept2', 2, 60000),
(30, 'Dept3', 3, 100000),
(40, 'Dept4', 4, 80000),
(50, 'Dept5', 5, 40000);

SELECT * FROM Emp;
SELECT * FROM Dept;

/*Napisati šta će biti rezultat sledećeg SQL upita: 
SELECT 3*MIN(E.Sal), MAX(E.Sal), MAX(E.Sal)-MIN(E.Sal), AVG(E.Sal)+35 
FROM Emp E, Dept D 
WHERE E.did = D.did AND D.floor = 4 AND E.Sal < 3500*/
SELECT 3*MIN(E.Sal), MAX(E.Sal), MAX(E.Sal)-MIN(E.Sal), AVG(E.Sal)+35 
FROM Emp E, Dept D 
WHERE E.did = D.did AND D.floor = 4 AND E.Sal < 3500;

/*REZULTAT: 6900, 2900, 600, 2635*/
 


/*12. Napisati SQL komandu kojom se svim zaposlenima koji trenutno imaju platu 50 000 RSD 
u datoj kompaniji, plata povećava na 60 000 RSD. Pretpostaviti da je naziv tabele Zaposleni i 
da je naziv odgovarajuće kolone Plata. Nakon ažuriranja uraditi potvrdu upisa vrednosti 
(koristiti komandu za potvrdu vrednosti). */

/*Komanda*/
UPDATE Zaposleni 
SET Plata = 60000
WHERE Plata = 50000;
COMMIT;

/*Tabela za testiranje*/
CREATE TABLE Zaposleni(
    ID INT PRIMARY KEY,
    Ime CHAR(20),
    Plata INT
);

INSERT INTO Zaposleni
VALUES (1, 'Zaposleni1', 50000),
(2, 'Zaposleni2', 50000),
(3, 'Zaposleni3', 60000),
(4, 'Zaposleni4', 70000),
(5, 'Zaposleni5', 80000);

SELECT * FROM Zaposleni;

/*---------------------------II Grupa---------------------------------*/

/*11. Neka su date sledeće dve tabele: Emp(eid: integer, did: integer, sal: integer, hobby: 
char(20)) i Dept(did: integer, dname: char(20), floor: integer, budget: real), gde su primarni 
ključevi eid u tabeli Emp i did u tabeli Dept.*/
CREATE TABLE Emp(
 	Eid INT PRIMARY KEY,
  	Did INT,
  	Sal INT,
  	Hobby CHAR(20)
);

CREATE TABLE Dept(
 	Did INT PRIMARY KEY,
  	Dname CHAR(20),
  	Floor INT,
  	Budget REAL
);

INSERT INTO Emp
VALUES (1, 10, 1000, 'Košarka'),
(2, 20, 3000, 'Odbojka'),
(3, 30, 3500, 'Rukomet'),
(4, 30, 5000, 'Košarka'),
(5, 40, 2500, 'Košarka'),
(6, 40, 2500, 'Fudbal'),
(7, 50, 3500, 'Vaterpolo');

INSERT INTO Dept
VALUES (10, 'Dept1', 1, 50000),
(20, 'Dept2', 2, 60000),
(30, 'Dept3', 3, 100000),
(40, 'Dept4', 4, 80000),
(50, 'Dept5', 5, 40000);

SELECT * FROM Emp;
SELECT * FROM Dept;

/*Napisati šta će biti rezultat sledećeg SQL upita: 
SELECT 2*MIN(E.Sal), MAX(E.Sal), 2*MAX(E.Sal)-MIN(E.Sal), AVG(E.Sal)+3 
FROM Emp E, Dept D 
WHERE E.did = D.did AND D.floor = 3 AND E.Sal >= 3500*/
SELECT 2*MIN(E.Sal), MAX(E.Sal), 2*MAX(E.Sal)-MIN(E.Sal), AVG(E.Sal)+3 
FROM Emp E, Dept D 
WHERE E.did = D.did AND D.floor = 3 AND E.Sal >= 3500

/*REZULTAT: 7000, 5000, 6500, 4253*/

/*--------------------------------------------------------------------------------------*/
/*------------------OKTOBARSKI ISPITNI ROK 16. 09. 2017.--------------------------------*/
/*--------------------------------------------------------------------------------------*/

/*---------------------------I Grupa---------------------------------*/

/*11. Neka je data tabela Region_Prodaja koja sadrži podatke o ostvarenim narudžbenicama i 
prodajama datog proizvoda po regionima i godinama:*/
CREATE TABLE Region_Prodaja(
	Region CHAR(20),
  	Godina INT,
  	Broj_Narudzbenica INT,
  	Ukupna_Prodaja INT
);
INSERT INTO Region_Prodaja
VALUES ('Zapad', 2014, 1560, 325000),
('Zapad', 2015, 1820, 380000),
('Sever', 2014, 790, 148000),
('Sever', 2015, 995, 185000),
('Istok', 2014, 1760, 375000),
('Istok', 2015, 2220, 450000),
('Jug', 2014, 1790, 388000),
('Jug', 2015, 1695, 360000);

SELECT * FROM Region_Prodaja;

/*a) Napisati SQL upit koji izračunava ukupan broj narudžbenica za svaki region (tj. za 
dvogodišnji period prodaje). */
SELECT Region, SUM(Broj_Narudzbenica) AS [Ukupan Broj Narudžbenica Za Svaki Region] FROM Region_Prodaja GROUP BY Region;
/*b) Napisati SQL upit koji prikazuje prosečan godišnji iznos ostvarenih prodaja po 
regionu samo za oblast obuhvaćenu regionima “Sever” i “Jug” za 2015. godinu. */
SELECT Region, AVG(Broj_Narudzbenica) AS [prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu] 
FROM Region_Prodaja WHERE Godina = 2015 AND Region IN('Sever','Jug') GROUP BY Region;

/*ili*/
SELECT Region, AVG(Broj_Narudzbenica) AS [prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu] 
FROM Region_Prodaja WHERE Godina = 2015 AND (Region = 'Sever' OR Region = 'Jug') GROUP BY Region;



/*12. Napisati SQL komandu kojom se svim zaposlenima koji trenutno imaju platu 50 000 RSD 
u datoj kompaniji, plata povećava na 60 000 RSD. Pretpostaviti da je naziv tabele Zaposleni i 
da je naziv odgovarajuće kolone Plata. Nakon ažuriranja uraditi potvrdu upisa vrednosti 
(koristiti komandu za potvrdu vrednosti). */

/*Komanda*/
UPDATE Zaposleni 
SET Plata = 60000
WHERE Plata = 50000;
COMMIT;

/*Tabela za testiranje*/
CREATE TABLE Zaposleni(
    ID INT PRIMARY KEY,
    Ime CHAR(20),
    Plata INT
);

INSERT INTO Zaposleni
VALUES (1, 'Zaposleni1', 50000),
(2, 'Zaposleni2', 50000),
(3, 'Zaposleni3', 60000),
(4, 'Zaposleni4', 70000),
(5, 'Zaposleni5', 80000);

SELECT * FROM Zaposleni;


/*---------------------------II Grupa---------------------------------*/

/*11. Neka je data tabela Region_Prodaja koja sadrži podatke o ostvarenim narudžbenicama i 
prodajama datog proizvoda po regionima i godinama:*/
CREATE TABLE Region_Prodaja(
	Region CHAR(20),
  	Godina INT,
  	Broj_Narudzbenica INT,
  	Ukupna_Prodaja INT
);
INSERT INTO Region_Prodaja
VALUES ('Zapad', 2014, 1560, 325000),
('Zapad', 2015, 1820, 380000),
('Sever', 2014, 790, 148000),
('Sever', 2015, 995, 185000),
('Istok', 2014, 1760, 375000),
('Istok', 2015, 2220, 450000),
('Jug', 2014, 1790, 388000),
('Jug', 2015, 1695, 360000);

SELECT * FROM Region_Prodaja;

/*a) Napisati SQL upit koji izračunava ukupan iznos prodaja za svaki region (tj. za 
dvogodišnji period prodaje).*/
SELECT Region, SUM(Ukupna_Prodaja) AS [Ukupan Iznos Prodaja Za Svaki Region] FROM Region_Prodaja GROUP BY Region;

/*b) Napisati SQL upit koji prikazuje prosečan godišnji iznos ostvarenih prodaja po 
regionu samo za oblast obuhvaćenu regionima “Istok” i “Zapad” za 2015. godinu.*/

SELECT Region, AVG(Ukupna_Prodaja) AS [Prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu] 
FROM Region_Prodaja WHERE Godina = 2015 AND Region IN('Istok','Zapad') GROUP BY Region;

/*ili*/

SELECT Region, AVG(Ukupna_Prodaja) AS [Prosečan Godišnji Iznos Ostvarenih Prodaja Po Regionu]
FROM Region_Prodaja WHERE Godina = 2015 AND (Region = 'Istok' OR Region = 'Zapad') GROUP BY Region;
/*---------------------------------------------------------------------------------------------*/
