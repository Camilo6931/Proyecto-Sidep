use database_sidep;

/*PROCEDIMIENTO PARA LA TABLA ROL*/
DELIMITER //
 create procedure addRol (
 IN inIdRol int,
 IN inDescripcion varchar(30)
 )
 BEGIN
 insert into Rol values(inIdRol, inDescripcion);
 END //
 DELIMITER ;
call addRol(1, 'Administrador');
select * from Rol;
 
 /*PROCEDIMIENTO PARA LA TABLA USUARIO*/
 DELIMITER //
 create procedure addUsuario (
 IN inIdUsuario bigint,
 IN inNombre varchar(50),
 IN inApellido varchar(50),
 IN inContraseña varchar(20),
 IN inEmail varchar(30),

 IN inIdRol int
 )
 BEGIN
 insert into Usuario values(inIdUsuario, inNombre, inApellido, inContraseña, inEmail, inIdRol);
 END //
 DELIMITER ;
 call addUsuario(1111532, 'Edwin', 'Sierra', 'hola123', 'edsiby0808@gmail.com', 1);
 select * from Usuario;
 
 /*Procedimiento tabla control personal */
 DELIMITER //
 create procedure addControlPersonal (
 IN inUsuario int
 )
 BEGIN
 insert into ControlPersonal (idUsuarioFk) values(inUsuario);
 END //
 DELIMITER ;
 call addControlPersonal(101110);
 select * from ControlPersonal;
 
 /*Procedimiento tabla proveedores */
 DELIMITER //
 create procedure addProveedor (
 IN inIdProveedor int,
 IN inNombre varchar(30),
 IN inDireccion varchar(80),
 IN inTelefono bigint
 )
 BEGIN
 insert into Proveedores values(inIdProveedor, inNombre, inDireccion, inTelefono);
 END //
 DELIMITER ;
 call addProveedor(17571, 'Julio', 'Cll100 #124', 31231231421);
 select * from database_sidep.proveedores;
 
 /*PROCEDIMIENTO PARA LA TABLA INSUMOS*/
DELIMITER //
create procedure addInsumos(
in in_Nombre varchar(30),
in in_Precio float,
in in_UnidadMedida int
)
BEGIN
	insert into 
    Insumos (Nombre,Precio,idUnidadFk)
    values (
    in_Nombre,
    in_Precio,
    in_UnidadMedida
    );
END //
DELIMITER ;
call addInsumos('Ejemplo',9800,3);
select * from database_sidep.insumos;
 
 /*Procedimiento tabla entradas */
 DELIMITER //
 create procedure addEntradas (
 IN inInsumo int,
 IN inPrecio float,
 IN inCantidad int,
 IN inProveedor bigint,
 IN inUsuario bigint
 )
 BEGIN
 insert into Entradas (idInsumoFk, Precio,Cantidad, idProveedorFk, idUsuarioFk) values(inInsumo, inPrecio, inCantidad, inProveedor, inUsuario);
 END //
 DELIMITER ;
 call addEntradas(100, 3500, 3000, 65432, 101113);
 select * from database_sidep.entradas;
 
 /*Procedimiento tabla movimiento inventario */
DELIMITER //
 create procedure addMovimientosInventario (
 IN inIdMovimiento int,
 IN inDescripcion varchar(30)
 )
 BEGIN
 insert into movimientosinventario values(inIdMovimiento, inDescripcion);
 END //
 DELIMITER ;
 call addMovimientosInventario(3, 'Ejemplo');
 select * from MovimientosInventario;
 
 /*Procedimiento tabla solicitud insumos */
DELIMITER //
 create procedure addSolicitudInsumos (
 IN inIdSolicitud int,
 IN inPanadero int
 )
 BEGIN
 insert into solicitudinsumos (idSolicitud, idPanaderoFk) values(inIdSolicitud, inPanadero);
 END //
 DELIMITER ;
 call addSolicitudInsumos(21, 101111); 
 select * from solicitudinsumos;
 
 /*PROCEDIMIENTO PARA LA TABLA DETALLE_SOLICITUD*/
DELIMITER //
create procedure addDetallesolicitud(
in in_insumo int,
in in_cantidad int,
in in_solicitud int
)
BEGIN
	insert into 
    DetalleSolicitud(idInsumoFk,Cantidad,idSolicitudFk)
    values (
    in_insumo,
    in_cantidad,
    in_solicitud
    );
END //
DELIMITER ;
call addDetalleSolicitud(108,120,20);
select * from detallesolicitud;

/*PROCEDIMIENTO PARA LA TABLA SALIDA*/
DELIMITER //
create procedure addSalida(
in in_Insumo int,
in in_Cantidad int,
in in_Solicitud int
)
BEGIN
	insert into 
    Salida (idInsumoFk, Cantidad, idSolicitudFk)
    values (
    in_Insumo,
    in_Cantidad,
    in_solicitud
    );
END //
DELIMITER ;
call addSalida(108,120,20);
select * from salida;

/*PROCEDIMIENTO PARA LA TABLA INVENTARIO*/
DELIMITER //
create procedure addInventario(
in in_Movimiento int,
in in_Insumo int,
in in_Registro int
)
BEGIN
	insert into 
    Inventario (idMovimientoFk, idInsumoFk, Registro)
    values (
    in_Movimiento,
    in_Insumo, 
    in_Registro
    );
END //
DELIMITER ;
call addInventario(1,101,1001);
select * from inventario;

/*PROCEDIMIENTO PARA LA TABLA PRODUCTOS*/
DELIMITER //
create procedure addProductos(
in in_Nombre varchar(60),
in in_Precio float
)
BEGIN
	insert into 
    Productos (Nombre, Precio)
    values (
    in_Nombre,
    in_Precio
    );
END //
DELIMITER ;
call addProductos('Pan Calentano',400);
select * from productos;

/*PROCEDIMIENTO PARA LA TABLA PRODUCCION*/
DELIMITER //
create procedure addProduccion(
in in_Producto int,
in in_Cantidad int,
in in_Solicitud int
)
BEGIN
	insert into 
    Produccion (idProductoFk,Cantidad,idSolicitudFk)
    values (
    in_Producto,
    in_Cantidad,
    in_Solicitud
    );
END //
DELIMITER ;
call addProduccion(101,75,20);
select * from produccion;

/*PROCEDIMIENTO PARA LA TABLA CLIENTE*/
DELIMITER //
create procedure addCliente(
in in_Id_Cliente bigint,
in in_Nombre varchar(40),
in in_Apellido varchar(40),
in in_Direccion varchar(80),
in in_Telefono bigint
)
BEGIN
	insert into 
    Cliente
    values (
    in_Id_Cliente, 
    in_Nombre,
    in_Apellido,
    in_Direccion,
    in_Telefono
    );
END //
DELIMITER ;
call addCliente(104111,'Edwin','Estupiñan','cra 13-65a 10',3209653721);
select * from cliente;

/*PROCEDIMIENTO PARA LA TABLA VENTAS*/
DELIMITER //
create procedure addVentas(
in in_Vendedor int,
in in_Cliente int,
in in_Producto int,
in in_Cantidad int,
in in_TotalVenta float
)
BEGIN
	insert into 
    Ventas (idVendedorFk,idClienteFk,idProductoFk,Cantidad,Total_venta)
    values (
    in_Vendedor,
    in_Cliente,
    in_Producto,
    in_Cantidad, 
    in_TotalVenta
    );
END //
DELIMITER ;
call addVentas(101112,104111,104,15,6000);
select * from ventas;


