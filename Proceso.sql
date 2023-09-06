/* para accede a la base de datos */
mysql -h localhost -u root -p

/*Para crear la base de datos*/

CREATE DATABASE blog;

/*Para selecionar la base de datos*/

USE blog;

/*Creacion de tabla Usuarios*/

CREATE TABLE Usuarios(Usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    Usuario_login VARCHAR (30) NOT NULL, 
    Usuario_Password VARCHAR (32) NOT NULL, 
    Usuario_NickName VARCHAR (40) NOT NULL, 
    Usuario_email VARCHAR (40) NOT NULL UNIQUE
);

CREATE TABLE etiquetas (
    etiquetas_id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(30)
);

CREATE TABLE Categorias (
    Categorias_id INT PRIMARY KEY NOT NULL,
    Categoria VARCHAR(30)
); 

CREATE TABLE Posts (
    post_id INT PRIMARY KEY NOT NULL,
    titulo VARCHAR (150),
    fecha_publicacion TIMESTAMP NOT NULL,
    contenido TEXT,
    estatus CHAR(8) CHECK(estatus IN('activo','inactivo'))
);

ALTER TABLE posts
ADD COLUMN Usuario_id INT, 
ADD FOREIGN KEY (Usuario_id) REFERENCES usuarios(Usuario_id);

ALTER TABLE posts
ADD COLUMN Categorias_id INT, 
ADD FOREIGN KEY (Categorias_id) REFERENCES Categorias(Categorias_id);

CREATE TABLE post_etiquetas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_etiquetas INT,
    id_posts INT
);

CREATE TABLE comentarios (
    comentario_id INT PRIMARY KEY AUTO_INCREMENT,
    comentario TEXT,
    Usuario_id INT,
    Posts_id INT
);

ALTER TABLE post_etiquetas
    ADD FOREIGN KEY (id_etiquetas) REFERENCES etiquetas(etiquetas_id);

ALTER TABLE post_etiquetas
    ADD FOREIGN KEY (id_posts) REFERENCES posts (post_id);

ALTER TABLE comentarios
    ADD FOREIGN KEY (Usuario_id) REFERENCES usuarios(Usuario_id);

ALTER TABLE comentarios
    ADD FOREIGN KEY (Posts_id) REFERENCES posts(post_id);

ALTER TABLE usuarios
ADD nombre_Usuario VARCHAR (60);

ALTER TABLE usuarios
ALTER COLUMN nombre_Usuario NOT NULL;

ALTER TABLE usuarios
ADD empresa VARCHAR (50); 

ALTER TABLE usuarios
DROP COLUMN Usuario_login;

ALTER TABLE usuarios
ADD telefono INT(10) NOT NULL;

ALTER TABLE usuarios
ADD pais VARCHAR (30) NOT NULL;

ALTER TABLE usuarios
ADD codigo_postal int(5) NOT NULL;

ALTER TABLE usuarios
MODIFY nombre_Usuario VARCHAR(60) NOT NULL;

ALTER TABLE usuarios 
MODIFY telefono INT (10) NOT NULL UNIQUE;

ALTER TABLE posts
MODIFY contenido VARCHAR(250) NOT NULL;

ALTER TABLE usuarios
ADD edad INT(10) NOT NULL CHECK (edad >= 18);

CREATE TABLE Mensajeria (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    emisor INT,
    receptor VARCHAR(30) NOT NULL,
    fecha_creacion TIMESTAMP NOT NULL
);

ALTER TABLE Mensajeria
    ADD FOREIGN KEY (emisor) REFERENCES usuarios(Usuario_id);
