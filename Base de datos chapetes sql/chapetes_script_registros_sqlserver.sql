-- --------------------------------------------
-- Elaborado por: Daniel Gómez Villaseñor
--				  Eduardo Ramírez Melgoza
-- Base de datos: CHAPETES
-- --------------------------------------------

-- 1. Registro en tipos_proveedores
insert into tipos_proveedores (nombre_tipo, descripcion) values
('Verduras', 'Todo tipo de verduras'),
('Desechables', 'Variedad de desechables'),
('Carnes', 'Todo tipo de carnes, frescas y congeladas'),
('Lácteos', 'Productos lácteos como'),
('Especias', 'Diversos tipos de especias');

-- 2. Registro de proveedores
insert into proveedores (nombre, telefono, calle, numero, colonia, municipio, id_tipo_proveedor) values 
('El Guero', '3531235987', 'Vicente Guerrero', 53, 'Centro', 'Sahuayo', 1),
('La cosecha del tío Pepe', '3539876543', 'Aldama', 3, 'Centro', 'Sahuayo', 2),
('Frutas y Verduras del Valle', '3531234567', 'Juarez', 35, 'Centro', 'Sahuayo', 1),
('Carnicería el Pachiche', '3537654321', 'Don Bosco', 157, 'El Rincón', 'Sahuayo', 3),
('Lácteos La Esperanza', '3531122334', 'Bolivar', 152, 'Centro', 'Sahuayo', 4),
('Abarrotera la Comercial', '3539988776', 'Michoacán', 282, 'Las Brisas', 'Sahuayo', 5),
('Productos Naturales', '3532233445', 'Constitución', 147, 'Centro', 'Sahuayo', 1),
('Delicias Gourmet', '3533344556', 'Monterde', 13, 'Valle Verde', 'Sahuayo', 2),
('Comercializadora El Buen Sabor', '3534455667', 'Insurgentes', 99, 'Centro', 'Sahuayo', 3),
('Alimentos Sanos', '3535566778', 'Emiliano Zapata', 224, 'Centro', 'Sahuayo', 4);

-- 3. Registro de magnitudes
insert into magnitudes (nombre_magnitud) values 
('Kilogramo'),
('Gramo'),
('Litro'),
('Mililitro'),
('Pieza'),
('Paquetes');

-- 4. Registro de categoria_almacen
insert into categoria_almacen (nombre_categoria) values
('Verduras'),
('Desechables'),
('Carnes'),
('Lácteos'),
('Especias');

-- 5. Registros de almacen
INSERT INTO almacen (id_magnitud, cantidad, nombre_insumo, id_categoria_almacen) VALUES
(1, 50, 'Tortillas', 1),
(1, 15, 'Carne de res', 3),
(1, 5, 'Carne de cerdo', 3),
(1, 20, 'Cebollas', 1),
(1, 6, 'Jitomate', 1),
(1, 12, 'Tomate', 1),
(1, 12, 'Aguacate', 1),
(1, 3, 'Queso asadero', 4),
(1, 5, 'Limones', 1),
(5, 5, 'Platos desechables', 1),
(1, 2, 'bolsa chica', 1);

-- 6. Registros de detalle_compras
insert into detalle_compras (id_almacen, id_proveedor, id_magnitud, cantidad, precio) values
(1, 1, 1, 8, 25.00),
(1, 2, 1, 2, 25.00),
(2, 4, 1, 3, 125.00),
(3, 4, 1, 1, 100.00),
(4, 10, 1, 12, 15.00),
(4, 3, 1, 4, 14.00),
(5, 3, 1, 5, 12.00),
(6, 10, 1, 4, 15.00),
(7, 3, 1, 6, 30.00),
(7, 7, 5, 4, 30.00),
(8, 9, 5, 4, 80.00),
(8, 10, 1, 10, 85.00),
(8, 8, 1, 7, 82.00),
(9, 7, 1, 3, 20.00),
(9, 3, 1, 4, 21.00),
(9, 10, 1, 4, 20.00),
(10, 6, 1, 8, 48.00),
(10, 6, 1, 4, 49.00),
(11, 9, 1, 5, 32.00),
(11, 9, 1, 7, 30.00);

-- 7. Registros de disponibilidad
insert into disponibilidad (nombre_disponibilidad) values 
('Disponible'),
('Agotado');

-- 8. Registros de categorías
insert into categorias (nombre_categoria) values
('Comida'),
('Bebida'),
('Extras');

-- 9. Registros de productos
insert into productos (id_categoria, id_disponibilidad, nombre, descripcion, precio, cantidad_existencia) values 
(1, 1, 'Taco al Barbacoa', 'Taco de carne de res cocida a fuego lento con salsa', 15.00, 200),
(1, 1, 'Taco de Adobada', 'Taco de cerdo marinado en adobo y asado', 15.00, 50),
(1, 1, 'Burrito de Barbacoa', 'Burrito con carne de res deshebrada y salsa', 55.00, 20),
(1, 1, 'Burrito de Adobada', 'Burrito de cerdo marinado en adobo', 55.00, 20),
(1, 1, 'Quesadilla de Barbacoa', 'Quesadilla con queso y carne de res', 45.00, 20),
(1, 1, 'Quesadilla de Adobada', 'Quesadilla con queso y cerdo adobado', 45.00, 20),
(1, 1, 'Orden de Barbacoa', 'Porción de carne de res cocida a fuego lento', 90.00, 10),
(1, 1, 'Orden de Adobada', 'Porción de cerdo marinado en adobo', 85.00, 10),
(2, 1, 'Coca-Cola Chica', 'Refresco de cola en presentación pequeña', 20.00, 25),
(2, 1, 'Agua de Horchata', 'Bebida dulce de arroz con canela', 25.00, 20);

-- 10. Registros de detalle_almacen_producto
insert into detalle_usos (id_almacen, id_producto, cantidad, id_magnitud) values
(1, 17, 1, 1),
(1, 18, 2, 2),
(2, 18, 1, 1),
(2, 17, 2, 3),
(3, 20, 3, 2),
(3, 21, 4, 1),
(4, 22, 1, 1),
(4, 23, 2, 2),
(5, 23, 5, 3),
(5, 24, 4, 1),
(1, 24, 1, 2),
(2, 24, 2, 3),
(3, 24, 1, 1),
(4, 17, 5, 2),
(5, 17, 6, 1),
(1, 20, 1, 3),
(2, 20, 1, 1),
(3, 21, 2, 2),
(4, 22, 2, 1),
(5, 22, 3, 3);

select * from productos

-- 11. Registro de cargos
insert into cargos (nombre_cargo, sueldo) values 
('Mesero', 250.00),
('Repartidor', 250.00),
('Caja', 300.00),
('Plancha', 400.00);

-- 12. Registros de empleados
insert into empleados (nombre, fecha_contratacion, id_cargo) values 
('Juan Pérez Gómez', '2023-01-15', 1),
('María López Hernández', '2023-02-20', 2),
('Carlos Martínez Rodríguez', '2023-03-05', 3),
('Laura Sánchez Pérez', '2023-04-10', 4),
('Ana García López', '2023-05-12', 1),
('José Ramírez Sánchez', '2023-06-15', 2),
('Elena Torres Jiménez', '2023-07-20', 3),
('Luis Herrera Morales', '2023-08-25', 4),
('Sofía Fernández Ruiz', '2023-09-10', 1),
('Pedro González Castillo', '2023-10-05', 2);

-- 13. Registro domicilios
insert into domicilios (calle, num_casa, colonia, referencia) values 
('Av. Juárez', 101, 'Centro', 'Cerca de la plaza principal'),
('Calle Reforma', 215, 'Nochebuena', 'Entre la tienda y la farmacia'),
('Calle Madero', 123, 'Jardines', 'Frente al parque'),
('Calle Independencia', 47, 'Las Flores', 'Cerca de la escuela'),
('Calle Morelos', 30, 'Santa Fe', 'A un lado de la iglesia'),
('Calle 16 de Septiembre', 78, 'El Olmo', 'Callejón del Olmo'),
('Calle 5 de Febrero', 89, 'Las Palmas', 'En el tercer piso'),
('Calle del Bosque', 12, 'La Esperanza', 'Cerca del supermercado'),
('Calle Hidalgo', 65, 'Los Árboles', 'Frente a la gasolinera'),
('Calle Miguel Hidalgo', 22, 'Valle Verde', 'Al lado de la tienda de abarrotes');

-- 14. Registro de clientes
insert into clientes (id_domicilio, nombre, numero_celular) values 
(1, 'Juan Pérez Gómez', '3531234567'),
(2, 'María López Hernández', '3532345678'),
(3, 'Carlos Martínez Rodríguez', '3533456789'),
(4, 'Laura Sánchez Pérez', '3534567890'),
(5, 'Ana García López', '3535678901'),
(6, 'José Ramírez Sánchez', '3536789012'),
(7, 'Elena Torres Jiménez', '3537890123'),
(8, 'Luis Herrera Morales', '3538901234'),
(9, 'Sofía Fernández Ruiz', '3539012345'),
(10, 'Pedro González Castillo', '3530123456');

-- 15. Registro de estados_ordenes
insert into estados (nombre_estado) values 
('Pedido recibido'),
('En preparación'),
('Listo para servir'),
('En entrega'),
('Entregado'),
('Cancelado'),
('Finalizado');

-- 16. Regsitos de tipo_ordenes
insert into tipo_ordenes (id_tipo_orden, nombre_tipo_orden) values
(1,'Local'),
(2, 'Domicilio')

-- 17. Registros de ordenes
insert into ordenes (id_cliente, id_tipo_orden, id_empleado, fecha, id_estado) values 
(2, 1, 1, '2024-10-01', 7),
(3, 2, 2, '2024-10-01', 7),
(4, 2, 6, '2024-10-01', 6),
(5, 1, 5, '2024-10-01', 7),
(6, 2, 9, '2024-10-01', 4),
(7, 1, 10, '2024-10-01', 4),
(8, 2, 2, '2024-10-01', 2),
(9, 1, 1, '2024-10-01', 2),
(10, 1, 5, '2024-10-01', 1),
(11, 2, 9, '2024-10-01', 1);

-- 18. Registros de detalle_ordenes_productos
insert into detalle_ordenes(id_orden, id_producto, cantidad, precio) values 
(11, 17, 2, 15.00),
(11, 19, 1, 55.00),
(12, 18, 3, 15.00),
(12, 20, 2, 55.00),
(12, 25, 1, 20.00),
(3, 26, 1, 25.00),
(3, 23, 1, 90.00),
(4, 24, 1, 85.00),
(4, 25, 1, 20.00),
(5, 26, 1, 25.00),
(5, 17, 3, 15.00),
(6, 18, 2, 15.00),
(6, 19, 1, 55.00),
(6, 20, 2, 55.00),
(6, 20, 1, 20.00),
(7, 26, 2, 25.00),
(7, 23, 1, 90.00),
(8, 24, 1, 85.00),
(8, 25, 1, 20.00),
(9, 26, 1, 25.00),
(9, 17, 2, 15.00),
(10, 18, 1, 15.00);

-- 19. Registros de detalle_ordenes_estados
insert into detalle_ordenes_estados(id_orden, id_estado, hora) values
(3, 1, getdate()),
(3, 2, getdate()),
(3, 3, getdate()),
(3, 4, getdate()),
(3, 5, getdate()),
(3, 6, getdate()),
(3, 7, getdate()),
(4, 1, getdate()),
(4, 2, getdate()),
(4, 3, getdate()),
(4, 4, getdate()),
(4, 5, getdate()),
(5, 1, getdate()),
(6, 1, getdate()),
(7, 1, getdate()),
(8, 1, getdate()),
(9, 1, getdate()),
(10, 1, getdate()),
(11, 1, getdate()),
(12, 1, getdate())
