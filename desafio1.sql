DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  planos_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  planos VARCHAR(50) NOT NULL,
  value_plans DOUBLE NOT NULL
)  engine = InnoDB;

INSERT INTO SpotifyClone.planos(planos, value_plans)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);

CREATE TABLE SpotifyClone.usuarios(
  user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	usuarios VARCHAR(200) NOT NULL,
	age INT NOT NULL,
  planos_id INT NOT NULL,
  assinatura DATETIME NOT NULL,
  FOREIGN KEY (planos_id) REFERENCES planos(planos_id)
)  engine = InnoDB;

INSERT INTO SpotifyClone.usuarios(usuarios, age, planos_id, assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE SpotifyClone.artistas(
  seguindo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artistas VARCHAR(200) NOT NULL
)  engine = InnoDB;

INSERT INTO SpotifyClone.artistas (artistas)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE SpotifyClone.album(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album VARCHAR(200) NOT NULL,
  seguindo_id INT NOT NULL,
  lancamento YEAR,
  FOREIGN KEY (seguindo_id) REFERENCES artistas(seguindo_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.album (album, seguindo_id, lancamento)
VALUES
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);

CREATE TABLE SpotifyClone.musica(
  reproducao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id INT NOT NULL,
  musica VARCHAR(200) NOT NULL,
  tempo INT NOT NULL,
  FOREIGN KEY (id) REFERENCES album (id)
) engine = InnoDB;

INSERT INTO SpotifyClone.musica (id, musica, tempo)
VALUES
	(1,	'BREAK MY SOUL', 279),
	(1,	'VIRGO’S GROOVE', 369),
	(1,	'ALIEN SUPERSTAR', 116),
	(2,	'Don’t Stop Me Now', 203),
	(3,	'Under Pressure', 152),
	(4,	'Como Nossos Pais', 105),
	(5,	'O Medo de Amar é o  Medo de Ser Livre', 207),
	(6,	'Samba em Paris', 267),
	(7,	'The Bard’s Song', 244),
	(8, 'Feeling Good', 100);

CREATE TABLE SpotifyClone.historico_reproducao(
    user INT NOT NULL,
    reproducao_id INT NOT NULL,
    reproducao DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(user, reproducao_id),
    FOREIGN KEY (user) REFERENCES usuarios (user),
    FOREIGN KEY (reproducao_id) REFERENCES musica(reproducao_id)
) engine = InnoDB;
    
INSERT INTO SpotifyClone.historico_reproducao(user, reproducao_id, reproducao) 
VALUES
	(1,	8,	"2022-02-28 10:45:55"),
	(1,	2,	"2020-05-02 05:30:35"),
	(1,	10,	"2020-03-06 11:22:33"),
	(2,	10,	"2022-08-05 08:05:17"),
	(2,	7,	"2020-01-02 07:40:33"),
	(3,	10,	"2020-11-13 16:55:13"),
	(3,	2,	"2020-12-05 18:38:30"),
	(4,	8,	"2021-08-15 17:10:10"),
	(5,	8,	"2022-01-09 01:44:33"),
	(5,	5,	"2020-08-06 15:23:43"),
	(6,	7,	"2017-01-24 00:31:17"),
	(6,	1,	"2017-10-12 12:35:20"),
	(7,	4,	"2011-12-15 22:30:49"),
	(8,	4,	"2012-03-17 14:56:41"),
	(9,	9,	"2022-02-24 21:14:22"),
	(10, 3,	"2015-12-13 08:30:22");
    
CREATE TABLE SpotifyClone.seguindo_artistas(
    seguindo_id INT NOT NULL,
    user INT NOT NULL,
    CONSTRAINT PRIMARY KEY(seguindo_id, user),
    FOREIGN KEY (seguindo_id) REFERENCES artistas (seguindo_id),
    FOREIGN KEY (user) REFERENCES usuarios (user)
) engine = InnoDB;
    
INSERT INTO SpotifyClone.seguindo_artistas(seguindo_id, user)
VALUES
	(1,	1),
	(2,	1),
	(3,	1),
	(1,	2),
	(3,	2),
	(2,	3),
	(4,	4),
	(5,	5),
	(6,	5),
	(6,	6),
	(1,	6),
	(6,	7),	
	(3,	9),
	(2,	10); 
