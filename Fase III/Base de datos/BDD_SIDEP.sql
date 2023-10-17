create database BDD_SIDEP;
use BDD_SIDEP;

create table Rol(
Id_rol int not null primary key,
Descripcion Varchar (30) not null
);

create unique index Cargo on Rol(Descripcion);

create table Usuario(
Id_Usuario int not null primary key,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Contraseña varchar (20) not null,
Email varchar (30) not null,
Genero varchar(30) not null,
Id_rol int not null,
foreign key (Id_rol) references Rol(Id_rol),
Cargo varchar(30) not null
);

create table Control_Personal(
Id_Registro int not null IDENTITY(0100,1) primary key,
Usuario int not null,
foreign key (Usuario) references Usuario(Id_Usuario),
Fecha date,
Hora time
);

create table Proveedores(
Id_Proveedor int not null primary key,
Nombre varchar(30) not null,
Dirección varchar(80) not null,
Telefono int not null
);

create unique index NomProveedor on Proveedores(Nombre);

create table Insumos(
Id_Insumo int not null IDENTITY(0100,1) primary key,
Nombre varchar (30) not null,
Precio float not null,
Unidad_Medida varchar(30) not null,
);

create index Nominsumo on Insumos(Nombre);

create table Entradas(
Id_Entrada int not null IDENTITY(010000,1) primary key, 
Insumo int not null,
foreign key (Insumo) references Insumos(Id_Insumo),
Precio float not null,
Cantidad int not null,
Proveedor int not null,
foreign key (Proveedor) references Proveedores(Id_Proveedor),
Usuario int not null,
foreign key (Usuario) references Usuario(Id_Usuario)
);

create index Id_insumo on Entradas(Insumo);

create table Movimientos_Inventario(
Id_Movimiento int not null primary key,
Descripcion varchar(30) not null
);

create unique index Movimiento on Movimientos_Inventario(Descripcion);

create table Solicitud_insumos(
Id_Solicitud int not null  primary key,
Fecha date not null,
Hora time not null,
Panadero int not null
foreign key (Panadero) references Usuario(Id_Usuario)
);

create table Detalle_Solicitud(
Id_DetalleSolicitud int not null IDENTITY primary key,
Insumo int not null,
foreign key (Insumo) references Insumos(Id_Insumo),
Cantidad int not null,
Solicitud int not null,
foreign key (Solicitud) references Solicitud_insumos(Id_Solicitud),
);

create table Salida(
Id_Salida int not null IDENTITY(020000,1) primary key,
Fecha date not null,
Insumo int not null,
foreign key (Insumo) references Insumos(Id_Insumo),
Cantidad int not null,
Solicitud int not null,
foreign key (Solicitud) references Solicitud_insumos(Id_Solicitud)
);

create table Inventario(
Nro_Registro int not null IDENTITY(030000,1) primary key,
fecha date not null,
Movimiento int not null,
foreign key (Movimiento) references Movimientos_Inventario(Id_Movimiento),
Descripcion varchar(30) not null,
Insumo int not null,
foreign key (Insumo) references Insumos(Id_Insumo),
Registro int not null
);

create table Productos(
Id_Producto int not null IDENTITY (100,1) primary key,
Nombre varchar(60) not null,
Precio float not null
);

create index NomProducto on Productos(Nombre);

create table Produccion(
Id_Produccion int not null IDENTITY (01000,1) primary key,
Producto int not null,
foreign key (Producto) references Productos(Id_Producto),
Cantidad int not null,
Solicitud int null,
foreign key (Solicitud) references Solicitud_insumos(Id_Solicitud)
);

create table Cliente(
Id_Cliente int not null primary key,
Nombre varchar(40) not null,
Apellido varchar (40) not null,
Direccion varchar(80) not null,
Telefono int not null
);

create unique index TelCliente on Cliente(Telefono);

create table Ventas(
Id_Venta int not null IDENTITY(01000,1) primary key,
Vendedor int not null,
foreign key (Vendedor) references Usuario(Id_Usuario),
Cliente int not null,
foreign key (Cliente) references Cliente(Id_Cliente),
Producto int not null,
foreign key (Producto) references Productos(Id_Producto),
Cantidad int not null,
Fecha date not null,
Total_venta float not null
);

create index ClienteIndex on Ventas(Cliente);

create table Detalle_Venta(
Id_Detalle int not null IDENTITY(01000,1) primary key,
Venta int not null,
foreign key (Venta) references Ventas(Id_Venta),
Cliente int not null,
foreign key (Cliente) references Cliente(Id_Cliente),
Total_venta float not null,
);

