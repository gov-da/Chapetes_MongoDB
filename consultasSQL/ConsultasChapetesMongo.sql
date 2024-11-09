--almacen
use chapetes2;

select 
    id_almacen as id_almacen,
    cantidad as cantidad,
    (select 
         nombre_magnitud as medicion
     from magnitudes 
     where magnitudes.id_magnitud = almacen.id_magnitud
    ) as magnitudes,
    (select 
         nombre_categoria as nombre_categoria
     from categoria_almacen 
     where categoria_almacen.id_categoria_almacen = almacen.id_categoria_almacen
    ) as categoria_almacen,
    (select 
         id_uso as id_detalle_uso
     from detalle_usos
     where detalle_usos.id_almacen = almacen.id_almacen
     for json path, without_array_wrapper
    ) as id_detalle_uso
from almacen
for json path, root('almacen');

--clientes
select 
    c.id_cliente,
    c.nombre,
    c.numero_celular as num_cel,
    (
        select 
            d.id_domicilio,
            d.calle,
            d.num_casa,
            d.colonia,
            d.referencia
        from domicilios d
        where d.id_domicilio = c.id_domicilio
        for json path
    ) as detalle_domicilios
from clientes c
for json path;

--detalle_compras
select 
    dc.id_detalle_compra,
    dc.id_almacen,
    dc.cantidad,
    dc.precio,
    ( 
        select 
            m.id_magnitud,
            m.nombre_magnitud as medicion
        for json path
    ) as magnitudes,
    ( 
        select 
            p.nombre as nombre_proveedor,
            p.telefono,
            -- Ahora tipo_proveedor es un objeto con los campos nombre_tipo y descripcion
            json_query('{"nombre_tipo": "' + tp.nombre_tipo + '", "descripcion": "' + tp.descripcion + '"}') as tipo_proveedor,
            -- Domicilio como objeto JSON
            json_query('{"calle": "' + p.calle + '", "numero": "' + cast(p.numero as varchar) + '", "colonia": "' + p.colonia + '", "municipio": "' + p.municipio + '"}') as domicilio
        for json path
    ) as proveedor
from 
    detalle_compras dc
join 
    proveedores p on dc.id_proveedor = p.id_proveedor
join 
    tipos_proveedores tp on p.id_tipo_proveedor = tp.id_tipo_proveedor
join 
    magnitudes m on dc.id_magnitud = m.id_magnitud
join 
    almacen a on dc.id_almacen = a.id_almacen
for json path;



