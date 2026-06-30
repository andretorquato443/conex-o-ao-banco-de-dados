

CREATE TABLE   Plano
(
plano_id int not null,
nome varchar(30) not null,
preco decimal not null,

primary key (plano_id),

check (preco > 0)
);

CREATE TABLE  Assinante 
(
assinante_id int not null,
nome varchar (30) not null,
email varchar (40) unique not null,
plano_id int not null,

primary key (assinante_id ),

foreign key (plano_id) references Plano 
on delete cascade
on update cascade
);

CREATE TABLE Perfil 
(
perfil_id int not null,
nome varchar(30) not null,
assinante_id int not null,

primary key (perfil_id),

foreign key (assinante_id ) references Assinante
on delete cascade
on update cascade
);

CREATE TABLE Filme 
(
filme_id int not null,
nome varchar(30) not null,
sinopse varchar(1000) not null,
classificacao_indicativa varchar(2) not null,
genero varchar(20) not null,
duracao int not null,

primary key (filme_id),

check (classificacao_indicativa in ('L' , '10' , '12' , '14' , '16' , '18' )),
check (duracao > 0)

);

CREATE TABLE Serie
(
serie_id int not null,
nome varchar(30) not null,
sinopse varchar(1000) not null,
classificacao_indicativa varchar(2) not null,
genero varchar(20) not null,

primary key (serie_id),

check (classificacao_indicativa in ('L' , '10' , '12' , '14' , '16' , '18'))
);


CREATE TABLE Episodio
(
episodio_id int not null,
nome varchar(30) not null,
sinopse varchar(1000) not null,
duracao int not null,
serie_id int not null,

primary key (episodio_id),

foreign key (serie_id) references Serie
on delete cascade
on update cascade,

check (duracao > 0)
);


CREATE TABLE HistoricoFilme 
(
perfil_id int not null,
filme_id int not null,
data_assistida date not null,

primary key (perfil_id ,filme_id,data_assistida),

foreign key (perfil_id ) references Perfil
on delete cascade
on update cascade,

foreign key (filme_id) references Filme
on delete cascade
on update cascade
);

CREATE TABLE HistoricoEpisodio
(
perfil_id int not null,
episodio_id int not null,
data_assistida date not null,

primary key (perfil_id, episodio_id, data_assistida),

foreign key (perfil_id) references Perfil
on delete cascade
on update cascade,

foreign key (episodio_id) references Episodio
on delete cascade
on update cascade
);

CREATE TABLE AvaliacaoFilme
(
perfil_id int not null,
filme_id int not null,
nota int not null,

primary key (perfil_id, filme_id),

foreign key (perfil_id) references Perfil
on delete cascade
on update cascade,

foreign key (filme_id) references Filme
on delete cascade
on update cascade,

check (nota between 0 and 10)
);

CREATE TABLE AvaliacaoSerie
(
perfil_id int not null,
serie_id int not null,
nota int not null,

primary key (perfil_id, serie_id),

foreign key (perfil_id) references Perfil
on delete cascade
on update cascade,

foreign key (serie_id) references Serie
on delete cascade
on update cascade,

check (nota between 0 and 10)
);

