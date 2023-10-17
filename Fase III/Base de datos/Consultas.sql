use BDD_SIDEP;

/*Consultas*/



/*Mostrar las ventas realizadas por un Maria Angela entre las fechas de 2021-10-01 y 2021-10-31*/
select Id_Venta, Fecha, c.Nombre,c.Apellido, p.Nombre, Precio, Cantidad, sum(Precio*Cantidad) as Total 
from Ventas join Cliente c on Id_Cliente=Cliente 
join Usuario u on Id_Usuario=Vendedor join Productos p on Id_Producto=Producto 
where Fecha between '2021-10-01' and '2021-10-31' 
group by Id_Venta, u.Nombre, u.Apellido, Fecha, c.Nombre,c.Apellido, p.Nombre, Precio, Cantidad, Total_venta
having u.Nombre= 'Maria Angela';


/*Mostrar los insumos de entrada al inventario que tienen unidades mayor a 1000*/
select Nro_Registro as Nro_inventario, i.fecha, m.Nombre as Producto, p.Nombre as Proveedor,
e.Cantidad, e.Precio from Entradas e join Inventario i on Id_Entrada=Registro
join Movimientos_Inventario on Id_Movimiento=Movimiento join Insumos m on Id_Insumo=i.Insumo 
join Proveedores p on Id_Proveedor=Proveedor
where Cantidad>=1000;



/*Mostrar la salida del inventario del insumo 105 con su respectiva cantidad, 
mostrando la solicitud del insumo y la produccion en la que se usó*/
select Id_Salida, Id_Solicitud, so.Fecha as Fecha_Solicitud, so.Hora as Hora_Solicitud, 
ds.Cantidad as Cantidad_Insumo, Id_Produccion, Producto, p.Cantidad as Cantidad_Producto 
from Productos  join Produccion p on Id_Producto=Producto join Solicitud_insumos so on Id_Solicitud=Solicitud 
join Detalle_Solicitud ds on Id_Solicitud=ds.Solicitud
join Salida s on Id_Solicitud=s.Solicitud
join Insumos on Id_Insumo=s.Insumo join Inventario on Id_Salida=Registro
where ds.Insumo=105 and s.Insumo=105



/*Mostrar las entradas realizadas por Angie Paola, donde muestre su cargo su identificación, su email
y los Id de las entradas y sus fechas*/
select u.Cargo, u.Id_Usuario, u.Email, Id_Entrada, i.fecha as Fecha_Entrada 
from Rol r join Usuario u on r.Id_rol=u.Id_rol 
join Entradas e on Id_Usuario = e.Usuario join Inventario i on Id_Entrada=Registro
where U.Nombre= 'Angie Paola'
