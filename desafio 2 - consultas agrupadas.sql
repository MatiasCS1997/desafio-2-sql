¿Cuántos registros hay?
SELECT COUNT(*) AS "Registros" FROM inscritos;

¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) FROM inscritos;

¿Cuál o cuáles son los registros de mayor antigüedad?

SELECT fecha, cantidad, fuente
    FROM inscritos
    WHERE fecha = (
        SELECT MIN(fecha)  FROM inscritos
        );

¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante)

SELECT fecha,SUM(cantidad) FROM inscritos 
GROUP BY fecha ORDER BY fecha asc;

¿Cuántos inscritos hay por fuente?

SELECT SUM(cantidad) AS "Cantidad de Inscritos", fuente FROM inscritos GROUP BY fuente;

¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día?

SELECT fecha, SUM(cantidad) AS "cantidad de inscritos", fecha FROM inscritos GROUP BY fecha ORDER BY "cantidad de inscritos" DESC LIMIT 1;

¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas
personas fueron?

SELECT SUM(cantidad) AS suma, fecha, fuente FROM inscritos WHERE fuente = 'Blog' GROUP BY fuente, fecha ORDER BY suma DESC LIMIT 1;

¿Cuántas personas en promedio se inscriben en un día?

SELECT avg(cantidad) FROM (SELECT fecha, SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha) AS tabla;

¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) AS amount FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;

¿Cuántas personas se registraron en promedio cada día a partir del tercer día?

SELECT AVG(promedio) FROM (SELECT fecha, SUM(cantidad) AS promedio FROM inscritos WHERE fecha >= '2021-01-03' GROUP BY fecha) AS promedio_dia;