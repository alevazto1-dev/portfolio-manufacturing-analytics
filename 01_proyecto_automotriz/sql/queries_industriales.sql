-- Produccion total por maquina
SELECT p.id_maquina, 
SUM(p.piezas_producidas) AS total_piezas
FROM fact_produccion p
GROUP BY p.id_maquina
ORDER BY total_piezas DESC;
-- Top 5 operadores con Peor SCRAP RATE
SELECT p.id_operador, o.nombre_operador,
SUM(p.piezas_producidas),
SUM(p.piezas_defectuosas ),
ROUND(SUM(p.piezas_defectuosas) / SUM(piezas_producidas)*100, 2) AS scrap_rate
FROM fact_produccion p
JOIN dim_operadores o
ON p.id_operador = o.id_operador
GROUP BY p.id_operador, o.nombre_operador
ORDER BY scrap_rate DESC
LIMIT 5;
-- OEE por turno
SELECT id_turno, 
ROUND(AVG(tiempo_operativo_min / tiempo_planeado_min) * 100, 2) AS disponibilidad,
ROUND(AVG(LEAST(piezas_producidas / piezas_planeadas, 1.0)) * 100, 2) AS rendimiento,
ROUND(AVG(piezas_buenas / piezas_producidas) * 100, 2) AS calidad,
ROUND(
AVG(tiempo_operativo_min / tiempo_planeado_min) * 
AVG(LEAST(piezas_producidas / piezas_planeadas, 1.0)) * 
AVG(piezas_buenas / piezas_producidas) * 100, 
2) AS oee
FROM fact_produccion
GROUP BY id_turno
ORDER BY oee DESC;

-- Ranking de operadores por scrap rate dentro de cada turno
SELECT p.id_turno, 
o.nombre_operador,
o.nivel_certificacion,
ROUND(SUM(p.piezas_defectuosas) / SUM(p.piezas_producidas) * 100, 2) AS scrap_rate,
RANK() OVER (
PARTITION BY p.id_turno
ORDER BY SUM(p.piezas_defectuosas) / SUM(p.piezas_producidas) DESC
) AS ranking_en_turno
FROM fact_produccion p
JOIN dim_operadores o
ON p.id_operador = o.id_operador
GROUP BY p.id_turno, o.nombre_operador, o.nivel_certificacion
ORDER BY p.id_turno, ranking_en_turno
LIMIT 10;
-- Tendencia mensual de scrap con comparacion vs mes anterior
WITH scrap_mensual AS (
SELECT 
DATE_FORMAT(fecha, '%Y-%m') AS año_mes,
ROUND(SUM(piezas_defectuosas) / SUM(piezas_producidas) * 100, 2) AS scrap_rate
FROM fact_produccion
WHERE fecha < '2026-05-01'
GROUP BY DATE_FORMAT(fecha, '%Y-%m')
ORDER BY año_mes
)
SELECT 
año_mes,
scrap_rate,
LAG(scrap_rate) OVER (ORDER BY año_mes) AS scrap_mes_anterior,
ROUND(scrap_rate - LAG(scrap_rate) OVER (ORDER BY año_mes), 2) AS diferencia
FROM scrap_mensual
ORDER BY año_mes
LIMIT 10;