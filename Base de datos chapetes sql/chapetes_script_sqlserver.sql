-- --------------------------------------------
-- Base de datos: CHAPETES
-- Elaborado por: Daniel Gómez Villaseñor
--				  Eduardo Ramírez Melgoza
-- --------------------------------------------
-- Crear la base de datos chapetes
create database chapetes;

use chapetes;

-- Tabla tipo_proveedores
create table tipos_proveedores (
    id_tipo_proveedor integer not null identity(1,1),
    nombre_tipo varchar(20) not null,
    descripcion varchar(150) not null,
    primary key (id_tipo_proveedor)
);

-- Tabla Proveedores
create table proveedores(
    id_proveedor integer not null identity(1,1),
    nombre varchar(100) not null,
    telefono varchar(10) not null,
    calle varchar(50) not null,
	numero integer not null,
	colonia varchar(30) not null,
	municipio varchar(30) not null,
    id_tipo_proveedor integer not null,
    primary key(id_proveedor),
    foreign key (id_tipo_proveedor) references tipos_proveedores (id_tipo_proveedor)
);

-- Tabla magnitudes
create table magnitudes(
    id_magnitud integer not null identity(1,1),
    nombre_magnitud varchar(15) not null,
    primary key (id_magnitud)
);

-- Tabla categoria_almacen
create table categoria_almacen(
    id_categoria_almacen integer not null identity(1,1),
    nombre_categoria varchar(30),
    primary key (id_categoria_almacen)
);

-- Tabla almacen
create table almacen (
    id_almacen integer not null identity(1,1),
    id_magnitud integer not null,
    cantidad integer not null,
    nombre_insumo varchar(50) not null,
    id_categoria_almacen integer not null,
    primary key(id_almacen),
    foreign key(id_magnitud) references magnitudes (id_magnitud),
	foreign key(id_categoria_almacen) references categoria_almacen (id_categoria_almacen)
);

-- Tabla detalle_compras
create table detalle_compras(
    id_detalle_compra integer not null identity(1,1),
    id_almacen integer not null,
    id_proveedor integer not null,
    id_magnitud integer not null,
	cantidad integer not null,
    precio float,
    primary key (id_detalle_compra),
    foreign key (id_proveedor) references proveedores (id_proveedor),
    foreign key (id_almacen) references almacen (id_almacen),
    foreign key (id_magnitud) references magnitudes (id_magnitud)
);

-- Tabla domicilios
create table domicilios(
    id_domicilio integer not null identity(1,1),
    calle varchar(60) not null,
	num_casa integer not null,
    colonia varchar(25) not null,
    referencia varchar(150),
    primary key (id_domicilio)
);

-- Tabla clientes
create table clientes(
    id_cliente integer not null identity(1,1),
	id_domicilio integer not null,
    nombre varchar(60) not null,
	numero_celular varchar(10) not null,
    primary key(id_cliente),
	Foreign key (id_domicilio) references domicilios (id_domicilio)
);

-- Tabla cargos
create table cargos(
    id_cargo integer not null identity(1,1),
    nombre_cargo varchar(15) not null,
    sueldo float,
    primary key (id_cargo)
);

-- Tabla empleados
create table empleados(
    id_empleado integer not null identity(1,1),
    nombre varchar(60) not null,
    fecha_contratacion date,
    id_cargo integer not null,
    primary key(id_empleado),
    foreign key (id_cargo) references cargos (id_cargo)
);

-- Tabla estados
create table estados(
    id_estado integer not null identity(1,1),
    nombre_estado varchar(25) not null,
    primary key (id_estado)
);

-- Tabla tipo_ordenes
create table tipo_ordenes(
	id_tipo_orden integer not null identity(1, 1),
	nombre_tipo_orden varchar(25) not null,
	 primary key (id_tipo_orden)
);

-- Tabla ordenes
create table ordenes(
    id_orden integer not null identity(1,1),
    id_cliente integer not null,
	id_tipo_orden integer not null,
    id_empleado integer not null,
    fecha date,
    id_estado integer not null,
    primary key (id_orden),
    foreign key (id_cliente) references clientes (id_cliente),
	foreign key (id_tipo_orden) references tipo_ordenes (id_tipo_orden),
    foreign key (id_empleado) references empleados (id_empleado)
);

-- Tabla detalle ordenes estados
create table detalle_ordenes_estados(
	id_orden_estado integer not null identity(1,1),
	id_orden integer not null,
	id_estado integer not null,
	hora time not null,
	primary key (id_orden_estado),
	foreign key (id_orden) references ordenes (id_orden),
	foreign key (id_estado) references estados (id_estado)
);

-- Tabla disponibilidad
create table disponibilidad(
    id_disponibilidad integer not null identity(1,1),
    nombre_disponibilidad varchar(15) not null,
    primary key (id_disponibilidad)
);

-- Tabla categorias
create table categorias(
    id_categoria integer not null identity(1,1),
    nombre_categoria varchar(15) not null,
    primary key (id_categoria)
);

-- Tabla productos
create table productos(
    id_producto integer not null identity(1,1),
	id_categoria integer not null,
    id_disponibilidad integer not null,
    nombre varchar(50) not null,
    descripcion varchar(100),
    precio float,
	cantidad_existencia integer not null,
    primary key(id_producto),
    foreign key (id_categoria) references categorias (id_categoria),
    foreign key (id_disponibilidad) references disponibilidad (id_disponibilidad)
);

-- Tabla detalle_ordenes
create table detalle_ordenes(
    id_orden_producto integer not null identity(1,1),
    id_orden integer not null,
    id_producto integer not null,
    cantidad integer not null,
    precio float not null,
    primary key (id_orden_producto),
    foreign key (id_orden) references ordenes (id_orden),
    foreign key (id_producto) references productos (id_producto)
);

-- Tabla detalle_usos
create table detalle_usos(
    id_uso integer not null identity(1,1),
    id_almacen integer not null,
    id_producto integer not null,
	cantidad integer not null,
	id_magnitud integer not null,
    primary key(id_uso),
    foreign key (id_producto) references productos (id_producto),
    foreign key (id_almacen) references almacen (id_almacen),
	foreign key (id_magnitud) references magnitudes (id_magnitud)
);
