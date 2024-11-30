BEGIN;

INSERT INTO "cliente" (
  "email", "telefone", "cpf", "nome", "sobrenome", "rua", "n_end", "complemento", "cep", "senha"
) VALUES
('marcia-dacunha70@nipnet.com.br', 96995797321, '46753425748', 'Márcia Isabella', 'Teresinha da Cunha', 'Travessa Segunda de Moraes', 567, NULL, '68904031', 'argon2$argon2id$v=19$m=102400,t=2,p=8$MzBseE9ya0l0a2g1Z2U2YUVmSzlGNg$E5gtpG74xqpGJEmPcOqb0n7YjQ4x2aSl+e9cN7uYpeU'),
('jennifer.emily.almada@sha.com.br', 73982230951, '44710673624', 'Jennifer Emily', 'Almada', 'Rua Santa Rita', 568, NULL, '45606755', 'argon2$argon2id$v=19$m=102400,t=2,p=8$R2Z4elgzZktXcmNEMjkyT2k5WGpZUA$Yf04UZD0Jo8AfOTZoIpDY36k+BDJb9vJ8I8cx//+NCE'),
('antonellaagathapires@arcante.com.br', 84996818168, '59084781210', 'Antonella Agatha', 'Pires', 'Rua Presidente João Goulart', 799, NULL, '59142310', 'argon2$argon2id$v=19$m=102400,t=2,p=8$eHJYM1BkV3pYVFBQVGVTYXA5ZWVqeg$UIpJAoJZbwQhgADYkO+WkaTg5F3Zc3k3kOx4l0gJIAQ'),
('luciaamandamelo@c-a-m.com', 95996924325, '93727862840', 'Lúcia Amanda Raquel', 'Melo', 'Rua Lírio do Campo', 889, NULL, '69314164', 'argon2$argon2id$v=19$m=102400,t=2,p=8$NG84bG9YZkN5S0gzNkFBYXlvR3dHbA$5aFBIs/q10032zD7mK0G1fDFltr8jJs/xzH8aBHc5AE'),
('iagobentoferreira@gringa360.com.br', 84994163932, '02072103738', 'Iago Bento', 'Ferreira', 'Rua Ozéas Pereira dos Santos', 697, NULL, '59146280', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('eduardaemillyalves@sociedadeweb.com.br', 63988552690, '26893912528', 'Eduarda Emilly', 'Alves', 'Quadra 206 Sul Alameda 15', 547, NULL, '77020518', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('laura_rezende@microdoc.com.br', 45989082798, '18558287740', 'Laura Pietra Carolina', 'Rezende', 'Avenida Gramado', 524, NULL, '85862240', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('fernanda_assuncao@yahoo.com.ar', 91985957835, '60197630219', 'Fernanda Luciana', 'Assunção', 'Rua Sexta', 456, NULL, '66623210', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('alexandre_oliveira@jerasistemas.com.br', 47994720160, '94712157577', 'Alexandre Danilo', 'Oliveira', 'Rua Vidal Ramos', 729, NULL, '89207670', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('henry_victor_jesus@comprehense.com.br', 73994751819, '82221615808', 'Henry Victor', 'Jesus', 'Rua Aclamação', 805, NULL, '45992306', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('stellafabianamoreira@supercleanlav.com.br', 68986038417, '15915481795', 'Stella Fabiana', 'Moreira', 'Travessa Capixaba', 827, NULL, '69906344', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('giovana_luana_dacruz@yoma.com.br', 85994884407, '99481292533', 'Giovana Luana', 'Giovana da Cruz', 'Rua Maria Ivone', 805, NULL, '60834472', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('valentina_teixeira@bwmtrade.com', 65992796069, '84605136703', 'Valentina Regina', 'Teixeira', 'Rua Paulo Sérgio', 696, NULL, '78128384', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('bento-cortereal76@mrarquitetura.com.br', 21989537691, '83908729190', 'Bento Iago', 'Corte Real', 'Rua Marechal Serejo', 967, NULL, '22743380', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('sonia.olivia.ribeiro@inbox.com', 62992006719, '49728623607', 'Sônia Olivia', 'Ribeiro', 'Rodovia BR-153', 188, NULL, '74993600', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('diogobenjamincardoso@bigfoot.com', 31995745408, '58072366459', 'Diogo Benjamin', 'Manoel Cardoso', 'Rua Adriana', 468, NULL, '30865160', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('luzia_carvalho@freitasprior.com.br', 62996232377, '67497392700', 'Luzia Carla', 'Carvalho', 'Rua Cavalcante', 281, NULL, '75064200', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('thomas.fabio.lopes@sgstelecom.com.br', 83992026211, '36246333095', 'Thomas Fábio Elias', 'Lopes', 'Rua Rufino Gomes de Araújo', 920, NULL, '58090462', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('paulo-dasneves90@predialnet.com.br', 11998536677, '70835652289', 'Paulo Carlos Leonardo', 'das Neves', 'Rua Luiz Rosa da Costa', 404, NULL, '08753342', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('raquelpatriciacosta@hersa.com.br', 11984704262, '22832143601', 'Raquel Patrícia Elaine', 'Costa', 'Rua Santa Madalena', 423, NULL, '07996030', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw');

INSERT INTO filme (titulo, ano, diretor, class_ind, idioma, duracao, eh_dub, fim_contrato, descricao, poster_url)
VALUES
('In the Mood for Love', 2000, 'Wong Kar Wai', 12, 'Chinês', '01:39:00', FALSE, '2024-12-31', 'Um homem e uma mulher descobrem que seus parceiros estão tendo um caso e desenvolvem uma amizade complexa.', 'https://image.tmdb.org/t/p/w500/iYypPT4bhqXfq1b6EnmxvRt6b2Y.jpg'),
('Drive My Car', 2021, 'Ryusuke Hamaguchi', 16, 'Japonês', '02:59:00', FALSE, '2024-12-31', 'Um diretor de teatro processa a dor e perda enquanto ensaia uma peça em Hiroshima.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3cOsf5HBjPK2QCz9ebQlGHNnE7y.jpg'),
('Little Women', 2019, 'Greta Gerwig', 10, 'Inglês', '01:39:00', FALSE, '2024-12-31', 'Quatro irmãs buscam suas aspirações em meio às dificuldades da Guerra Civil Americana.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/yn5ihODtZ7ofn8pDYfxCmxh8AXI.jpg'),
('Call Me by Your Name', 2017, 'Luca Guadagnino', 10, 'Inglês', '02:12:00', FALSE, '2024-12-31', 'Um jovem descobre o amor e a paixão durante o verão na Itália.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mZ4gBdfkhP9tvLH1DO4m4HYtiyi.jpg'),
('Past Lives', 2023, 'Celine Song', 12, 'Coreano', '01:45:00', FALSE, '2024-12-31', 'Amigos de infância se reencontram anos depois e refletem sobre o passado e escolhas.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rzO71VFu7CpJMfF5TQNMj0d1lSV.jpg'),
('Paterson', 2023, 'Celine Song', 12, 'Inglês', '01:58:00', FALSE, '2024-12-31', 'A vida de um motorista de ônibus e poeta em uma cidade pacata.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/AuJ1ZlfqwuAr9H5Qr1U9KILylse.jpg'),
('The Outsiders', 1983, 'Francis Ford Coppola', 14, 'Inglês', '01:45:00', FALSE, '2024-12-31', 'Grupos de jovens de classes sociais opostas enfrentam tensões em uma pequena cidade americana.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gqNv2gPzZplpQ62tnh48btOWKz5.jpg'),
('RRR', 2022, 'S. S. Rajamouli', 16, 'Telugu', '03:05:00', FALSE, '2024-12-31', 'Dois revolucionários lutam pela liberdade contra o Império Britânico na Índia.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/u0XUBNQWlOvrh0Gd97ARGpIkL0.jpg'),
('Paper Moon', 1973, 'Peter Bogdanovich', 14, 'Inglês', '01:42:00', FALSE, '2024-12-31', 'Um vigarista e uma menina de 9 anos formam uma dupla improvável nas estradas do Kansas.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3GHG0kTcBWHKdXjj3RdK8GjBCd6.jpg'),
('Godzilla Minus One', 2023, 'Takashi Yamazaki', 16, 'Japonês', '02:04:00', FALSE, '2024-12-31', 'Godzilla ameaça a reconstrução do Japão após a Segunda Guerra Mundial.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg'),
('Parasite', 2019, 'Bong Joon Ho', 16, 'Coreano', '02:12:00', FALSE, '2024-12-31', 'Uma família pobre se infiltra na vida de uma família rica com consequências inesperadas.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg'),
('The Grand Budapest Hotel', 2014, 'Wes Anderson', 14, 'Inglês', '01:39:00', FALSE, '2024-12-31', 'Aventuras excêntricas em um luxuoso hotel europeu durante a guerra.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/eWdyYQreja6JGCzqHWXpWHDrrPo.jpg'),
('Portrait of a Lady on Fire', 2019, 'Céline Sciamma', 14, 'Francês', '02:00:00', FALSE, '2024-12-31', 'Uma pintora e sua modelo se envolvem em um romance proibido na França do século XVIII.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2LquGwEhbg3soxSCs9VNyh5VJd9.jpg'),
('Amélie', 2001, 'Jean-Pierre Jeunet', 12, 'Francês', '02:02:00', FALSE, '2024-12-31', 'Uma jovem tímida decide fazer boas ações e mudar a vida das pessoas ao seu redor.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6pMAiHi9wHCMhh5xNzPpzWIbpH2.jpg'),
('Cinema Paradiso', 1988, 'Giuseppe Tornatore', 12, 'Italiano', '02:35:00', FALSE, '2024-12-31', 'Um cineasta relembra sua infância em um pequeno cinema italiano.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gCI2AeMV4IHSewhJkzsur5MEp6R.jpg'),
('The Handmaiden', 2016, 'Park Chan-wook', 18, 'Coreano', '02:25:00', FALSE, '2024-12-31', 'Uma trama de engano e paixão se desenrola entre uma rica herdeira e sua criada.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/dLlH4aNHdnmf62umnInL8xPlPzw.jpg'),
('City of God', 2002, 'Fernando Meirelles', 18, 'Português', '02:10:00', FALSE, '2024-12-31', 'História de jovens em uma favela violenta do Rio de Janeiro nos anos 70.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4K0t47rrpRdhQGp4LnjD8WtqMq3.jpg'),
('Spirited Away', 2001, 'Hayao Miyazaki', 10, 'Japonês', '02:05:00', FALSE, '2024-12-31', 'Uma menina fica presa em um mundo mágico e precisa encontrar uma maneira de salvar seus pais.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg'),
('The Farewell', 2019, 'Lulu Wang', 10, 'Inglês', '01:40:00', FALSE, '2024-12-31', 'Uma jovem lida com a doença da avó em um plano familiar de mantê-la sem saber.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7ht2IMGynDSVQGvAXhAb83DLET8.jpg'),
('Memories of Murder', 2003, 'Bong Joon Ho', 16, 'Coreano', '02:11:00', FALSE, '2024-12-31', 'Investigadores tentam resolver uma série de assassinatos em uma pequena cidade sul-coreana.', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jcgUjx1QcupGzjntTVlnQ15lHqy.jpg');

INSERT INTO genero (nome)
VALUES
('Ação'),
('Romance'),
('Terror'),
('Horror'),
('Drama'),
('Aventura'),
('Documentário'),
('Ficção Científica'),
('Faroeste'),
('Musical'),
('Suspense'),
('Histórico'),
('Comédia'),
('Crime');

INSERT INTO genero_filme (genero_id, filme_id)
VALUES
(5,1),
(2,1),
(5,2),
(2,3),
(12,3),
(5,3),
(2,4),
(5,4),
(5,5),
(2,5),
(2,6),
(5,6),
(13,6),
(5,7),
(14,7),
(1,8),
(5,8),
(5,9),
(14,9),
(13,9),
(4,10),
(8,10),
(1,10),
(5, 11),
(13, 11),
(11, 11),
(5, 12),
(13, 12),
(12, 12),
(2, 13),
(5, 13),
(11, 13),
(2, 14),
(12, 14),
(13, 14),
(5, 15),
(12, 15),
(13, 15),
(11, 16),
(5, 16),
(2, 16),
(1, 17),
(5, 17),
(13, 17),
(5, 18),
(6, 18),
(8, 18),
(5, 19),
(13, 19),
(2, 19),
(5, 20),
(13, 20),
(11, 20);

INSERT INTO cinema (nome, cnpj, telefone, rua, n_end, complemento, cep)
VALUES
('Shopping Iguatemi', '50568161000154', 948568475, 'Rua Cecap-18', 861, NULL, 13184223),
('Shopping Itaquera', '55315900000110', 1929810967, 'Rua José de Lucca', 258, NULL, 03735050),
('Shopping Tatuapé', '23411414000109', 1128406260, 'Rua Jaupaci', 641, NULL, 02318150),
('Shopping Aricanduva', '27423870000120', 1439254906, 'Rua das Violetas', 747, NULL, 18709070),
('Shopping Campo Limpo', '69938764000129', 1639573744, 'Rua Adelmo Silva', 674, NULL, 14070490),

INSERT INTO "pontos" ("data", "hora", "qtde", "cliente_id") VALUES
('2024-01-15', '10:23:45', 225, '46753425748'),
('2024-02-20', '14:35:22', 500, '44710673624'),
('2024-03-18', '09:12:11', 500, '59084781210'),
('2024-04-25', '16:45:33', 225, '93727862840'),
('2024-05-10', '11:20:50', 725, '02072103738'),
('2024-06-30', '08:55:44', 1000, '26893912528'),
('2024-07-14', '12:30:15', 500, '18558287740'),

INSERT INTO "sala" (
  "profundidade", "largura", "suporta_imax", "suporta_3d", "qtde_poltronas", "numero", "cinema_id"
) VALUES
-- Shopping Iguatemi
(15, 18, FALSE, TRUE, 200, 4, '50568161000154'),
(18, 20, TRUE, TRUE, 250, 5, '50568161000154'),
(14, 17, FALSE, FALSE, 180, 6, '50568161000154'),

-- Shopping Itaquera
(16, 19, FALSE, TRUE, 220, 7, '55315900000110'),
(18, 20, TRUE, TRUE, 270, 8, '55315900000110'),
(14, 16, FALSE, FALSE, 170, 9, '55315900000110'),

-- Shopping Tatuapé
(14, 18, FALSE, TRUE, 210, 10, '23411414000109'),
(18, 20, TRUE, TRUE, 240, 11, '23411414000109'),
(17, 19, FALSE, FALSE, 200, 12, '23411414000109'),

-- Shopping Aricanduva
(16, 20, TRUE, TRUE, 300, 13, '27423870000120'),
(19, 20, TRUE, TRUE, 320, 14, '27423870000120'),
(14, 17, FALSE, FALSE, 160, 15, '27423870000120'),

-- Shopping Campo Limpo
(13, 18, FALSE, TRUE, 190, 16, '69938764000129'),
(19, 20, TRUE, TRUE, 250, 17, '69938764000129'),
(15, 19, FALSE, FALSE, 230, 18, '69938764000129');


INSERT INTO "sessao" (
  "leg_ou_dub", "eh_3d", "data", "hora", "sala_id", "filme_id"
) VALUES
-- Shopping Iguatemi (50568161000154)
(TRUE, TRUE, '2024-12-26', '10:00:00', 4, 1),
(FALSE, FALSE, '2024-12-26', '14:00:00', 4, 2),
(TRUE, FALSE, '2024-12-26', '18:00:00', 4, 3),

(FALSE, TRUE, '2024-12-27', '11:00:00', 5, 4),
(TRUE, FALSE, '2024-12-27', '15:00:00', 5, 5),
(FALSE, FALSE, '2024-12-27', '19:00:00', 5, 6),

(TRUE, TRUE, '2024-12-28', '12:00:00', 6, 7),
(FALSE, FALSE, '2024-12-28', '16:00:00', 6, 8),
(TRUE, FALSE, '2024-12-28', '20:00:00', 6, 9),

-- Shopping Itaquera (55315900000110)
(FALSE, TRUE, '2024-12-29', '10:30:00', 7, 10),
(TRUE, FALSE, '2024-12-29', '14:30:00', 7, 11),
(FALSE, FALSE, '2024-12-29', '18:30:00', 7, 12),

(TRUE, TRUE, '2024-12-30', '11:30:00', 8, 13),
(FALSE, FALSE, '2024-12-30', '15:30:00', 8, 14),
(TRUE, FALSE, '2024-12-30', '19:30:00', 8, 15),

(FALSE, TRUE, '2024-12-31', '12:30:00', 9, 16),
(TRUE, FALSE, '2024-12-31', '16:30:00', 9, 17),
(FALSE, FALSE, '2024-12-31', '20:30:00', 9, 18),

-- Shopping Tatuapé (23411414000109)
(TRUE, TRUE, '2025-01-01', '10:00:00', 10, 19),
(FALSE, FALSE, '2025-01-01', '14:00:00', 10, 20),
(TRUE, FALSE, '2025-01-01', '18:00:00', 10, 1),

(FALSE, TRUE, '2025-01-02', '11:00:00', 11, 2),
(TRUE, FALSE, '2025-01-02', '15:00:00', 11, 3),
(FALSE, FALSE, '2025-01-02', '19:00:00', 11, 4),

(TRUE, TRUE, '2025-01-03', '12:00:00', 12, 5),
(FALSE, FALSE, '2025-01-03', '16:00:00', 12, 6),
(TRUE, FALSE, '2025-01-03', '20:00:00', 12, 7),

-- Shopping Aricanduva (27423870000120)
(FALSE, TRUE, '2025-01-04', '10:30:00', 13, 8),
(TRUE, FALSE, '2025-01-04', '14:30:00', 13, 9),
(FALSE, FALSE, '2025-01-04', '18:30:00', 13, 10),

(TRUE, TRUE, '2025-01-05', '11:30:00', 14, 11),
(FALSE, FALSE, '2025-01-05', '15:30:00', 14, 12),
(TRUE, FALSE, '2025-01-05', '19:30:00', 14, 13),

(FALSE, TRUE, '2025-01-06', '12:30:00', 15, 14),
(TRUE, FALSE, '2025-01-06', '16:30:00', 15, 15),
(FALSE, FALSE, '2025-01-06', '20:30:00', 15, 16),

-- Shopping Campo Limpo (69938764000129)
(TRUE, TRUE, '2025-01-07', '10:00:00', 16, 17),
(FALSE, FALSE, '2025-01-07', '14:00:00', 16, 18),
(TRUE, FALSE, '2025-01-07', '18:00:00', 16, 19),

(FALSE, TRUE, '2025-01-08', '11:00:00', 17, 20),
(TRUE, FALSE, '2025-01-08', '15:00:00', 17, 1),
(FALSE, FALSE, '2025-01-08', '19:00:00', 17, 2),

(TRUE, TRUE, '2025-01-09', '12:00:00', 18, 3),
(FALSE, FALSE, '2025-01-09', '16:00:00', 18, 4),
(TRUE, FALSE, '2025-01-09', '20:00:00', 18, 5);

-- poltrona

DO $$
DECLARE
    sala_id INT;
    cinema_id CHAR(14);
    row_num INT;
    col_num INT;
    row_letter CHAR(1);
BEGIN
    -- Iterate through each sala
    FOR sala_id, cinema_id IN (
        SELECT s.numero, s.cinema_id FROM sala s
    ) LOOP
        -- Loop for rows (profundidade)
        FOR row_num IN 1..20 LOOP
            -- Convert row number to a letter (A, B, C...)
            row_letter := CHR(64 + row_num);
            -- Loop for columns (largura)
            FOR col_num IN 1..20 LOOP
                INSERT INTO poltrona (numero, letra, tipo, sala_id)
                VALUES (col_num, row_letter, 1, sala_id); -- Default type as 1
            END LOOP;
        END LOOP;
    END LOOP;
END $$;


INSERT INTO ingresso (tipo, valor, valor_total, data, hora, forma_pagamento, cliente_id) VALUES
-- Entries for Client 1 ('46753425748')
(0, 20.00, 20.00, '2025-01-01', '15:00:00', 'Cartão de Crédito', '46753425748'),
(1, 10.00, 10.00, '2025-01-02', '15:00:00', 'Pix', '46753425748'),

-- Entries for Client 2 ('44710673624')
(1, 10.00, 10.00, '2025-01-01', '15:00:00', 'Cartão de Débito', '44710673624'),
(0, 20.00, 20.00, '2025-01-02', '15:00:00', 'Cartão de Crédito', '44710673624'),

-- Entries for Client 3 ('59084781210')
(0, 20.00, 20.00, '2025-01-01', '15:00:00', 'Pix', '59084781210'),
(1, 10.00, 10.00, '2025-01-02', '15:00:00', 'Cartão de Débito', '59084781210'),

-- Entries for Client 4 ('93727862840')
(1, 10.00, 10.00, '2025-01-01', '15:00:00', 'Cartão de Crédito', '93727862840'),
(0, 20.00, 20.00, '2025-01-02', '15:00:00', 'Pix', '93727862840'),

-- Entries for Client 5 ('02072103738')
(0, 20.00, 20.00, '2025-01-01', '15:00:00', 'Cartão de Débito', '02072103738'),
(1, 10.00, 10.00, '2025-01-02', '15:00:00', 'Cartão de Crédito', '02072103738');


-- pertence
INSERT INTO pertence (ingresso_id, sessao_n, poltrona_n, poltrona_l, sala_id) VALUES
-- Entries for Ingresso 1
(1, 1, 1, 'A', 4), -- First ingresso mapped to session 1, seat A1 in sala 4
(2, 2, 2, 'B', 4), -- Second ingresso mapped to session 2, seat B2 in sala 4

-- Entries for Ingresso 2
(3, 3, 3, 'C', 5), -- Third ingresso mapped to session 3, seat C3 in sala 5
(4, 4, 4, 'D', 5), -- Fourth ingresso mapped to session 4, seat D4 in sala 5

-- Entries for Ingresso 3
(5, 5, 5, 'E', 6), -- Fifth ingresso mapped to session 5, seat E5 in sala 6
(6, 6, 6, 'F', 6), -- Sixth ingresso mapped to session 6, seat F6 in sala 6

-- Entries for Ingresso 4
(7, 7, 7, 'G', 7), -- Seventh ingresso mapped to session 7, seat G7 in sala 7
(8, 8, 8, 'H', 7), -- Eighth ingresso mapped to session 8, seat H8 in sala 7

-- Entries for Ingresso 5
(9, 9, 9, 'I', 8), -- Ninth ingresso mapped to session 9, seat I9 in sala 8
(10, 10, 10, 'J', 8); -- Tenth ingresso mapped to session 10, seat J10 in sala 8



INSERT INTO funcionario (data_contratado, cpf, nome, sobrenome, trabalha_em) VALUES
    ('2024-01-15', '89124031682', 'Mariane', 'Silva', '50568161000154'),
    ('2023-11-02', '43480263941', 'Gabriela', 'Ferreira', '55315900000110'),
    ('2023-05-20', '02828806316', 'Caio', 'Caleb Monteiro', '23411414000109'),
    ('2023-04-17', '53105528202', 'Leonardo', 'Luiz da Cunha', '27423870000120'),
    ('2023-09-01', '79332255350', 'Natalia', 'Elza Nascimento', '69938764000129'),
    ('2022-08-12', '78792612148', 'Debora', 'Giovana Caldeira', '33644500000115'),
    ('2021-03-05', '12389485103', 'Carolina', 'Luciana Costa', '07496878000109'),
    ('2023-10-19', '13959097840', 'Enzo', 'Novaes', '65977736000160'),
    ('2024-02-22', '03988437832', 'Severino', 'Sebastião Farias', '14467753000116'),
    ('2023-07-28', '46790330615', 'Pedro Henrique', 'Assunção', '57996286000124'),
    ('2022-05-10', '68239079750', 'Vinicius', 'Lima', NULL),
    ('2023-01-31', '79060892356', 'Sophie Sara', 'Cortereal', NULL),
    ('2023-09-05', '60261456059', 'Marlene Daiane', 'Mendes', NULL),
    ('2023-06-17', '97035443983', 'Louise Mariane', 'Teixeira', NULL),
    ('2023-08-23', '51046838180', 'Levi Eduardo', 'Galvão', NULL),
    ('2023-03-09', '94075044092', 'Renato', 'Rocha', NULL),
    ('2023-12-11', '74841612335', 'Anderson', 'Assis', NULL),
    ('2024-03-14', '48242155526', 'Sarah Maya', 'Ramos', NULL),
    ('2023-04-25', '05317196345', 'Julio', 'Baptista', NULL),
    ('2023-02-13', '66036434995', 'Barbara Luciana', 'Jesus', NULL),
    ('2023-12-05', '55081243493', 'Lucas', 'Pereira', '50568161000154'),
    ('2023-07-20', '55670481224', 'Ana', 'Santos', '50568161000154'),
    ('2023-11-23', '45536802623', 'Carlos', 'Silva', '55315900000110'),
    ('2024-01-12', '11574647938', 'Juliana', 'Souza', '55315900000110'),
    ('2023-10-06', '50904433943', 'Fernando', 'Lima', '23411414000109'),
    ('2023-05-29', '24878871504', 'Patricia', 'Gomes', '23411414000109'),
    ('2022-08-16', '44631434708', 'Roberto', 'Costa', '27423870000120'),
    ('2023-09-04', '06361851842', 'Camila', 'Almeida', '27423870000120'),
    ('2023-03-02', '48396915172', 'Ricardo', 'Barbosa', '69938764000129'),
    ('2023-07-14', '55017559558', 'Beatriz', 'Ribeiro', '69938764000129'),
    ('2023-06-28', '60106264630', 'Sergio', 'Martins', '33644500000115'),
    ('2023-08-21', '58974642433', 'Mariana', 'Alves', '33644500000115'),
    ('2023-12-19', '45271154130', 'Rafael', 'Fernandes', '07496878000109'),
    ('2024-01-03', '25259858182', 'Daniele', 'Oliveira', '07496878000109'),
    ('2023-02-16', '35360867132', 'Eduardo', 'Carvalho', '65977736000160'),
    ('2023-11-30', '72882916426', 'Paulo', 'Silva', '65977736000160'),
    ('2024-04-18', '14174774072', 'Jessica', 'Moraes', '14467753000116'),
    ('2023-10-02', '29414128590', 'Vitor', 'Dias', '14467753000116'),
    ('2024-01-26', '43860890123', 'Alessandra', 'Castro', '57996286000124'),
    ('2023-05-24', '27921412203', 'Felipe', 'Campos', '57996286000124');

INSERT INTO "gerente" (email, senha, cpf) VALUES
('mariane_silva@hotmal.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$ZWZMcmdFR0tFYzgwR2txUTAzQkY4Qw$qRE/kkUdEWRTo1hywfJ1pa9jmWZJo4j+Prg26GoTS6k', '89124031682'),
('gabriela_ferreira@dep.ufscar.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$OU5hZHpyclJYbHB3aDVFYlBNNXQ5ag$jXq4GNmq5ESyzreWmaHpo2qSXZOcEpy0+g0jwQSi+bU', '43480263941'),
('caiocalebmonteiro@bluespropaganda.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$eks3cGNvaXdpUFRsZFZXUTdhR0JxZQ$Waidc6drJSL3qXG+waegmNgJQhTgQhIPhbmY/lkHWoE', '02828806316'),
('leonardo.luiz.dacunha@ouplook.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$RmFJZ2w4S1N6R0ltNGZ6dFJndFlTZw$NLctH6/ykRjeUjQJ/ZigsKf7lo/M4nQh0DQKaqf+4MQ', '53105528202'),
('nataliaelzanascimento@gat.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$YTZsWktFMEdhTmVTNHA4aFF0OFhSMQ$GcyJuDorqHJ3LLyW1AXfB0XA+zHq21OdElpLqW8hGLM', '79332255350'),
('debora.giovana.caldeira@cdcd.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$R0RmYkp3SVRxdHJYUWVDSkZOREM1TA$uBowIjS/01tPxPMknynJUl/nS3MyJ49EK+C3Xe/JFEY', '78792612148'),
('carolina_luciana_costa@abrangenciacorretora.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$WTI4Y292ZWRlQTREUGVTRHBtMzdLQg$71Ohbmk/p8QSbfk9GHeBD5WDl066yBvhhZQY2TKWfUo', '12389485103'),
('enzo_novaes@contabilidaderangel.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$cVFVVksxZkFaMElUVnJrWllWWmR5UA$fSsqr57/A9xV88EjallUFmR0PKv5OYEDqKTf0XHcofg', '13959097840'),
('severino_sebastiao_farias@amoamar.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$UjRPaGR1eHRDdUxIS2g2RUlFaHJRQQ$i3Utl0r5A0jlw+hFFamdzleYu+eMXwVHm9YIzD2qQ6s', '03988437832'),
('pedrohenriqueassuncao@2emesconstrutora.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$RXI2WkdyRlpzSjB0TFBvN3FwT1ZJRQ$RYpnMD4vAKCfhMvHQFADZE75WuKT4hYqQ5fsejQUMrI', '46790330615');

INSERT INTO "administrador" (email, senha, cpf) VALUES
('vinicius-lima98@sp.gov.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$cFJXVDVEeDAzY3lXTktla2p4MGdldw$3ncVGiPX3uxNH35uWxP2XikPygmPqudXI1J10QNWVFA', '68239079750'),
('sophie_sara_cortereal@51hotmail.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$OGZ3T3NObnptaEJPcko2MThtUjNYZQ$nyMr+OhGDOKjDeFV1yqM/+eWQCCjY6sbGWXdk/tEnXI', '79060892356'),
('marlene.daiane.mendes@focusgrafica.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$cks2RFhIZEZBRG13N3ppaUV3RFlwUQ$c8r6BKCPyeHQ6VyyN66+jHJ75bJkE25VoXUatcbdoO4', '60261456059'),
('louise_mariane_teixeira@abdalathomaz.adv.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bGZCclNXaWdJbjBWdnJWZXB4bzljeQ$g9WiHB7CRdtrdjIp2jWzewItZDOJNVjM0xZwggYbXpo', '97035443983'),
('levi.eduardo.galvao@lifefp.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$djFHandvbHNwNTR2OGNNT29iMk83MQ$Ty0vjpItlVGYDgyyOO6ARhRcDFd/EB6qtFB5pulfxMY', '51046838180'),
('renato-rocha90@ahlstrom.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$dWZGelBkY2VSdHRNQm5lYkFrVXF6TA$qIXTqVRyr6rk4iUTeTqzrvOHmMEKWv+3uBpcnpKXGU0', '94075044092'),
('anderson-assis73@evolink.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$NUpONU1ORThXWWw2N01GMTV4UEpEYg$aWn0wfpq0kyXITghtRApa+NcWa0JIT8cZhrWWk2e548', '74841612335'),
('sarah.maya.ramos@tricoproducts.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$TEQ4VVlxSnFtb1ZjVUc5VzhSUGZSTA$0lWsQTgQtGVXFwtmFRcAR36SY5B2pc6FhxbMlJglWQ8', '48242155526'),
('julio_baptista@tuenkers.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$dWdaNGxtQnNkOGVWSnZ3SVJGbEYxcg$xeWI1BRzVbj0+BaLx6xOVOp6x+GOaoVauqWvW66m60c', '05317196345'),
('barbara_luciana_jesus@wizardararaquara.com.br', 'argon2$argon2id$v=19$m=102400,t=2,p=8$RE53TlY0UzhSZHdyRkJHTWhvTVBCdg$p4gZ70U4C/blGdtHldRloYTx6mb3gvfsqJkopmjYTlU', '66036434995');

INSERT INTO "fcomum" ("cpf") VALUES
('55081243493'),
('55670481224'),
('45536802623'),
('11574647938'),
('50904433943'),
('24878871504'),
('44631434708'),
('06361851842'),
('48396915172'),
('55017559558'),
('60106264630'),
('58974642433'),
('45271154130'),
('25259858182'),
('35360867132'),
('72882916426'),
('14174774072'),
('29414128590'),
('43860890123'),
('27921412203');

COMMIT;
