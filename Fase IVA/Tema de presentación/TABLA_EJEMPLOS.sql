create database ejemplosdetodo;
drop database ejemplosdetodo;
use ejemplosdetodo;

create table usuario(
id int auto_increment primary key,
nombre varchar(50) not null,
contrasenia varbinary(200) not null
);

ALTER DATABASE ejemplosdetodo CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; 

/*MD5*/

INSERT INTO usuario values(null, 'carlos', md5('contraseniaMD5')); 

/*SHA*/

INSERT INTO usuario values(null, 'antonio', sha('contraseniaSHA')); 

/*SHA1*/

INSERT INTO usuario values(null, 'daniel', sha1('contraseniaSHA1')); 

/*SHA2*/

INSERT INTO usuario values(null, 'cristian', sha2('ABC',256)); 

select * from usuario;

/*AES*/

insert into usuario (nombre,contrasenia) values ('camilo', aes_encrypt('contraseniaAES', 'llave'));

select usuario.id, usuario.nombre, convert (aes_decrypt(contrasenia,'llave') using utf8mb4) as 
contraseniaDesencriptada from usuario;
