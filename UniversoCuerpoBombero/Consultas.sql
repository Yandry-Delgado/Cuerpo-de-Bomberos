--Consultas
--#1 Mostrar los bomberos que pertenecen a la estacion del Centro de la ciudad de Manta.

SELECT
ESTACION_DIRECCION as direccion_estacion_central,
ESTACION_TELEFONO as telefono_estacion,
BOMBERO_ID,
BOMBERO_CI as cedula_de_bombero,
BOMBERO_NOMBRE as nombre_de_bombero,
BOMBERO_APELLIDO as apellido_de_bombero
FROM BOMBERO
INNER JOIN ESTACION ON BOMBERO.ESTACION_ID = ESTACION.ESTACION_ID
WHERE ESTACION.ESTACION_ID = '01'

--#2 Consultar las emergencias de los usuarios que ocurrieron en el sitio San Mateo.

SELECT 
USUARIO_CEDULA as cedula_usuario,
USUARIO_NOMBRE as nombre_usuario,
USUARIO_APELLIDO as apellido_usuario,
USUARIO_GENERO as genero_usuario,
USUARIO_DIRECCION as direccion_usuario,
USUARIO_TELEFONO as telefono_usuario,
USUARIO_FECHA as fecha_siniestro,
USUARIO_HORA as hora_siniestro,
EMERGENCIA_TIPO as tipo_emergencia
FROM USUARIO
INNER JOIN BOMBERO ON USUARIO.USUARIO_ID = BOMBERO.BOMBERO_ID
INNER JOIN EMERGENCIA ON USUARIO.USUARIO_ID = EMERGENCIA.USUARIO_ID
WHERE BOMBERO.ESTACION_ID = '06'

--#3 Mostar la cantidad de vehiculos y marca que tiene cada estacion del cuerpo de bomberos en la ciudad de Manta.
SELECT
ESTACION_DIRECCION as direccion_de_estacion,
VEHICULO_MARCA as marca_vehiculo,
VEHICULO_TIPO as tipo_vehiculo,
COUNT(VEHICULO_MARCA)AS CANTIDAD
FROM
PUBLIC.VEHICULO 
INNER JOIN PUBLIC.ESTACION ON ESTACION.ESTACION_ID = VEHICULO.ESTACION_ID
GROUP BY
ESTACION_DIRECCION,VEHICULO_MARCA,VEHICULO_TIPO
ORDER BY
ESTACION_DIRECCION ASC

/*#4 Consultar los bomberos que se movilizaron en el yate del cuerpo de bomberos para asistir la emergencia*/

SELECT 
VEHICULO.VEHICULO_TIPO,
VEHICULO.VEHICULO_MARCA,
VEHICULO.VEHICULO_PLACA,
BOMBERO.BOMBERO_NOMBRE,
BOMBERO.BOMBERO_APELLIDO
FROM ATIENDE
INNER JOIN BOMBERO ON ATIENDE.USUARIO_ID = ATIENDE.BOMBERO_ID
INNER JOIN VEHICULO ON BOMBERO.VEHICULO_ID = ATIENDE.BOMBERO_ID
WHERE VEHICULO.VEHICULO_MARCA = 'SUZUKI'
ORDER BY BOMBERO.BOMBERO_APELLIDO ASC

/*Consulta Adicional: Consultar la cantidad de bomberos hombres y mujeres que tiene cada sucursal en la ciudad de Manta.*/
SELECT
ESTACION_DIRECCION as diereccion_de_estacion,
BOMBERO_GENERO as genero_de_bombero,
COUNT(BOMBERO_GENERO)as CANTIDAD
FROM
PUBLIC.BOMBERO
INNER JOIN PUBLIC.ESTACION ON ESTACION.ESTACION_ID =BOMBERO.ESTACION_ID
WHERE
(BOMBERO_GENERO like '%F%') OR (BOMBERO_GENERO like '%M%')
GROUP BY
ESTACION_DIRECCION,BOMBERO_GENERO
ORDER BY
ESTACION_DIRECCION ASC
