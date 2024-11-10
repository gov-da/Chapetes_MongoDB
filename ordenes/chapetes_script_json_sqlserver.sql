-- -------------------------------------------- --
--					ORDENES						--
-- -------------------------------------------- --
select 
    O.id_orden,
    O.id_cliente,
    TiO.nombre_tipo_orden as [tipo_orden.nombre_tipo_orden],
    E.nombre as [empleados.nombre],
    C.nombre_cargo as [empleados.cargos.nombre_puesto],
    C.sueldo as [empleados.cargos.sueldo],
    E.fecha_contratacion as [empleados.fecha_contratacion],
    O.fecha,

    (
        select 
            DO.cantidad,
            DO.precio,
            P.nombre as [productos.nombre],
            Ca.nombre_categoria as [productos.categorias.nombre_categoria],
            P.descripcion as [productos.descripcion],
            P.precio as [productos.precio],
            D.nombre_disponibilidad as [productos.disponibilidad.nombre_disponibilidad],
            P.cantidad_existencia as [productos.cantidad_existencia],

            (
                select 
                    DU.id_almacen as [id_almacen],
                    DU.cantidad as [cantidad],
                    M.nombre_magnitud as [magnitudes.medicion]
                from detalle_usos DU
                join magnitudes M on M.id_magnitud = DU.id_magnitud
                where DU.id_producto = P.id_producto
                for json path
            ) as [productos.detalle_uso]
            
        from detalle_ordenes DO
        join productos P on P.id_producto = DO.id_producto
        join categorias Ca on Ca.id_categoria = P.id_categoria
        join disponibilidad D on D.id_disponibilidad = P.id_disponibilidad
        where DO.id_orden = O.id_orden
        group by DO.cantidad, DO.precio, P.nombre, Ca.nombre_categoria, 
                 P.descripcion, P.precio, D.nombre_disponibilidad, P.cantidad_existencia, P.id_producto
        for json path
    ) as detalle_ordenes,

    (
        select 
            ES.nombre_estado as [detalle_ordenes_estados.estados.nombre_estado],
            DOE.hora as [detalle_ordenes_estados.hora]
        from detalle_ordenes_estados DOE
        join estados ES on ES.id_estado = DOE.id_estado
        where DOE.id_orden = O.id_orden
        for json path
    ) as detalle_ordenes_estados

from ordenes O
join tipo_ordenes TiO on TiO.id_tipo_orden = O.id_tipo_orden
join empleados E on E.id_empleado = O.id_empleado
join cargos C on C.id_cargo = E.id_cargo
for json path;
