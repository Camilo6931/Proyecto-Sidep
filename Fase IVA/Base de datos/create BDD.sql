create database database_sidep;
use database_sidep;
drop database database_sidep;

create table Rol(
idRol int not null primary key,
Descripcion Varchar (30) not null
);

create table UnidadMedida(
idUnidad int not null auto_increment primary key,
Descripcion Varchar (30) not null
);

create table Usuario(
idUsuario bigint not null primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Contraseña varchar (20) not null,
Email varchar (30) not null,
idRolFk int not null,
foreign key (idRolFk) references Rol(idRol)
);

create table ControlPersonal(
idRegistroPersonal int not null auto_increment primary key,
idUsuarioFk bigint not null,
foreign key (idUsuarioFk) references Usuario(idUsuario),
Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null
) auto_increment=10;

create table Proveedores(
idProveedor bigint not null primary key,
Nombre varchar(30) not null,
Dirección varchar(80) not null,
Telefono bigint not null
);

create table Insumos(
idInsumo int not null auto_increment primary key,
Nombre varchar (30) not null,
Precio float not null,
idUnidadFk int not null,
foreign key (idUnidadFk) references UnidadMedida(idUnidad)
)AUTO_INCREMENT=100;


create table Entradas(
IdEntrada int not null auto_increment primary key, 
idInsumoFk int not null,
foreign key (idInsumoFk) references Insumos(idInsumo),
Precio float not null,
Cantidad int not null,
idProveedorFk bigint not null,
foreign key (idProveedorFk) references Proveedores(idProveedor),
idUsuarioFk bigint not null,
foreign key (idUsuarioFk) references Usuario(idUsuario)
)auto_increment=1000;

create table MovimientosInventario(
idMovimiento int not null primary key,
Descripcion varchar(30) not null
);

create table SolicitudInsumos(
idSolicitud int not null  primary key,
Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
idPanaderoFk bigint not null,
foreign key (idPanaderoFk) references Usuario(idUsuario)
);

create table DetalleSolicitud(
idDetalleSolicitud int not null auto_increment primary key,
idInsumoFk int not null,
foreign key (idInsumoFk) references Insumos(idInsumo),
Cantidad int not null,
idSolicitudFk int not null,
foreign key (idSolicitudFk) references Solicitudinsumos(idSolicitud)
);

create table Salida(
idSalida int not null auto_increment primary key,
idInsumoFk int not null,
foreign key (idInsumoFk) references Insumos(idInsumo),
Cantidad int not null,
idSolicitudFk int not null,
foreign key (idSolicitudFk) references Solicitudinsumos(idSolicitud)
)auto_increment=2000;

create table Inventario(
idInventario int not null auto_increment primary key,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
idMovimientoFk int not null,
foreign key (idMovimientoFk) references MovimientosInventario(idMovimiento),
idInsumoFk int not null,
foreign key (idInsumoFk) references Insumos(idInsumo),
Registro int not null
) auto_increment=3000;

create table Productos(
idProducto int not null auto_increment primary key,
Nombre varchar(60) not null,
Precio float not null
)auto_increment=100;

create table Produccion(
idProduccion int not null auto_increment primary key,
idProductoFk int not null,
foreign key (idProductoFk) references Productos(idProducto),
Cantidad int not null,
idSolicitudFk int null,
foreign key (idSolicitudFk) references Solicitudinsumos(idSolicitud)
)auto_increment=1000;

create table Cliente(
idCliente bigint not null primary key,
Nombre varchar(40) not null,
Apellido varchar (40) not null,
Direccion varchar(80) not null,
Telefono bigint not null
);

create table Ventas(
idVenta int not null auto_increment primary key,
idVendedorFk bigint not null,
foreign key (idVendedorFk) references Usuario(idUsuario),
idClienteFk bigint not null,
foreign key (idClienteFk) references Cliente(idCliente),
idProductoFk int not null,
foreign key (idProductoFk) references Productos(idProducto),
Cantidad int not null,
Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
Total_venta float not null
)auto_increment=1000;
