
CREATE TABLE IF NOT EXISTS "pole" (
	"id"	TEXT,
	"pole"	TEXT,
	PRIMARY KEY("id")
);

INSERT INTO "pole" VALUES ('PART','Partenariat');
INSERT INTO "pole" VALUES ('CV','Culture Voyage');
INSERT INTO "pole" VALUES ('FS','Festif et Sportif');
INSERT INTO "pole" VALUES ('COM','Communication');

CREATE TABLE "Lieu" (
	"id"	INTEGER,
	"lieu"	text,
	"latitude"	INTEGER,
	"longitude"	INTEGER,
	PRIMARY KEY("id")
);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (1,'1er',48.86301,2.33548);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (2,'2ème',48.8682,2.33548);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (3,'3ème',48.86256,2.3602);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (4,'4ème',48.8542,2.35711);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (5,'5ème',48.84426,2.35025);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (6,'6ème',48.84946,2.33342);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (7,'7ème',48.85917,2.27506);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (8,'8ème',48.87159,2.31111);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (9,'9ème',48.87769,2.33754);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (10,'10ème',48.87543,2.3602);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (11,'11ème',48.8594,2.37737);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (12,'12ème',48.83929,2.39145);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (13,'13ème',48.82867,2.35952);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (14,'14ème',48.83025,2.32519);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (15,'15ème',48.84064,2.29497);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (16,'16ème',48.85917,2.27506);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (17,'17ème',48.88694,2.30459);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (18,'18ème',48.89214,2.34681);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (19,'19ème',48.88582,2.38149);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (20,'20ème',48.86233,2.39969);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (21,'Banlieue Nord',48.9345,2.35688);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (22,'Banlieue Nord-Est',48.91016,2.43904);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (23,'Banlieue Est',48.8651,2.44659);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (24,'Banlieue Sud-Est',48.808,2.43375);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (25,'Banlieue Sud',48.79601,2.34449);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (26,'Banlieue Sud-Ouest',48.81779,2.24948);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (27,'Banlieue Ouest',48.87111,2.20073);
INSERT INTO Lieu(id,lieu,latitude,longitude) VALUES (28,'Banlieue Nord-Ouest',48.91329,2.26315);


CREATE TABLE IF NOT EXISTS "adj" (
	"id"	INTEGER,
	"adjectif"	text,
	PRIMARY KEY("id")
);

INSERT INTO "adj" VALUES (1,'Timide');
INSERT INTO "adj" VALUES (2,'Calme');
INSERT INTO "adj" VALUES (3,'Sociable');
INSERT INTO "adj" VALUES (4,'Fêtard');

CREATE TABLE IF NOT EXISTS "pref" (
	"id"	INT,
	"preference"	TEXT,
	PRIMARY KEY("id")
);

INSERT INTO "pref" VALUES (1,'Faire une visite culturelle');
INSERT INTO "pref" VALUES (2,'Chill dans un parc');
INSERT INTO "pref" VALUES (3,'Prendre un verre');
INSERT INTO "pref" VALUES (4,'Faire la fête jusqu''au bout de la nuit');

CREATE TABLE IF NOT EXISTS "esn_mission" (
	"id"	int,
	"mission"	text,
	PRIMARY KEY("id")
);

INSERT INTO "esn_mission" VALUES (1,'Accueillir et intégrer les étudiants internationaux');
INSERT INTO "esn_mission" VALUES (2,'sensibiliser à la mobilité internationale');

CREATE TABLE IF NOT EXISTS "parrain" (
	"id"	INTEGER,
	"Nom"	text,
	"Prenom"	text,
	"Pole"	TEXT,
	"Nb_filleul"	integer,
	"Lieu"	INTEGER,
	"Adjectif"	INTEGER,
	"Preference"	INTEGER,
	"Mission"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "filleul" (
	"id"	INTEGER,
	"Nom"	text,
	"Prenom"	text,
	"Pole"	text,
	"Lieu"	INTEGER,
	"Adjectif"	INTEGER,
	"Preference"	INTEGER,
	"Mission"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);

