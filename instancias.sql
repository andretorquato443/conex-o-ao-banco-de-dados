insert into Plano values 
(1,'Premium',69.90),
(2,'Familia',59.90),
(3,'Individual',49.90);

insert into Assinante values 
(1,'Sergio','sergft@gmail.com',2),
(2,'Adriana','adrianatp@yahoo.com.br',3),
(3,'Andre','cidrenator@gmail.com',1),
(4,'José','joseufrgs@gmail.com',3),
(5,'Fernando','ferneuer@gmail.com',2),
(6,'Marlene','marlene@gmail.com',2);

insert into perfil values 
(1,'João',2),
(2,'Pedro',4),
(3,'Maria',1),
(4,'Guilherme',1),
(5,'Fe',1),
(6,'Ana',3),
(7,'Lu',3),
(8,'Sofis',3),
(9,'Cassio',5),
(10,'Joana',5),
(11,'Calebe',5),
(12,'Luis',6),
(13,'Dani',6),
(14,'Rafa',6),
(15,'Joca',6),
(16,'Tulio',6),
(17,'Gael',6);

insert into Filme values
(1,'O Chamado','Terror sobrenatural','16','Terror',115),
(2,'Titanic','Romance em navio','12','Romance',194),
(3,'Matrix','Realidade simulada','14','Acao',136),
(4,'Casablanca','Drama romantico','L','Drama',102),
(5,'Indiana Jones','Aventura arqueologica','12','Aventura',118),
(6,'Star Wars','Guerra espacial','10','Ficcao',121),
(7,'Harry Potter','Bruxos em Hogwarts','L','Ficcao',152),
(8,'Duna','Conflito interplanetario','14','Ficcao',155),
(9,'Jogos Mortais','Jogos macabros','18','Terror',103),
(10,'O Albergue','Tortura e sobrevivencia','18','Terror',94),
(11,'Deadpool','Anti-heroi caótico','18','Acao',108),
(12,'Corra!','Suspense psicologico','16','Suspense',104),
(13,'Toy Story','Brinquedos ganham vida','L','Animacao',81),
(14,'Se Beber Nao Case','Comedia adulta','16','Comedia',100),
(15,'Vingadores','Herois unidos','12','Acao',143);

INSERT INTO Serie VALUES
(1,'The Witcher','Cacador de monstros','18','Fantasia'),
(2,'Friends','Grupo de amigos','12','Comedia'),
(3,'Breaking Bad','Professor vira traficante','18','Drama'),
(4,'Dark','Misterio temporal','16','Suspense'),
(5,'Stranger Things','Fenomenos sobrenaturais','14','Ficcao');

INSERT INTO Episodio VALUES
(1,'The Ends Beginning','Inicio da jornada',60,1),
(2,'Four Marks','Destino dos personagens',58,1),

(3,'The Pilot','Primeiro episodio',22,2),
(4,'The Sonogram','Ross descobre a gravidez',22,2),

(5,'Pilot','Walter inicia sua jornada',58,3),
(6,'Cats in the Bag','Consequencias do piloto',48,3),

(7,'Secrets','Primeiras revelacoes',55,4),
(8,'Past and Present','Viagens temporais',56,4),

(9,'Chapter One','Desaparecimento misterioso',50,5),
(10,'Chapter Two','Novos acontecimentos',48,5);

INSERT INTO HistoricoFilme VALUES
(1,9,'2026-01-10'),
(1,10,'2026-01-15'),
(1,11,'2026-01-20'),
(1,3,'2026-02-01'),
(1,2,'2026-02-10'),
(1,1,'2026-02-15'),

(2,1,'2026-03-01'),
(2,3,'2026-03-02'),

(3,2,'2026-10-10'),
(3,4,'2026-10-15'),
(3,13,'2026-10-20'),

(4,15,'2026-04-01'),
(4,12,'2026-04-10'),

(5,6,'2026-05-01'),
(5,7,'2026-05-03'),

(6,14,'2026-10-05'),
(6,13,'2026-10-06'),

(7,8,'2026-07-01'),
(7,15,'2026-07-05'),

(8,9,'2026-08-01'),
(8,12,'2026-08-05'),

(9,3,'2026-06-01'),
(9,15,'2026-06-02'),

(10,2,'2026-10-01'),
(10,4,'2026-10-02'),

(11,11,'2026-09-01'),
(11,15,'2026-09-05'),

(12,13,'2026-11-01'),
(13,7,'2026-11-05'),
(14,5,'2026-11-10');

INSERT INTO HistoricoEpisodio VALUES
(1,1,'2026-01-01'),
(1,1,'2026-01-10'),
(1,2,'2026-01-15'),

(2,1,'2026-02-01'),

(3,3,'2026-03-01'),
(3,4,'2026-03-02'),

(4,5,'2026-04-01'),
(4,6,'2026-04-02'),

(5,7,'2026-05-01'),
(5,8,'2026-05-02'),

(6,9,'2026-06-01'),
(6,10,'2026-06-02');


INSERT INTO AvaliacaoFilme VALUES
(1,3,10),
(3,3,9),
(4,3,9),

(1,15,8),
(4,15,9),
(9,15,8),

(3,2,7),
(10,2,8),

(6,14,9),
(11,14,8),

(1,9,7),
(8,9,6),

(1,10,5),
(2,10,6),

(12,13,10),
(6,13,9);

INSERT INTO AvaliacaoSerie VALUES
(1,1,10),
(2,1,9),
(3,1,10),

(3,2,8),
(4,2,9),

(4,3,10),
(5,3,9),
(6,3,10),

(7,4,7),
(8,4,8),

(9,5,9),
(10,5,8);