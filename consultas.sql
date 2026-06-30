--1 Nome dos perfis que pertencem ao plano familia

select p.nome
from Perfil p join Assinante a on p.assinante_id=a.assinante_id 
join Plano pl on a.plano_id = pl.plano_id 
where pl.nome='Familia';


--2 Filmes cuja media de avaliação individual é superior a média de avaliação de todos os filmes:

select f.nome
from Filme f
join AvaliacaoFilme a on f.filme_id = a.filme_id
GROUP BY f.filme_id,f.nome  --medida de precaução pois pode haver dois nomes de filmes iguais
HAVING AVG(a.nota) >
(
    select avg(nota)
    from AvaliacaoFilme
);

--3 Perfis que assistiram ao mesmo episodio mais de uma vez da serie The Witcher:

select p.nome
from Perfil p
join HistoricoEpisodio h on p.perfil_id = h.perfil_id join Episodio e 
on h.episodio_id = e.episodio_id 
join Serie s on e.serie_id = s.serie_id
where s.nome = 'The Witcher'
group by p.nome,p.perfil_id, e.episodio_id
HAVING COUNT(*) > 1;

--4 Nome dos filmes assistidos por Maria cuja média da nota é superior a 8:

select f.nome
from Filme f
join HistoricoFilme h on f.filme_id = h.filme_id 
join Perfil p on h.perfil_id = p.perfil_id
where p.nome = 'Maria' 
and 8 < (
           select avg(a.nota) 
           from AvaliacaoFilme a 
           where a.filme_id = f.filme_id
        );

--5 Perfis que não avaliaram nenhuma serie de comedia:

select p.nome
from Perfil p
where not exists
(
    select *
    from AvaliacaoSerie a
    join Serie s
        on a.serie_id = s.serie_id
    where a.perfil_id = p.perfil_id
      and s.genero = 'Comedia'
);

--criação da view,cuja função sera fazer uma tabela 'juntada' entre Histórico , filme e o perfil (evita juntar varias vezes) :

create view FilmesAssistidos as

select p.perfil_id, p.nome as perfil, f.filme_id, f.nome as filme, f.genero as genero, h.data_assistida,p.assinante_id
from Perfil p join HistoricoFilme h on p.perfil_id = h.perfil_id
join Filme f on h.filme_id = f.filme_id;

--6 Quantidade de visualizações de filmes por gênero e plano (uso da view):
select genero ,p.nome,count(*) as quantidade_visualizacoes
from FilmesAssistidos fa join Assinante a on fa.assinante_id=a.assinante_id
join Plano p on p.plano_id=a.plano_id
group by genero,p.nome;

--7 Quantidade de filmes assistidos por perfil e plano (uso da view):

select fa.perfil_id, fa.perfil ,p.nome,count(*) as quantidade_visualizacoes
from FilmesAssistidos fa join Assinante a on fa.assinante_id=a.assinante_id
join Plano p on p.plano_id=a.plano_id
group by fa.perfil_id,fa.perfil,p.nome;

--8 Quantidade de episódios assistidos por serie :

SELECT s.nome,COUNT(*) AS quantidade_visualizacoes
FROM Serie s
JOIN Episodio e
ON s.serie_id = e.serie_id
JOIN HistoricoEpisodio h
ON e.episodio_id = h.episodio_id
GROUP BY s.serie_id, s.nome;

--9 Perfis e os nomes de seus assinantes que NUNCA assistiram a nenhum filme:

select p.perfil_id, p.nome as nome_perfil, a.nome as nome_assinante
from Perfil p join Assinante a on p.assinante_id = a.assinante_id

except

select h.perfil_id, p.nome, a.nome
from HistoricoFilme h
join Perfil p on h.perfil_id = p.perfil_id join Assinante a on p.assinante_id = a.assinante_id;

--10 Duração média dos episódios assistidos por cada perfil:
SELECT p.perfil_id, p.nome as nome_perfil, AVG(e.duracao) AS duracao_media
FROM Perfil p
JOIN HistoricoEpisodio h ON p.perfil_id = h.perfil_id
JOIN Episodio e ON h.episodio_id = e.episodio_id
GROUP BY p.perfil_id, p.nome;
