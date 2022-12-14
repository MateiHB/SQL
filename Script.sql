BEGIN TRANSACTION;

CREATE TABLE Acteur(
	Matricule bigint PRIMARY KEY,
	NAS INTEGER NOT NULL unique,
	CHECK (Matricule BETWEEN 10000000 AND 99999999),
	CHECK (NAS BETWEEN 100000000 AND 999999999)
);


CREATE TABLE Contact(
	NAS INTEGER PRIMARY KEY,
	NumeroPrincipal bigint,
	NumeroSec bigint,
	EmailScolaire varchar(45),
	EmailPerso varchar(45),
	FOREIGN KEY (NAS) REFERENCES Acteur(NAS),
	CHECK (NumeroPrincipal BETWEEN 1000000000 AND 9999999999),
	CHECK (NumeroSec BETWEEN 1000000000 AND 9999999999)
);


CREATE TABLE Adresse(
	NAS INTEGER,
	Num varchar(45),
	Rue varchar(45),
	Ville varchar(45),
	FOREIGN KEY (NAS) REFERENCES Acteur(NAS),
	PRIMARY KEY (NAS, Num, Rue, Ville)
);


CREATE TABLE Identitee(
	NAS INTEGER PRIMARY KEY,
	Prenom varchar(45) NOT NULL,
	Nom varchar(45) NOT NULL,
	Sexe varchar(20) NOT NULL,
	FOREIGN KEY (NAS) REFERENCES Acteur(NAS),
	check(Sexe in ('Femme', 'Homme'))
);


CREATE TABLE Etudiant(
	Matricule INTEGER PRIMARY KEY,
	Dep varchar(45),
	FOREIGN KEY (Matricule) REFERENCES Acteur(Matricule)
);


CREATE TABLE Professeur(
	Matricule INTEGER PRIMARY KEY,
	Salaire NUMERIC(10,2),
	FOREIGN KEY (Matricule) REFERENCES Acteur(Matricule)
);


CREATE TABLE Compagnie(
	NoComp INTEGER PRIMARY KEY,
	NomC varchar(45) NOT NULL,
	Domaine varchar(45),
	Description TEXT
);


CREATE TABLE ContactC(
	NoComp INTEGER,
	NomResponsable varchar(45),
	Poste varchar(45),
	EmailPrincipal varchar(45),
	EmailSec varchar(45),
	NumeroPrincipalC bigint,
	NumeroSec bigint,
	FOREIGN KEY (NoComp) REFERENCES Compagnie(NoComp),
	PRIMARY KEY (NoComp, NomResponsable, Poste),
	CHECK (NumeroPrincipalC BETWEEN 999999999 AND 10000000000),
	CHECK (NumeroSecC BETWEEN 999999999 AND 10000000000)
);


CREATE TABLE Stage(
	NoStage INTEGER PRIMARY KEY,
	MatriculeE INTEGER,
	MatriculeP INTEGER,
	NoComp INTEGER,
	Rapport TEXT,
	DateDebut DATE,
	DateFin DATE,
	FOREIGN KEY (MatriculeE) REFERENCES Etudiant(Matricule),
	FOREIGN KEY (MatriculeP) REFERENCES Professeur(Matricule),
	FOREIGN KEY (NoComp) REFERENCES Compagnie(NoComp),
	CHECK(DateDebut < DateFin)
);

COMMIT;


INSERT INTO ACTEUR VALUES
	(20161780, 292777333),
    (20187300, 292977862),
    (20182598, 292476135),
    (20113547, 292798123),
    (20173359, 292677528),
    (20171332, 292278635),
    (20160544, 292123798),
    (20198465, 292772782),
    (20113268, 292785247),
    (20197801, 292357135),
	(20851351, 292789132),
    (20324865, 292132815),
    (20354787, 292647810),
    (20741856, 292489131),
    (20746513, 292897375),
    (20204481, 292645831),
    (20891354, 292657122),
    (20781235, 292978331),
    (20795612, 292461317),
    (20498561, 292489740);


INSERT INTO Contact VALUES 
	(292777333, 4389874123, 5145403183, 'matei.hulubas@udem.com', 'matei.hulubas@gmail.com'),
    (292977862, 5145554832, 4384684508, 'dan.munteanu@udem.com', 'dan.munteanu@gmail.com'),
    (292476135, 5149874315, 5148705406, 'sterling.archer@udem.com', 'sterling.archer@gmail.com'),
    (292798123, 4381687431, 5147864208, 'julia.bilan@udem.com', 'julia.bilan@gmail.com'),
    (292677528, 5147891301, 4388780078, 'francine.smith@udem.com', 'francine.smith@gmail.com'),
    (292278635, 5147465205, 5149840075, 'yennefer.vengerberg@udem.com', 'yennefer.vengerberg@gmail.com'),
    (292123798, 4387964513, 5140857766, 'andrei.lucas@udem.com', 'andrei.lucas@gmail.com'),
    (292772782, 4381987138, 4384098370, 'mireille.stjean@udem.com', 'mireille.stjean@gmail.com'),
    (292785247, 4386498413, 4389848947, 'bashar.rocma@udem.com', 'bashar.rocma@gmail.com'),
    (292357135, 5141696843, 4380207375, 'lana.kane@udem.com', 'lana.kane@gmail.com'),
    (292789132, 4384665410, 5140789415, 'klaus.schwab@udem.com', 'klaus.schwab@gmail.com'),
    (292132815, 5148754607, 4387880688, 'frank.sinatra@udem.com', 'frank.sinatra@gmail.com'),
    (292647810, 5141506574, 5147984057, 'rick.sanchez@udem.com', 'rick.sanchez@gmail.com'),
    (292489131, 4380206470, 5147068750, 'francis.kurkdjian@udem.com', 'francis.kurkdjian@gmail.com'),
    (292897375, 5140348703, 4387577807, 'gabrielle.chanel@udem.com', 'gabrielle.chanel@gmail.com'),
    (292645831, 5141638701, 5148978407, 'elon.musk@udem.com', 'elon.musk@gmail.com'),
    (292657122, 4383540651, 5141423657, 'zark.muckerberg@udem.com', 'zark.muckerberg@gmail.com'),
    (292978331, 5147890310, 4381495120, 'joe.brandon@udem.com', 'joe.brandon@gmail.com'),
    (292461317, 5147845603, 5147098402, 'justine.troudeau@udem.com', 'justine.troudeau@gmail.com'),
    (292489740, 4384687601, 5148659705, 'michel.boyer@udem.com', 'michel.boyer@gmail.com');


INSERT INTO Adresse VALUES 
	(292777333, '3', 'rue Principale', 'Montreal'),
	(292777333, '777', 'rue du Paradis', 'Montreal'),
    (292977862, '4682', 'rue Prince', 'Montreal'),
    (292476135, '123', 'rue Charon', 'Laval'),
    (292798123, '12', 'boul du Souvenir', 'Montreal'),
    (292677528, '401', 'ave Roslyn', 'Westmount'),
    (292278635, '345', 'ave des Pins', 'Montreal'),
    (292123798, '45', 'boul Monkland', 'Montreal'),
    (292772782, '679', 'rue Crois??e', 'Chateauguay'),
    (292785247, '1', 'rue Coccinelle', 'Laval'),
    (292357135, '7123', 'boul Boyer', 'Montreal'),
    (292789132, '5240', 'rue Queen Mary', 'Montreal'),
    (292132815, '505', 'boul Ren??-L??vesque', 'Montreal'),
    (292647810, '6666', 'rue Saint-Urbain', 'Montreal'),
    (292489131, '1832', 'rue Sherbrooke', 'Montreal'),
    (292897375, '1307', 'rue Sainte-Catherine', 'Montreal'),
    (292645831, '5350', 'rue Ferrier', 'Montreal'),
    (292657122, '8901', 'rue Marcel-Cadieux', 'Montreal'),
    (292978331, '8790', 'ave Park', 'Montreal'),
    (292461317, '321', 'Chem. de Aeroport', 'La Macaza'),
    (292489740, '5291', 'rue Amos', 'Montreal-Nord');


INSERT INTO IDENTITEE VALUES 
	(292777333, 'Matei', 'Hulubas', 'Homme'),
    (292977862, 'Dan', 'Munteanu', 'Homme'),
    (292476135, 'Sterling', 'Archer', 'Homme'),
    (292798123, 'Julia', 'Bilan', 'Femme'),
    (292677528, 'Francine', 'Smith', 'Femme'),
    (292278635, 'Yennefer', 'Vengerberg', 'Femme'),
    (292123798, 'Andrei', 'Lucas', 'Homme'),
    (292772782, 'Mireille', 'St-Jean', 'Femme'),
    (292785247, 'Bashar', 'Rocma', 'Homme'),
    (292357135, 'Lana', 'Kane', 'Femme'),
    (292789132, 'Klaus', 'Schwab', 'Homme'),
    (292132815, 'Frank', 'Sinatra', 'Homme'),
    (292647810, 'Rick', 'Sanchez', 'Homme'),
    (292489131, 'Francis', 'Kurkdjian', 'Homme'),
    (292897375, 'Gabrielle', 'Chanel', 'Femme'),
    (292645831, 'Elon', 'Musk', 'Homme'),
    (292657122, 'Zark', 'Muckerberg', 'Homme'),
    (292978331, 'Joe', 'Brandon', 'Homme'),
    (292461317, 'Justine', 'Troudeau', 'Femme'),
    (292489740, 'Michel', 'Boyer', 'Homme');


INSERT INTO Etudiant VALUES
	(20161780, 'Informatique'),
    (20187300, 'Informatique'),
    (20182598, 'Espionnage'),
    (20113547, 'Business'),
    (20173359, 'Cuisine'),
    (20171332, 'Magie'),
    (20160544, 'Business'),
    (20198465, 'Soins infirmiers'),
    (20113268, 'Informatique'),
    (20197801, 'Espionnage');


INSERT INTO Professeur VALUES
	(20851351, 100000.25),
    (20324865, 100001.25),
    (20354787, 100002.25),
    (20741856, 100003.25),
    (20746513, 100004.25),
    (20204481, 100005.25),
    (20891354, 100006.25),
    (20781235, 100007.25),
    (20795612, 100008.25),
    (20498561, 100009.25);


INSERT INTO Compagnie VALUES
	(12345, 'Tesla', 'Technology', 'Tesla, Inc is an American automotive and clean energy company based in Austin, Texas.'),
	(16540, 'Facebook', 'Technology', 'Facebook is an American online social media and social networking service.'),
	(84703, 'GRC', 'Technology', 'Gendarmerie Royal du Canada'),
	(97802, 'Rivian', 'Technology', 'Rivian Automotive, Inc. is an American electric vehicle automaker and automotive technology company.'),
	(76801, 'Mila', 'Technology', 'Quebec AI Institute is a research institute in Montreal.'),
	(16348, 'Amazon', 'Technology', 'Amazon.com, Inc. is an American multinational technology company which focuses on e-commerce.'),
	(68730, 'Google', 'Technology', 'Google LLC is an American multinational technology company that focuses on artificial intelligence, search engine, online advertising, etc.'),
	(45689, 'Microsoft', 'Technology', 'Microsoft Corporation is an American multinational technology corporation which produces computer software, consumer electronics, personal computers, etc.'),
	(34654, 'CoinBase', 'Finance', 'Coinbase Global, Inc., branded Coinbase, is an American company that operates a cryptocurrency exchange platform.'),
	(71859, 'Apple', 'Technology', 'Apple Inc. is an American multinational technology company that specializes in consumer electronics, software and online services.');


INSERT INTO ContactC VALUES 
	(12345, 'Geralt of Rivia', 'Senior Developer', 'geralt.rivia@udem.com', 'geralt.rivia@gmail.com', 5141357956, 4384563874),
	(16540, 'Traci Simon', 'Senior Developer', 'traci.simon@udem.com', 'traci.simon@gmail.com', 5148902348, 4384774012),
	(84703, 'Luther William', 'Senior Developer', 'luther.william@udem.com', 'luther.william@gmail.com', 5145550215, 4389850314),
	(97802, 'Gracie-May Brandt', 'Senior Developer', 'gracie.brandt@udem.com', 'gracie.brandt@gmail.com', 5147890120, 4384569898),
	(76801, 'Jimi Rosales', 'Senior Developer', 'jimi.rosales@udem.com', 'jimi.rosales@gmail.com', 5147845236, 4384556898),
	(16348, 'Ramone Holding', 'Senior Developer', 'ramone.holding@udem.com', 'ramone.holding@gmail.com', 5142334830, 4385669701),
	(68730, 'Whitney Bright', 'Senior Developer', 'whitney.bright@udem.com', 'whitney.bright@gmail.com', 5144389896, 4387890543),
	(45689, 'Hywel Arnold', 'Senior Developer', 'hywel.arnold@udem.com', 'hywel.arnold@gmail.com', 5147841368, 4389870307),
	(34654, 'Chantelle Bowes', 'Senior Developer', 'chantelle.bowes@udem.com', 'chantelle.bowes@gmail.com', 5149850347, 4389871503),
	(71859, 'Maddox Macleod', 'Senior Developer', 'maddox.macleod@udem.com', 'maddox.macleod@gmail.com', 5149889327, 4389001235);


INSERT INTO Stage VALUES
	(10000, 20161780, 20204481, 12345, 'Excellent!', '2022-03-15', '2022-07-15'),
	(10001, 20187300, 20891354, 16540, 'Excellent!', '2021-12-02', '2022-04-02'),
	(10002, 20182598, 20354787, 84703, 'A ameliorer', '2022-05-17', '2022-09-17'),
	(10003, 20113547, 20741856, 97802, 'Bien', '2022-01-25', '2022-05-25'),
	(10004, 20173359, 20746513, 76801, 'Tres bien', '2022-08-09', '2022-12-09'),
	(10005, 20171332, 20851351, 16348, 'Bien', '2021-03-30', '2021-07-30'),
	(10006, 20160544, 20324865, 68730, 'Bien', '2021-06-04', '2021-10-04'),
	(10007, 20198465, 20781235, 45689, 'A ameliorer', '2020-11-19', '2021-03-19'),
	(10008, 20113268, 20795612, 34654, 'Bien', '2020-04-23', '2020-08-23'),
	(10009, 20197801, 20498561, 71859, 'Bien', '2020-05-26', '2020-09-26');
	
	

COMMIT;