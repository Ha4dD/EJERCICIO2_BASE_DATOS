CREATE DATABASE redsocial;

CREATE TABLE usuario (
    id_usuario INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (30) NOT NULL,
    biografia VARCHAR (100) NOT NULL,
    genero VARCHAR (10) NOT NULL,
    email VARCHAR (50) NOT NULL
);

CREATE TABLE amigo (
    id_amigo INT (10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (30) NOT NULL,
    genero VARCHAR (10) NOT NULL,
    biografia VARCHAR (100) NOT NULL,
    email VARCHAR (50) NOT NULL
);

CREATE TABLE usuario_amigo (
  	id_usuario_amigo INT(20)PRIMARY KEY NOT NULL AUTO_INCREMENT,
  	id_usuario INT(10) NOT NULL,
 	id_amigo INT(10) NOT NULL,
  	FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
  	FOREIGN KEY (id_amigo) REFERENCES amigo (id_amigo) ON DELETE CASCADE
);

CREATE TABLE comentario(
    id_comentario INT(10)PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_usuario INT,
    fecha VARCHAR (20) NOT NULL,
    texto VARCHAR(2000) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE publicacion (
    id_publicacion INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_usuario INT,
    formato_imagen VARCHAR(20) NOT NULL,
    formato_video VARCHAR(20) NOT NULL,
    numero_reacciones BIGINT(100) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE comentario_publicacion(
    id_comentario_publicacion INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_publicacion INT,
    id_comentario INT,
    FOREIGN KEY (id_publicacion) REFERENCES publicacion (id_publicacion) ON DELETE CASCADE,
   FOREIGN KEY (id_comentario) REFERENCES comentario (id_comentario) ON DELETE CASCADE
);

IINSERT INTO usuario (nombre,biografia,genero,email) VALUES 
('CRISTIAN','SOY COLOMBIANO','HOMBRE','CRISTIANP4LT4@GMAIL.COM'),
('FELIPE','SOY ARGENTINO','HOMBRE','FELIPE@GMAIL.COM'),
('DANIELA','SOY BOLIVIANA','MUJER','DANIELA123@GMAIL.COM'),
('CAMILA','SOY ARGENTINA','MUJER','CAMILA123@GMAIL.COM'),
('VERONICA','SOY ITALIANA','MUJER','VERONICA213@GMAIL.COM');

INSERT INTO amigo (nombre,genero,biografia,email) VALUES 
('ANDRES','HOMBRE','SOY BRASILEÑO','ANDRES5342@GMAIL.COM'),
('PEDRO','HOMBRE','SOY ARGENTINO','PEDRO435@GMAIL.COM'),
('DANIELA','MUJER','SOY BRASILEÑA','DANIELA123@GMAIL.COM'),
('CAMILA','MUJER','SOY VENEZOLANA','CAMILA123@GMAIL.COM'),
('VERONICA','MUJER','SOY ARGENTINA','VERONICA213@GMAIL.COM');

INSERT INTO usuario_amigo (id_usuario,id_amigo) VALUES 
(1,1),
(2,1),
(3,2),
(4,1),
(5,1);

INSERT INTO comentario (id_usuario,fecha,texto) VALUES 
(1,'2 de mayo','felices vacaciones'),
(2,'5 de julio','feliz cumpleaños'),
(3,'31 de diciembre','feliz navidad'),
(4,'9 de marzo','feliz cumpleaños'),
(5,'20 de julio','te extraño');

INSERT INTO publicacion (id_usuario,formato_imagen,formato_video,numero_reacciones) VALUES
(1,'jpg','mp4',100),
(2,'jpg','mp4',234),
(3,'jpg','mp4',543),
(4,'jpg','mp4',430),
(5,'jpg','mp4',95);

INSERT INTO comentario_publicacion (id_publicacion,id_comentario) VALUES
(1,1),
(2,1),
(3,2),
(4,1),
(5,1);