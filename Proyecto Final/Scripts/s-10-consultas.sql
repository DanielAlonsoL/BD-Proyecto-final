--@Autor: Alonso Lopez Daniel
--		  Marcelino Cisneros Eduardo
--@Fecha creación: 04/12/2019
--@Descripción: Creación de usuario proyecto final
--				se utilizo sql dinamico para la creacion de roles y usuarios

--La farmacia premiara a los clientes mas fieles y por ello
--necesita conecer su nombre, apellidos y numero telefonico de
--aquellos con 3 años o mas haciendo pedidos
select c.nombre, c.ap_paterno, c.ap_materno, num_telefono
from cliente c
natural join pedido p
join historico_status_pedido hs
using(pedido_id)
join (select pedido_id, min(hs.fecha_status)
		from historico_status_pedido hs
		group by pedido_id
		having (sysdate - min(hs.fecha_status))/365 >= 3 ) q
using (pedido_id)
group by c.nombre, c.ap_paterno, c.ap_materno, num_telefono;

--Hay un nuevo distribuidor en la ciudad y se quiere saber cuanto
--pagara 100 unidades de cada uno de los nuevos medicamentos
--y asi saber si cuentan con el presupuesto y bajar el pedido
select nombre_medicamento, sum(precio_unitario)*100
from medicamento_ext
group by nombre_medicamento;


--Un cliente desea saber cuales son los medicamentos para la
--tos que no contienen paracetamol por que no confia en esa
--sustancia activa asi como el id la farmacia que lo tiene
select fm.centro_operaciones_id, fm.medicamento_id, q.sustancia_activa
from farmacia_medicamento fm
join(select medicamento_id, sustancia_activa
	from medicamento 
	minus
	select medicamento_id, sustancia_activa
	from medicamento
	where sustancia_activa = 'paracetamol') q
on fm.medicamento_id = q.medicamento_id;


--Una vez que observo los medicamentos quiere saber si es 
--que en que sucursal hay clamoxin y si cuentan
--con mas de 25 unidades ya que planea llevarlas
--a una zona de escasos recursos
--(VISTA)
select nombre_medicamento, cantidad, centro_operaciones_id
from medicamento_disponible
where cantidad >= 25
and nombre_medicamento = 'clamoxin';


