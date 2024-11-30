BEGIN;

INSERT INTO "cliente" (
  "email", "telefone", "cpf", "nome", "sobrenome", "rua", "n_end", "complemento", "cep", "senha"
) VALUES
('marcia-dacunha70@nipnet.com.br', 96995797321, '46753425748', 'Márcia Isabella', 'Teresinha da Cunha', 'Travessa Segunda de Moraes', 567, NULL, '68904031', 'argon2$argon2id$v=19$m=102400,t=2,p=8$MzBseE9ya0l0a2g1Z2U2YUVmSzlGNg$E5gtpG74xqpGJEmPcOqb0n7YjQ4x2aSl+e9cN7uYpeU'),
('jennifer.emily.almada@sha.com.br', 73982230951, '44710673624', 'Jennifer Emily', 'Almada', 'Rua Santa Rita', 568, NULL, '45606755', 'argon2$argon2id$v=19$m=102400,t=2,p=8$R2Z4elgzZktXcmNEMjkyT2k5WGpZUA$Yf04UZD0Jo8AfOTZoIpDY36k+BDJb9vJ8I8cx//+NCE'),
('antonellaagathapires@arcante.com.br', 84996818168, '59084781210', 'Antonella Agatha', 'Pires', 'Rua Presidente João Goulart', 799, NULL, '59142310', 'argon2$argon2id$v=19$m=102400,t=2,p=8$eHJYM1BkV3pYVFBQVGVTYXA5ZWVqeg$UIpJAoJZbwQhgADYkO+WkaTg5F3Zc3k3kOx4l0gJIAQ'),
('luciaamandamelo@c-a-m.com', 95996924325, '93727862840', 'Lúcia Amanda Raquel', 'Melo', 'Rua Lírio do Campo', 889, NULL, '69314164', 'argon2$argon2id$v=19$m=102400,t=2,p=8$NG84bG9YZkN5S0gzNkFBYXlvR3dHbA$5aFBIs/q10032zD7mK0G1fDFltr8jJs/xzH8aBHc5AE'),
('iagobentoferreira@gringa360.com.br', 84994163932, '02072103738', 'Iago Bento', 'Ferreira', 'Rua Ozéas Pereira dos Santos', 697, NULL, '59146280', 'argon2$argon2id$v=19$m=102400,t=2,p=8$bU9icERQOVJEZ1M1amFWWjlnY3Q5Yw$FLZi+k9bNtjoyBe4NT4gL4FuU4Vr6r0Uloxzu9sbuRw'),
('eduardaemillyalves@sociedadeweb.com.br', 63988552690, '26893912528', 'Eduarda Emilly', 'Alves', 'Quadra 206 Sul Alameda 15', 547, NULL, '77020518', 'sXIpw6lpFL'),
('laura_rezende@microdoc.com.br', 45989082798, '18558287740', 'Laura Pietra Carolina', 'Rezende', 'Avenida Gramado', 524, NULL, '85862240', 'dK9EGXTQoD'),
('fernanda_assuncao@yahoo.com.ar', 91985957835, '60197630219', 'Fernanda Luciana', 'Assunção', 'Rua Sexta', 456, NULL, '66623210', '96tYdSKE8M'),
('alexandre_oliveira@jerasistemas.com.br', 47994720160, '94712157577', 'Alexandre Danilo', 'Oliveira', 'Rua Vidal Ramos', 729, NULL, '89207670', 'eZWnaPz1TX'),
('henry_victor_jesus@comprehense.com.br', 73994751819, '82221615808', 'Henry Victor', 'Jesus', 'Rua Aclamação', 805, NULL, '45992306', 'eWEl85N1K1'),
('stellafabianamoreira@supercleanlav.com.br', 68986038417, '15915481795', 'Stella Fabiana', 'Moreira', 'Travessa Capixaba', 827, NULL, '69906344', 'aL1g4pdh2G'),
('giovana_luana_dacruz@yoma.com.br', 85994884407, '99481292533', 'Giovana Luana', 'Giovana da Cruz', 'Rua Maria Ivone', 805, NULL, '60834472', 'SqtUTjHJCq'),
('valentina_teixeira@bwmtrade.com', 65992796069, '84605136703', 'Valentina Regina', 'Teixeira', 'Rua Paulo Sérgio', 696, NULL, '78128384', 'pSFShhGlPL'),
('bento-cortereal76@mrarquitetura.com.br', 21989537691, '83908729190', 'Bento Iago', 'Corte Real', 'Rua Marechal Serejo', 967, NULL, '22743380', 'OAAhTNjSqr'),
('sonia.olivia.ribeiro@inbox.com', 62992006719, '49728623607', 'Sônia Olivia', 'Ribeiro', 'Rodovia BR-153', 188, NULL, '74993600', 'r6L1M202gd'),
('diogobenjamincardoso@bigfoot.com', 31995745408, '58072366459', 'Diogo Benjamin', 'Manoel Cardoso', 'Rua Adriana', 468, NULL, '30865160', 'MdkaCO5IMw'),
('luzia_carvalho@freitasprior.com.br', 62996232377, '67497392700', 'Luzia Carla', 'Carvalho', 'Rua Cavalcante', 281, NULL, '75064200', '6Z7w9wS19e'),
('thomas.fabio.lopes@sgstelecom.com.br', 83992026211, '36246333095', 'Thomas Fábio Elias', 'Lopes', 'Rua Rufino Gomes de Araújo', 920, NULL, '58090462', 'ZbBnAN7AJS'),
('paulo-dasneves90@predialnet.com.br', 11998536677, '70835652289', 'Paulo Carlos Leonardo', 'das Neves', 'Rua Luiz Rosa da Costa', 404, NULL, '08753342', 'LtQYBMiPuE'),
('raquelpatriciacosta@hersa.com.br', 11984704262, '22832143601', 'Raquel Patrícia Elaine', 'Costa', 'Rua Santa Madalena', 423, NULL, '07996030', 'Brg1H6FzS4');

INSERT INTO filme (titulo, ano, diretor, class_ind, idioma, duracao, eh_dub, fim_contrato, descricao)
VALUES
('In the Mood for Love', 2000, 'Wong Kar Wai', 12, 'Chinês', '01:39:00', FALSE, '2024-12-31', 'Um homem e uma mulher descobrem que seus parceiros estão tendo um caso e desenvolvem uma amizade complexa.'),
('Drive My Car', 2021, 'Ryusuke Hamaguchi', 16, 'Japonês', '02:59:00', FALSE, '2024-12-31', 'Um diretor de teatro processa a dor e perda enquanto ensaia uma peça em Hiroshima.'),
('Little Women', 2019, 'Greta Gerwig', 10, 'Inglês', '01:39:00', FALSE, '2024-12-31', 'Quatro irmãs buscam suas aspirações em meio às dificuldades da Guerra Civil Americana.'),
('Call Me by Your Name', 2017, 'Luca Guadagnino', 10, 'Inglês', '02:12:00', FALSE, '2024-12-31', 'Um jovem descobre o amor e a paixão durante o verão na Itália.'),
('Past Lives', 2023, 'Celine Song', 12, 'Coreano', '01:45:00', FALSE, '2024-12-31', 'Amigos de infância se reencontram anos depois e refletem sobre o passado e escolhas.'),
('Paterson', 2023, 'Celine Song', 12, 'Inglês', '01:58:00', FALSE, '2024-12-31', 'A vida de um motorista de ônibus e poeta em uma cidade pacata.'),
('The Outsiders', 1983, 'Francis Ford Coppola', 14, 'Inglês', '01:45:00', FALSE, '2024-12-31', 'Grupos de jovens de classes sociais opostas enfrentam tensões em uma pequena cidade americana.'),
('RRR', 2022, 'S. S. Rajamouli', 16, 'Telugu', '03:05:00', FALSE, '2024-12-31', 'Dois revolucionários lutam pela liberdade contra o Império Britânico na Índia.'),
('Paper Moon', 1973, 'Peter Bogdanovich', 14, 'Inglês', '01:42:00', FALSE, '2024-12-31', 'Um vigarista e uma menina de 9 anos formam uma dupla improvável nas estradas do Kansas.'),
('Godzilla Minus One', 2023, 'Takashi Yamazaki', 16, 'Japonês', '02:04:00', FALSE, '2024-12-31', 'Godzilla ameaça a reconstrução do Japão após a Segunda Guerra Mundial.'),
('Parasite', 2019, 'Bong Joon Ho', 16, 'Coreano', '02:12:00', FALSE, '2024-12-31', 'Uma família pobre se infiltra na vida de uma família rica com consequências inesperadas.'),
('The Grand Budapest Hotel', 2014, 'Wes Anderson', 14, 'Inglês', '01:39:00', FALSE, '2024-12-31', 'Aventuras excêntricas em um luxuoso hotel europeu durante a guerra.'),
('Portrait of a Lady on Fire', 2019, 'Céline Sciamma', 14, 'Francês', '02:00:00', FALSE, '2024-12-31', 'Uma pintora e sua modelo se envolvem em um romance proibido na França do século XVIII.'),
('Amélie', 2001, 'Jean-Pierre Jeunet', 12, 'Francês', '02:02:00', FALSE, '2024-12-31', 'Uma jovem tímida decide fazer boas ações e mudar a vida das pessoas ao seu redor.'),
('Cinema Paradiso', 1988, 'Giuseppe Tornatore', 12, 'Italiano', '02:35:00', FALSE, '2024-12-31', 'Um cineasta relembra sua infância em um pequeno cinema italiano.'),
('The Handmaiden', 2016, 'Park Chan-wook', 18, 'Coreano', '02:25:00', FALSE, '2024-12-31', 'Uma trama de engano e paixão se desenrola entre uma rica herdeira e sua criada.'),
('City of God', 2002, 'Fernando Meirelles', 18, 'Português', '02:10:00', FALSE, '2024-12-31', 'História de jovens em uma favela violenta do Rio de Janeiro nos anos 70.'),
('Spirited Away', 2001, 'Hayao Miyazaki', 10, 'Japonês', '02:05:00', FALSE, '2024-12-31', 'Uma menina fica presa em um mundo mágico e precisa encontrar uma maneira de salvar seus pais.'),
('The Farewell', 2019, 'Lulu Wang', 10, 'Inglês', '01:40:00', FALSE, '2024-12-31', 'Uma jovem lida com a doença da avó em um plano familiar de mantê-la sem saber.'),
('Memories of Murder', 2003, 'Bong Joon Ho', 16, 'Coreano', '02:11:00', FALSE, '2024-12-31', 'Investigadores tentam resolver uma série de assassinatos em uma pequena cidade sul-coreana.');


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
('Shopping SP-Market', '33644500000115', 1139264558, 'Rua Tonga', 176, 'Parque das Nações', 09280180),
('Shopping El Dorado', '07496878000109', 1936447975, 'Rua do Bicudo do Norte', 100, 'Jardim Boa Esperança', 13183355),
('Shopping Dom Pedro', '65977736000160', 1128938424, 'Rua Sebastião Cláudio Barreto', 270, 'Parque Residencial Potiguara', 13312763),
('Shopping Paulista', '14467753000116', 1628762221, 'Rua Manoel Gouveia', 734, 'Vila Cardim', 15997310),
('Shopping Litoral Plaza Shopping', '57996286000124', 1335884175, 'Rua Benedito Lacerda', 139, 'Solemar', 11709120),
('Shopping Morumbi', '45789164000190', 1135678432, 'Rua Roque Petrella', 452, 'Morumbi', 04583010),
('Shopping Villa-Lobos', '14567832000150', 1129345687, 'Rua dos Três Irmãos', 578, 'Alto de Pinheiros', 05424010),
('Shopping Bourbon', '78345611000122', 1198763456, 'Rua Palestra Itália', 500, 'Perdizes', 05005010),
('Shopping Center Norte', '67834521000133', 1198321456, 'Rua José Bernardo Pinto', 333, 'Vila Guilherme', 02055000),
('Shopping Frei Caneca', '56412387000198', 1129475641, 'Rua Frei Caneca', 569, 'Consolação', 01307001),
('Shopping Pátio Paulista', '45623912000176', 1198426532, 'Rua Treze de Maio', 1947, 'Bela Vista', 01327000),
('Shopping Santa Cruz', '23478190000127', 1138462079, 'Rua Domingos de Morais', 2564, 'Vila Mariana', 04035000),
('Shopping Cidade São Paulo', '98765432000189', 1129706754, 'Avenida Paulista', 1230, 'Bela Vista', 01310100),
('Shopping Ibirapuera', '65387291000122', 1198765430, 'Avenida Ibirapuera', 3103, 'Indianópolis', 04029000),
('Shopping Interlagos', '23567841000109', 1154328769, 'Avenida Interlagos', 2255, 'Jardim Umuarama', 04661200);


INSERT INTO "pontos" ("data", "hora", "qtde", "cliente_id") VALUES
('2023-01-15', '10:23:45', 123, '46753425748'),
('2023-02-20', '14:35:22', 456, '44710673624'),
('2023-03-18', '09:12:11', 789, '59084781210'),
('2023-04-25', '16:45:33', 234, '93727862840'),
('2023-05-10', '11:20:50', 567, '02072103738'),
('2023-06-30', '08:55:44', 890, '26893912528'),
('2023-07-14', '12:30:15', 345, '18558287740'),
('2023-08-22', '13:40:20', 678, '60197630219'),
('2023-09-05', '17:50:30', 901, '94712157577'),
('2023-10-12', '15:25:40', 112, '82221615808'),
('2023-11-18', '18:15:55', 334, '15915481795'),
('2023-12-25', '20:45:10', 556, '99481292533'),
('2023-01-02', '09:05:25', 778, '84605136703'),
('2023-02-14', '22:35:50', 990, '83908729190'),
('2023-03-30', '07:15:35', 123, '49728623607'),
('2023-04-11', '19:25:45', 456, '58072366459'),
('2023-05-28', '06:35:55', 789, '67497392700'),
('2023-06-06', '21:45:05', 234, '36246333095'),
('2023-07-19', '23:55:15', 567, '70835652289'),
('2023-08-27', '05:05:25', 890, '22832143601');

INSERT INTO "sala" ("profundidade", "largura", "suporta_imax", "suporta_3d", "qtde_poltronas", "numero", "cinema_id") VALUES
(25, 20, true, true, 250, 1, '50568161000154'),
(30, 25, false, true, 150, 2, '50568161000154'),
(22, 18, true, false, 200, 3, '55315900000110'),
(28, 22, false, true, 180, 4, '55315900000110'),
(27, 21, true, true, 230, 5, '23411414000109'),
(26, 19, false, false, 160, 6, '23411414000109'),
(29, 23, true, false, 210, 7, '27423870000120'),
(24, 20, false, true, 140, 8, '27423870000120'),
(26, 22, true, true, 220, 9, '69938764000129'),
(30, 24, false, false, 175, 10, '69938764000129'),
(23, 18, true, false, 190, 11, '33644500000115'),
(28, 20, false, true, 155, 12, '33644500000115'),
(25, 21, true, true, 210, 13, '07496878000109'),
(27, 23, false, false, 180, 14, '07496878000109'),
(29, 24, true, false, 240, 15, '65977736000160'),
(22, 19, false, true, 130, 16, '65977736000160'),
(30, 22, true, true, 200, 17, '14467753000116'),
(25, 20, false, false, 150, 18, '14467753000116'),
(26, 18, true, true, 220, 19, '57996286000124'),
(27, 21, false, true, 180, 20, '57996286000124');

INSERT INTO "sessao" ("leg_ou_dub", "eh_3d", "data", "hora", "sala_id", "filme_id") VALUES
(true, true, '2023-10-01', '14:30:00', 1, 1),
(false, false, '2023-10-02', '16:45:00', 2, 2),
(true, false, '2023-10-03', '18:00:00', 3, 3),
(false, true, '2023-10-04', '20:15:00', 4, 4),
(true, false, '2023-10-05', '22:00:00', 5, 5),
(false, false, '2023-10-06', '12:30:00', 6, 6),
(true, true, '2023-10-07', '15:45:00', 7, 7),
(false, true, '2023-10-08', '17:00:00', 8, 8),
(true, false, '2023-10-09', '19:15:00', 9, 9),
(false, false, '2023-10-10', '21:30:00', 10, 10),
(true, true, '2023-10-11', '13:00:00', 11, 11),
(false, true, '2023-10-12', '15:30:00', 12, 12),
(true, false, '2023-10-13', '18:45:00', 13, 13),
(false, false, '2023-10-14', '20:00:00', 14, 14),
(true, true, '2023-10-15', '16:30:00', 15, 15),
(false, true, '2023-10-16', '18:00:00', 16, 16),
(true, false, '2023-10-17', '19:30:00', 17, 17),
(false, false, '2023-10-18', '21:00:00', 18, 18),
(true, true, '2023-10-19', '14:15:00', 19, 19),
(false, true, '2023-10-20', '16:45:00', 20, 20);

INSERT INTO "poltrona" ("numero", "letra", "tipo", "sala_id") VALUES
(1, 'A', 1, 1),
(2, 'B', 2, 1),
(3, 'C', 1, 1),
(4, 'D', 3, 1),
(5, 'E', 2, 1),
(6, 'F', 1, 1),
(7, 'G', 3, 1),
(8, 'H', 2, 1),
(9, 'I', 1, 1),
(10, 'J', 3, 1),
(11, 'K', 1, 1),
(12, 'L', 2, 1),
(13, 'M', 3, 1),
(14, 'N', 1, 1),
(15, 'O', 2, 1),
(16, 'P', 3, 1),
(17, 'Q', 1, 1),
(18, 'R', 2, 1),
(19, 'S', 3, 1),
(20, 'T', 1, 1),

(1, 'A', 1, 2), (2, 'B', 2, 2), (3, 'C', 1, 2), (4, 'D', 3, 2), (5, 'E', 2, 2),
(6, 'F', 1, 2), (7, 'G', 3, 2), (8, 'H', 2, 2), (9, 'I', 1, 2), (10, 'J', 3, 2),
(11, 'K', 1, 2), (12, 'L', 2, 2), (13, 'M', 3, 2), (14, 'N', 1, 2), (15, 'O', 2, 2),
(16, 'P', 3, 2), (17, 'Q', 1, 2), (18, 'R', 2, 2), (19, 'S', 3, 2), (20, 'T', 1, 2),

(1, 'A', 2, 3), (2, 'B', 3, 3), (3, 'C', 1, 3), (4, 'D', 2, 3), (5, 'E', 3, 3),
(6, 'F', 1, 3), (7, 'G', 2, 3), (8, 'H', 3, 3), (9, 'I', 1, 3), (10, 'J', 2, 3),
(11, 'K', 3, 3), (12, 'L', 1, 3), (13, 'M', 2, 3), (14, 'N', 3, 3), (15, 'O', 1, 3),
(16, 'P', 2, 3), (17, 'Q', 3, 3), (18, 'R', 1, 3), (19, 'S', 2, 3), (20, 'T', 3, 3),

(1, 'A', 1, 4), (2, 'B', 2, 4), (3, 'C', 3, 4), (4, 'D', 1, 4), (5, 'E', 2, 4),
(6, 'F', 3, 4), (7, 'G', 1, 4), (8, 'H', 2, 4), (9, 'I', 3, 4), (10, 'J', 1, 4),
(11, 'K', 2, 4), (12, 'L', 3, 4), (13, 'M', 1, 4), (14, 'N', 2, 4), (15, 'O', 3, 4),
(16, 'P', 1, 4), (17, 'Q', 2, 4), (18, 'R', 3, 4), (19, 'S', 1, 4), (20, 'T', 2, 4),

(1, 'A', 3, 5), (2, 'B', 1, 5), (3, 'C', 2, 5), (4, 'D', 3, 5), (5, 'E', 1, 5),
(6, 'F', 2, 5), (7, 'G', 3, 5), (8, 'H', 1, 5), (9, 'I', 2, 5), (10, 'J', 3, 5),
(11, 'K', 1, 5), (12, 'L', 2, 5), (13, 'M', 3, 5), (14, 'N', 1, 5), (15, 'O', 2, 5),
(16, 'P', 3, 5), (17, 'Q', 1, 5), (18, 'R', 2, 5), (19, 'S', 3, 5), (20, 'T', 1, 5),

(1, 'A', 1, 6), (2, 'B', 2, 6), (3, 'C', 3, 6), (4, 'D', 1, 6), (5, 'E', 2, 6),
(6, 'F', 3, 6), (7, 'G', 1, 6), (8, 'H', 2, 6), (9, 'I', 3, 6), (10, 'J', 1, 6),
(11, 'K', 2, 6), (12, 'L', 3, 6), (13, 'M', 1, 6), (14, 'N', 2, 6), (15, 'O', 3, 6),
(16, 'P', 1, 6), (17, 'Q', 2, 6), (18, 'R', 3, 6), (19, 'S', 1, 6), (20, 'T', 2, 6),

(1, 'A', 1, 7), (2, 'B', 2, 7), (3, 'C', 3, 7), (4, 'D', 1, 7), (5, 'E', 2, 7),
(6, 'F', 3, 7), (7, 'G', 1, 7), (8, 'H', 2, 7), (9, 'I', 3, 7), (10, 'J', 1, 7),
(11, 'K', 2, 7), (12, 'L', 3, 7), (13, 'M', 1, 7), (14, 'N', 2, 7), (15, 'O', 3, 7),
(16, 'P', 1, 7), (17, 'Q', 2, 7), (18, 'R', 3, 7), (19, 'S', 1, 7), (20, 'T', 2, 7),

(1, 'A', 2, 8), (2, 'B', 3, 8), (3, 'C', 1, 8), (4, 'D', 2, 8), (5, 'E', 3, 8),
(6, 'F', 1, 8), (7, 'G', 2, 8), (8, 'H', 3, 8), (9, 'I', 1, 8), (10, 'J', 2, 8),
(11, 'K', 3, 8), (12, 'L', 1, 8), (13, 'M', 2, 8), (14, 'N', 3, 8), (15, 'O', 1, 8),
(16, 'P', 2, 8), (17, 'Q', 3, 8), (18, 'R', 1, 8), (19, 'S', 2, 8), (20, 'T', 3, 8),

(1, 'A', 1, 9), (2, 'B', 2, 9), (3, 'C', 3, 9), (4, 'D', 1, 9), (5, 'E', 2, 9),
(6, 'F', 3, 9), (7, 'G', 1, 9), (8, 'H', 2, 9), (9, 'I', 3, 9), (10, 'J', 1, 9),
(11, 'K', 2, 9), (12, 'L', 3, 9), (13, 'M', 1, 9), (14, 'N', 2, 9), (15, 'O', 3, 9),
(16, 'P', 1, 9), (17, 'Q', 2, 9), (18, 'R', 3, 9), (19, 'S', 1, 9), (20, 'T', 2, 9),

(1, 'A', 3, 10), (2, 'B', 1, 10), (3, 'C', 2, 10), (4, 'D', 3, 10), (5, 'E', 1, 10),
(6, 'F', 2, 10), (7, 'G', 3, 10), (8, 'H', 1, 10), (9, 'I', 2, 10), (10, 'J', 3, 10),
(11, 'K', 1, 10), (12, 'L', 2, 10), (13, 'M', 3, 10), (14, 'N', 1, 10), (15, 'O', 2, 10),
(16, 'P', 3, 10), (17, 'Q', 1, 10), (18, 'R', 2, 10), (19, 'S', 3, 10), (20, 'T', 1, 10),

(1, 'A', 1, 11), (2, 'B', 2, 11), (3, 'C', 3, 11), (4, 'D', 1, 11), (5, 'E', 2, 11),
(6, 'F', 3, 11), (7, 'G', 1, 11), (8, 'H', 2, 11), (9, 'I', 3, 11), (10, 'J', 1, 11),
(11, 'K', 2, 11), (12, 'L', 3, 11), (13, 'M', 1, 11), (14, 'N', 2, 11), (15, 'O', 3, 11),
(16, 'P', 1, 11), (17, 'Q', 2, 11), (18, 'R', 3, 11), (19, 'S', 1, 11), (20, 'T', 2, 11),

(1, 'A', 2, 12), (2, 'B', 3, 12), (3, 'C', 1, 12), (4, 'D', 2, 12), (5, 'E', 3, 12),
(6, 'F', 1, 12), (7, 'G', 2, 12), (8, 'H', 3, 12), (9, 'I', 1, 12), (10, 'J', 2, 12),
(11, 'K', 3, 12), (12, 'L', 1, 12), (13, 'M', 2, 12), (14, 'N', 3, 12), (15, 'O', 1, 12),
(16, 'P', 2, 12), (17, 'Q', 3, 12), (18, 'R', 1, 12), (19, 'S', 2, 12), (20, 'T', 3, 12),

(1, 'A', 1, 13), (2, 'B', 2, 13), (3, 'C', 3, 13), (4, 'D', 1, 13), (5, 'E', 2, 13),
(6, 'F', 3, 13), (7, 'G', 1, 13), (8, 'H', 2, 13), (9, 'I', 3, 13), (10, 'J', 1, 13),
(11, 'K', 2, 13), (12, 'L', 3, 13), (13, 'M', 1, 13), (14, 'N', 2, 13), (15, 'O', 3, 13),
(16, 'P', 1, 13), (17, 'Q', 2, 13), (18, 'R', 3, 13), (19, 'S', 1, 13), (20, 'T', 2, 13),

(1, 'A', 2, 14), (2, 'B', 3, 14), (3, 'C', 1, 14), (4, 'D', 2, 14), (5, 'E', 3, 14),
(6, 'F', 1, 14), (7, 'G', 2, 14), (8, 'H', 3, 14), (9, 'I', 1, 14), (10, 'J', 2, 14),
(11, 'K', 3, 14), (12, 'L', 1, 14), (13, 'M', 2, 14), (14, 'N', 3, 14), (15, 'O', 1, 14),
(16, 'P', 2, 14), (17, 'Q', 3, 14), (18, 'R', 1, 14), (19, 'S', 2, 14), (20, 'T', 3, 14),

(1, 'A', 1, 15), (2, 'B', 2, 15), (3, 'C', 3, 15), (4, 'D', 1, 15), (5, 'E', 2, 15),
(6, 'F', 3, 15), (7, 'G', 1, 15), (8, 'H', 2, 15), (9, 'I', 3, 15), (10, 'J', 1, 15),
(11, 'K', 2, 15), (12, 'L', 3, 15), (13, 'M', 1, 15), (14, 'N', 2, 15), (15, 'O', 3, 15),
(16, 'P', 1, 15), (17, 'Q', 2, 15), (18, 'R', 3, 15), (19, 'S', 1, 15), (20, 'T', 2, 15),

(1, 'A', 3, 16), (2, 'B', 1, 16), (3, 'C', 2, 16), (4, 'D', 3, 16), (5, 'E', 1, 16),
(6, 'F', 2, 16), (7, 'G', 3, 16), (8, 'H', 1, 16), (9, 'I', 2, 16), (10, 'J', 3, 16),
(11, 'K', 1, 16), (12, 'L', 2, 16), (13, 'M', 3, 16), (14, 'N', 1, 16), (15, 'O', 2, 16),
(16, 'P', 3, 16), (17, 'Q', 1, 16), (18, 'R', 2, 16), (19, 'S', 3, 16), (20, 'T', 1, 16),

(1, 'A', 1, 17), (2, 'B', 2, 17), (3, 'C', 3, 17), (4, 'D', 1, 17), (5, 'E', 2, 17),
(6, 'F', 3, 17), (7, 'G', 1, 17), (8, 'H', 2, 17), (9, 'I', 3, 17), (10, 'J', 1, 17),
(11, 'K', 2, 17), (12, 'L', 3, 17), (13, 'M', 1, 17), (14, 'N', 2, 17), (15, 'O', 3, 17),
(16, 'P', 1, 17), (17, 'Q', 2, 17), (18, 'R', 3, 17), (19, 'S', 1, 17), (20, 'T', 2, 17),

(1, 'A', 2, 18), (2, 'B', 3, 18), (3, 'C', 1, 18), (4, 'D', 2, 18), (5, 'E', 3, 18),
(6, 'F', 1, 18), (7, 'G', 2, 18), (8, 'H', 3, 18), (9, 'I', 1, 18), (10, 'J', 2, 18),
(11, 'K', 3, 18), (12, 'L', 1, 18), (13, 'M', 2, 18), (14, 'N', 3, 18), (15, 'O', 1, 18),
(16, 'P', 2, 18), (17, 'Q', 3, 18), (18, 'R', 1, 18), (19, 'S', 2, 18), (20, 'T', 3, 18),

(1, 'A', 1, 19), (2, 'B', 2, 19), (3, 'C', 3, 19), (4, 'D', 1, 19), (5, 'E', 2, 19),
(6, 'F', 3, 19), (7, 'G', 1, 19), (8, 'H', 2, 19), (9, 'I', 3, 19), (10, 'J', 1, 19),
(11, 'K', 2, 19), (12, 'L', 3, 19), (13, 'M', 1, 19), (14, 'N', 2, 19), (15, 'O', 3, 19),
(16, 'P', 1, 19), (17, 'Q', 2, 19), (18, 'R', 3, 19), (19, 'S', 1, 19), (20, 'T', 2, 19),

(1, 'A', 3, 20), (2, 'B', 1, 20), (3, 'C', 2, 20), (4, 'D', 3, 20), (5, 'E', 1, 20),
(6, 'F', 2, 20), (7, 'G', 3, 20), (8, 'H', 1, 20), (9, 'I', 2, 20), (10, 'J', 3, 20),
(11, 'K', 1, 20), (12, 'L', 2, 20), (13, 'M', 3, 20), (14, 'N', 1, 20), (15, 'O', 2, 20),
(16, 'P', 3, 20), (17, 'Q', 1, 20), (18, 'R', 2, 20), (19, 'S', 3, 20), (20, 'T', 1, 20);


INSERT INTO "ingresso" ("tipo", "valor", "valor_total", "data", "hora", "forma_pagamento", "cliente_id") VALUES
(1, 20.00, 20.00, '2023-10-01', '14:00:00', 'Cartão de Crédito', '46753425748'),
(2, 10.00, 10.00, '2023-10-02', '16:30:00', 'Pix', '44710673624'),
(1, 20.00, 20.00, '2023-10-03', '18:45:00', 'Dinheiro', '59084781210'),
(1, 20.00, 20.00, '2023-10-04', '20:15:00', 'Cartão de Débito', '93727862840'),
(2, 10.00, 10.00, '2023-10-05', '12:30:00', 'Cartão de Crédito', '02072103738'),
(1, 20.00, 20.00, '2023-10-06', '15:45:00', 'Dinheiro', '26893912528'),
(2, 10.00, 10.00, '2023-10-07', '17:00:00', 'Cartão de Crédito', '18558287740'),
(1, 20.00, 20.00, '2023-10-08', '19:15:00', 'Pix', '60197630219'),
(2, 10.00, 10.00, '2023-10-09', '21:30:00', 'Cartão de Débito', '94712157577'),
(1, 20.00, 20.00, '2023-10-10', '13:00:00', 'Cartão de Crédito', '82221615808'),
(2, 10.00, 10.00, '2023-10-11', '15:30:00', 'Dinheiro', '15915481795'),
(1, 20.00, 20.00, '2023-10-12', '18:45:00', 'Pix', '99481292533'),
(2, 10.00, 10.00, '2023-10-13', '20:00:00', 'Cartão de Crédito', '84605136703'),
(1, 20.00, 20.00, '2023-10-14', '16:30:00', 'Cartão de Débito', '83908729190'),
(2, 10.00, 10.00, '2023-10-15', '18:00:00', 'Dinheiro', '49728623607'),
(1, 20.00, 20.00, '2023-10-16', '19:30:00', 'Pix', '58072366459'),
(2, 10.00, 10.00, '2023-10-17', '21:00:00', 'Cartão de Crédito', '67497392700'),
(1, 20.00, 20.00, '2023-10-18', '14:15:00', 'Cartão de Débito', '36246333095'),
(2, 10.00, 10.00, '2023-10-19', '16:45:00', 'Dinheiro', '70835652289'),
(1, 20.00, 20.00, '2023-10-20', '19:00:00', 'Pix', '22832143601');

INSERT INTO "pertence" ("ingresso_id", "sessao_n", "poltrona_n", "poltrona_l", "sala_id") VALUES
(5, 3, 10, 'J', 1),
(8, 6, 3, 'C', 2),
(1, 12, 7, 'G', 3),
(15, 10, 1, 'A', 4),
(3, 4, 6, 'F', 5),
(11, 15, 2, 'B', 6),
(7, 2, 9, 'I', 7),
(4, 11, 5, 'E', 8),
(12, 17, 13, 'M', 9),
(2, 8, 14, 'N', 10),
(9, 1, 4, 'D', 11),
(6, 7, 8, 'H', 12),
(14, 14, 11, 'K', 13),
(13, 19, 15, 'O', 14),
(10, 5, 12, 'L', 15),
(18, 16, 17, 'Q', 16),
(17, 20, 18, 'R', 17),
(20, 13, 20, 'T', 18),
(16, 9, 16, 'P', 19),
(19, 18, 19, 'S', 20);

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
    ('2022-05-10', '68239079750', 'Vinicius', 'Lima', '50568161000154'),
    ('2023-01-31', '79060892356', 'Sophie Sara', 'Cortereal', '50568161000154'),
    ('2023-09-05', '60261456059', 'Marlene Daiane', 'Mendes', '50568161000154'),
    ('2023-06-17', '97035443983', 'Louise Mariane', 'Teixeira', '50568161000154'),
    ('2023-08-23', '51046838180', 'Levi Eduardo', 'Galvão', '50568161000154'),
    ('2023-03-09', '94075044092', 'Renato', 'Rocha', '50568161000154'),
    ('2023-12-11', '74841612335', 'Anderson', 'Assis', '50568161000154'),
    ('2024-03-14', '48242155526', 'Sarah Maya', 'Ramos', '50568161000154'),
    ('2023-04-25', '05317196345', 'Julio', 'Baptista', '50568161000154'),
    ('2023-02-13', '66036434995', 'Barbara Luciana', 'Jesus', '50568161000154'),
    ('2023-12-05', '55081243493', 'Lucas', 'Pereira', '50568161000154'),
    ('2023-07-20', '55670481224', 'Ana', 'Santos', '50568161000154'),
    ('2023-11-23', '45536802623', 'Carlos', 'Silva', '50568161000154'),
    ('2024-01-12', '11574647938', 'Juliana', 'Souza', '50568161000154'),
    ('2023-10-06', '50904433943', 'Fernando', 'Lima', '50568161000154'),
    ('2023-05-29', '24878871504', 'Patricia', 'Gomes', '50568161000154'),
    ('2022-08-16', '44631434708', 'Roberto', 'Costa', '50568161000154'),
    ('2023-09-04', '06361851842', 'Camila', 'Almeida', '50568161000154'),
    ('2023-03-02', '48396915172', 'Ricardo', 'Barbosa', '50568161000154'),
    ('2023-07-14', '55017559558', 'Beatriz', 'Ribeiro', '50568161000154'),
    ('2023-06-28', '60106264630', 'Sergio', 'Martins', '50568161000154'),
    ('2023-08-21', '58974642433', 'Mariana', 'Alves', '50568161000154'),
    ('2023-12-19', '45271154130', 'Rafael', 'Fernandes', '50568161000154'),
    ('2024-01-03', '25259858182', 'Daniele', 'Oliveira', '50568161000154'),
    ('2023-02-16', '35360867132', 'Eduardo', 'Carvalho', '50568161000154'),
    ('2023-11-30', '72882916426', 'Paulo', 'Silva', '50568161000154'),
    ('2024-04-18', '14174774072', 'Jessica', 'Moraes', '50568161000154'),
    ('2023-10-02', '29414128590', 'Vitor', 'Dias', '50568161000154'),
    ('2024-01-26', '43860890123', 'Alessandra', 'Castro', '50568161000154'),
    ('2023-05-24', '27921412203', 'Felipe', 'Campos', '50568161000154');

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