/*2. Genera una consulta que obtenga la lista ordenada de todas las referencias sin venta*/
SELECT	* 
FROM articulo a
left join venta v
ON a.referencia=v.referencia
where v.precio is null;

/*3. Genera una consulta que obtenga las ventas comprendidas entre 2010 y 2011 (ambos incluidos), que estén asociados
 a una campaña de tipo VENTA y que sean del departamento de JOYERÍA.*/
SELECT	distinct * 
FROM articulo a
left join venta v
ON a.referencia=v.referencia
left join depto_campania d
ON d.id_dpto=a.ID_DPTO
left join campania c
ON c.id_campania=d.ID_CAMPANIA
left join departamento e
ON e.id_dpto=d.id_dpto
where c.TIPO='venta' and e.DESC_DPTO='JOYERIA' and year(v.FECHA_VENTA) between '2010' and '2012';

/* 4. Genere una consulta que cree un campo "co_ranking" que clasifique en orden ascendente las campañas según el total de venta, 
siendo 1 la campaña que más ha vendido y N la que menos. (N = Total de campañas)*/

SELECT d.id_campania, sum(v.precio) as 'co_ranking'
FROM articulo a
left join venta v
ON a.referencia=v.referencia
left join depto_campania d
on d.id_dpto=a.id_dpto
left join campania c
on c.id_campania=d.id_campania
group by c.id_campania
order by ID_CAMPANIA;

/* 5. Clasifique todas las ventas en Mayor, Igual o Menor precio respecto a la media de los precios de todas las ventas realizadas.*/
SELECT v.talon, avg(v.precio) as MEDIA,
CASE
    WHEN v.precio >  48 THEN 'Mayor'
    WHEN v.precio = 48  THEN 'Igual'
    ELSE 'Menor'
END as 'CLASIFICACION'
FROM venta v
group by v.precio
order by v.talon;

/* 7. Genere una consulta que para cada campaña de tipo "venta" obtenga el talón medio, precio medio,
 nº de referencias compradas y nº de talones con venta superior al talón medio.*/
 select c.id_campania,COUNT(v.referencia)AS 'REFERENCIA',avg(v.precio) as 'PRECIO MEDIO'
 from venta v
 left join articulo a
 on v.referencia=a.referencia
 left join depto_campania d
 on d.id_dpto=a.id_dpto
 left join campania c
 on c.id_campania=d.id_campania
 where c.tipo='VENTA'
 group by c.id_campania
 order by c.id_campania;
 
/*8. Genere una o varias consultas que devueLvan las combinaciones de familias y campañas cuya venta haya sido superior a 100€.*/
SELECT d.id_campania, sum(v.precio) as 'PRECIO'
FROM articulo a
left join venta v
ON a.referencia=v.referencia
left join depto_campania d
on d.id_dpto=a.id_dpto
left join campania c
on c.id_campania=d.id_campania
group by c.id_campania
HAVING  sum(v.precio) > 100
order by ID_CAMPANIA;

/* 9. Genere una o varias consultas que permitan catalogar los artículos vendidos y que no son de la Campaña CA1, 
según si se tratan de artículos de Ropa o Accesorios. En base a los departamentos y familias. 
NOTA: Se valorará la elaboración de la consulta y no la veracidad del propio catálogo)*/

SELECT d.id_campania, v.precio, d.ID_DPTO, f.COD_FAMILIA, f.DESC_FAMILIA, f.ID_DPTO
FROM articulo a
left join venta v
ON a.referencia=v.referencia
left join depto_campania d
on d.id_dpto=a.id_dpto
left join campania c
on c.id_campania=d.id_campania
left join familia f
on f.ID_DPTO = d.ID_DPTO
where DESC_FAMILIA != 'Anillos' and DESC_FAMILIA != 'Pulseras'
group by c.id_campania
order by ID_CAMPANIA;

