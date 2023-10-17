use database_sidep;

/*Buscar ventas realizadas entre unas fechas especificas*/
DELIMITER //
create procedure sp_ConsultarAllVentas(IN FechaIni datetime, FechaFin datetime)
BEGIN
IF FechaIni > FechaFin or FechaFin<FechaIni
THEN
select * from ventas;
else
select idVenta, idVendedorFk as Vendedor, idClienteFk as Cliente, Nombre as Producto, Cantidad, Fecha, Total_venta FROM
Ventas inner join productos on idProductoFk=idProducto where Fecha between FechaIni and FechaFin;
end if;
END //
DELIMITER ;
call sp_ConsultarAllVentas('2021-10-02','2021-10-30');

/*Buscar ventas realizadas por un vendedor especifico y entre unas fechas especificas*/
DELIMITER //
create procedure sp_ConsultarVentasporVendedor(IN FechaIni datetime, FechaFin datetime, idVendedor bigint)
BEGIN
IF FechaIni > FechaFin or FechaFin<FechaIni
THEN
select idVenta, idVendedorFk as Vendedor, idClienteFk as Cliente, Nombre as Producto, Cantidad, Fecha, Total_venta FROM
Ventas inner join productos on idProductoFk=idProducto where idVendedorFk=idVendedor;
else
select idVenta, idVendedorFk as Vendedor, idClienteFk as Cliente, Nombre as Producto, Cantidad, Fecha, Total_venta FROM
Ventas inner join productos on idProductoFk=idProducto where (idVendedorFk=idVendedor) and (Fecha between FechaIni and FechaFin);
end if;
END //
DELIMITER ;
call sp_ConsultarVentasporVendedor('2021-10-02','2021-10-30',101114);

/*Consultar los movimientos de un insumo*/
DELIMITER //
create procedure sp_ConsultarMovimientosdeInsumo(Insumo int)
BEGIN
select ins.nombre, mv.Descripcion as Movimiento, i.fecha from Insumos ins inner join Inventario i on i.idInsumoFk=ins.idInsumo
inner join movimientosinventario mv on i.idMovimientoFk=mv.idMovimiento
where ins.idInsumo=Insumo;
END //
DELIMITER ;
call sp_ConsultarMovimientosdeInsumo(108);

/*Consultar los registros de control de un Usuario*/
DELIMITER //
create procedure sp_ConsultarRegistroUsuarios(Usuario bigint)
BEGIN
select idUsuario as Documento, u.Nombre as Nombres, u.Apellido as Apellidos, c.Fecha from Usuario u
inner join ControlPersonal c on u.idUsuario=c.idUsuarioFk where u.idUsuario=Usuario; 
END //
DELIMITER ;
call sp_ConsultarRegistroUsuarios(101110);

/*Consultar las solicitudes realizadas entre fechas especificas*/
DELIMITER //
create procedure sp_ConsultarSolicitudes(IN FechaIni datetime, FechaFin datetime)
BEGIN
IF FechaIni > FechaFin or FechaFin<FechaIni
THEN
select * from SolicitudInsumos;
else
select so.idSolicitud, so.Fecha, u.Nombre as Nombre_panadero, u.Apellido, i.Nombre as Insumo, de.Cantidad, 
ud.Descripcion as UnidadMedida from SolicitudInsumos so
inner join Usuario u on so.idPanaderoFk=u.idUsuario inner join DetalleSolicitud de on de.idSolicitudFk=so.idSolicitud
inner join Insumos i on de.idInsumoFk=i.idInsumo inner join UnidadMedida ud on i.idUnidadFk=ud.idUnidad 
where so.Fecha between FechaIni and FechaFin;
end if;
END //
DELIMITER ;
call sp_ConsultarSolicitudes('2021-03-24','2021-03-28');

/*Consultar las solicitudes realizadas por un usuario especifico y entre fechas especificas*/
DELIMITER //
create procedure sp_ConsultarSolicitudesUsuario(IN FechaIni datetime, FechaFin datetime, Panadero bigint)
BEGIN
IF FechaIni > FechaFin or FechaFin<FechaIni
THEN
select * from SolicitudInsumos;
else
select so.idSolicitud, so.Fecha, u.Nombre as Nombre_panadero, u.Apellido, i.Nombre as Insumo, de.Cantidad, 
ud.Descripcion as UnidadMedida from SolicitudInsumos so
inner join Usuario u on so.idPanaderoFk=u.idUsuario inner join DetalleSolicitud de on de.idSolicitudFk=so.idSolicitud
inner join Insumos i on de.idInsumoFk=i.idInsumo inner join UnidadMedida ud on i.idUnidadFk=ud.idUnidad 
where (so.Fecha between FechaIni and FechaFin) and (so.idPanaderoFk=Panadero);
end if;
END //
DELIMITER ;
call sp_ConsultarSolicitudesUsuario('2021-03-24','2021-04-02',101117);

