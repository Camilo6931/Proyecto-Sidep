
/*CREACION DE USUARIOS*/
create user 'administrador'@'localhost' IDENTIFIED BY 'admin';
create user 'panadero'@'localhost' IDENTIFIED BY 'pan';
create user 'vendedor'@'localhost' IDENTIFIED BY 'vender';

/*CREACION DE LOS PRIVILEGIOS DEL ADMINISTRADOR*/
GRANT ALL PRIVILEGES ON database_sidep.* TO 'administrador'@'localhost';
FLUSH PRIVILEGES;
show grants for 'administrador'@'localhost';

/*CREACION DE LOS PRIVILEGIOS DEL PANADERO*/
GRANT SELECT,INSERT ON database_sidep.solicitudinsumos TO 'panadero'@'localhost';
GRANT SELECT,INSERT ON database_sidep.produccion TO 'panadero'@'localhost';
GRANT SELECT,INSERT ON database_sidep.detallesolicitud TO 'panadero'@'localhost';
FLUSH PRIVILEGES;
show grants for 'panadero'@'localhost';

/*CREACION DE LOS PRIVILEGIOS DEL VENDEDOR*/
GRANT SELECT,INSERT,UPDATE ON database_sidep.cliente TO 'vendedor'@'localhost';
GRANT SELECT,INSERT ON database_sidep.ventas TO 'vendedor'@'localhost';
FLUSH PRIVILEGES;
show grants for 'vendedor'@'localhost';
