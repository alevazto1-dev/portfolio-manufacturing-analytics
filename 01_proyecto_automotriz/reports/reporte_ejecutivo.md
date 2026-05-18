# Reporte Ejecutivo — Análisis de Manufactura Automotriz

**Fecha:** mayo 2026  
**Analista:** Alejandro Vázquez  
**Planta:** Tier 1 — Estampado, Soldadura y Ensamble

---

## 1. Contexto

Planta Tier 1 que produce componentes estructurales para OEMs 
(GM, Ford, Stellantis, Toyota, Nissan). El análisis cubre 24 meses 
(mayo 2024 – abril 2026) usando 11 tablas relacionadas del sistema 
de producción: 12,256 registros de producción por turno, paros, 
defectos, mantenimiento e inspecciones de calidad.

---

## 2. Hallazgos clave

- **OEE global: 90.81%** — por encima del benchmark world-class (85%).
- **M03** es la única máquina por debajo del promedio de planta, 
  con OEE de 89.2% y los tres componentes degradados.
- **Turno nocturno T03** tiene el mayor scrap rate (2.75%), 
  un 57% superior al vespertino T02 (1.75%).
- **Operadores JR** generan entre 2.72% y 4.17% de scrap vs 
  0.90%–1.08% de operadores MASTER — diferencia de hasta 3.6x.
- **OP012 Diego Morales (JR)** es el operador con peor desempeño 
  individual: 4.17% de scrap rate.
- **SKU-AUTO-007 en M03 y M04** presenta Cpk crítico (0.64-0.65), 
  indicando proceso gravemente incapaz. M03 acumula OEE bajo 
  y Cpk crítico — requiere intervención inmediata.
---

## 3. Análisis de causa raíz — Turno nocturno T03

Se investigaron 4 hipótesis para explicar el scrap alto de T03:

- (X) T03 tiene más operadores JR → falso (T01 tiene más proporción).
- (X) T03 fabrica SKUs más complejos → falso (distribución similar entre turnos).
- (X) Los JR de T03 tienen menos antigüedad → falso (T01 tiene JRs más nuevos).
- (X) Ciertas máquinas causan el problema → falso (todas las máquinas 
  siguen el mismo patrón: T03 siempre peor, T02 siempre mejor).

**Conclusión:** la causa es sistémica del turno nocturno. No es 
atribuible a operadores, máquinas ni productos específicos. Los factores 
probables (condiciones ambientales, supervisión, fatiga, procedimientos) 
no están capturados en el dataset actual y requieren investigación 
directa en planta.

---

## 4. Recomendaciones

**R1. Programa de capacitación para operadores JR**  
Los JR generan hasta 3.6x más scrap que los MASTER. Se recomienda 
plan de capacitación para los 9 operadores JR, priorizando a 
OP012 Diego Morales (4.17% scrap). Impacto esperado: reducir 
scrap JR a niveles SR (~1.65%).

**R2. Mantenimiento correctivo en M03**  
M03 presenta el OEE más bajo con los tres componentes degradados. 
Se recomienda inspección técnica y plan correctivo antes de que 
el deterioro afecte producción de forma crítica.

**R3. Auditoría del turno nocturno T03**  
Con causa raíz no identificada en datos, se requiere investigación 
directa en planta: condiciones ambientales, procedimientos nocturnos 
y nivel de supervisión.

**R4. Intervención inmediata en M03 × SKU-AUTO-007**
Cpk = 0.649 indica proceso gravemente incapaz. Revisar herramental,
recalibrar la máquina y realizar análisis de causa raíz específico
para esta combinación máquina-producto.
---

## 5. Próximos pasos

- Calcular **Cpk y SPC** por producto y máquina usando datos 
  de inspección de calidad disponibles.
- Calcular **MTBF y MTTR** de M03 para cuantificar deterioro 
  y estimar momento óptimo de intervención.
- Obtener datos adicionales de planta para cerrar hipótesis 
  pendientes de T03 (temperatura, humedad, supervisión por turno).
- Construir **dashboard interactivo** en Power BI o Tableau 
  para monitoreo en tiempo real de OEE, scrap y operadores.

---

*Análisis basado en dataset sintético generado a partir de 
experiencia operativa en manufactura automotriz y farmacéutica.*