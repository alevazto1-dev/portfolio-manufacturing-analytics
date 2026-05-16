# Análisis de Manufactura Automotriz — Planta Tier 1

Análisis exploratorio de 24 meses de operación de una planta Tier 1 
que produce componentes estructurales para OEMs. Identifica patrones 
de scrap, OEE y desempeño de operadores para apoyar decisiones 
de manufactura.

---

## Contexto de negocio

Una planta automotriz Tier 1 necesita entender qué factores explican 
su scrap rate y si su OEE es competitivo. El análisis responde:

- ¿Cuál es el OEE real de la planta y cómo varía entre máquinas?
- ¿Qué turno tiene más scrap y por qué?
- ¿El nivel de certificación del operador predice la calidad?
- ¿Hay máquinas con problemas específicos de desempeño?

---

## Dataset

- **Fuente:** dataset sintético generado a partir de experiencia 
  operativa en manufactura automotriz y farmacéutica.
- **Volumen:** ~72,000 registros en 11 tablas relacionadas.
- **Periodo:** mayo 2024 – mayo 2026 (24 meses).
- **Tabla principal:** `fact_produccion` (12,256 registros).
- **Tablas relacionadas:** paros, defectos, mantenimiento, 
  inspección de calidad, operadores, máquinas, productos, 
  turnos, materia prima, proveedores.

---

## Metodología

1. **EDA** — exploración inicial de estructura, tipos y calidad de datos.
2. **Análisis mensual** — producción y tendencia de OEE en el tiempo.
3. **Análisis por máquina** — OEE y scrap rate comparativo.
4. **Análisis por turno** — identificación de T03 como outlier.
5. **JOIN con operadores** — cruce de producción con nivel de certificación.
6. **Investigación de causa raíz** — método Ishikawa, 4 hipótesis probadas.
7. **Cálculo de OEE** — desagregado por máquina y turno con corrección de rendimiento.
8. **Visualizaciones** — tendencia mensual y comparación por máquina.

---

## Hallazgos principales

- OEE global: **90.81%** (world-class, benchmark >85%).
- M03 tiene el OEE más bajo (**~90.85%**) con los tres componentes degradados.
- Turno nocturno T03 genera **57% más scrap** que el vespertino T02.
- Operadores MASTER producen **3.6x menos scrap** que operadores JR.
- La causa del scrap alto en T03 es **sistémica del turno** — 
  no atribuible a máquinas, operadores ni productos específicos.

---

## Cómo correr el código

### Requisitos
- Python 3.12+
- Librerías: ver `requirements.txt`

### Instalación

```bash
git clone https://github.com/alevazto1-dev/portfolio-manufacturing-analytics.git
cd portfolio-manufacturing-analytics
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Ejecutar el análisis

1. Descomprimir `Automotriz_Portfolio_Data.zip` en `01_proyecto_automotriz/data/raw/`.
2. Abrir `01_proyecto_automotriz/notebooks/01_exploracion_inicial.ipynb`.
3. Seleccionar el kernel del entorno virtual.
4. Ejecutar **Run All**.

---

## Estructura del proyecto