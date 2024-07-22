CREATE DATABASE ProgramacionWeb;

USE ProgramacionWeb;

-- Tabla de Usuarios-----

CREATE TABLE Usuario(
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(80) NOT NULL,
  apellido VARCHAR(80) NOT NULL,
  correo VARCHAR(80) NOT NULL,
  nombreUsuario VARCHAR(45) NOT NULL,
  pass VARCHAR(20) NOT NULL,
  fechaNac DATE NOT NULL,
  fechaCrea DATETIME,
  imgPerfl VARCHAR(70),
  PRIMARY KEY (idUsuario));
  
select * from Usuario;

  SELECT * FROM Publicacion where Publicacion.userPost = 12;
  
  

-- Tabla Publicaciones-----
drop table Publicacion;

CREATE TABLE Publicacion(
  idPublicacion INT NOT NULL AUTO_INCREMENT,
  userPost INT NOT NULL,
  fechaCrea DATETIME,
  tituloPubli VARCHAR(45) NOT NULL,
  cuerpoPubli VARCHAR(45) NOT NULL,
  postEtiqueta VARCHAR(30),
  spoiler int,
  PRIMARY KEY (idPublicacion),
  FOREIGN KEY (userPost) REFERENCES Usuario (idUsuario));
  
 SELECT * FROM Publicacion where Publicacion.tituloPubli like '%pura%';
 SELECT * FROM Publicacion where Publicacion.cuerpoPubli like '%plantas%';
 SELECT * FROM Publicacion where Publicacion.tituloPubli like '%Mi primer%' AND Publicacion.spoiler = '1';
 SELECT * FROM Publicacion where Publicacion.spoiler = '1' order by idPublicacion desc limit 0, 10;

select *from publicacion;
  update Publicacion set  spoiler='0' where idPublicacion='1';


drop table Comentario;
-- Tabla Comentarios-----
CREATE TABLE Comentario(
  idComentario INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  idPost INT,
  comentario VARCHAR(150) NOT NULL,
  spoiler BOOL,
  PRIMARY KEY (idComentario),
  FOREIGN KEY (idUsuario) REFERENCES Usuario (idUsuario),
  FOREIGN KEY (idPost) REFERENCES Publicacion (idPublicacion));	



select * from Usuario;

select * from Usuario where correo like '%asd%';

select * from Publicacion limit 3;


select * from Publicacion;
select * from Comentario;



insert into Comentario (idUsuario, idPost, comentario) values('12','7 ', 'holaaaaaaaaa');