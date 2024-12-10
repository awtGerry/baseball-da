# Análisis de Estadísticas de MLB
## Descripción del Proyecto
Este proyecto analiza el rendimiento de equipos y jugadores de la MLB, enfocándose en la relación entre métricas avanzadas y el éxito de los equipos.

### Hipótesis de Investigación
Principal: Existe una correlación directa entre el porcentaje de bases por bolas (BB%) y la producción de carreras de un equipo.
Secundarias:

El OPS es un mejor predictor del éxito del equipo que el promedio de bateo tradicional
Los equipos con mejor WHIP tienen mayor probabilidad de llegar a playoffs

## Estructura del proyecto
```
baseball-da/
├── data/
│   ├── raw/         # Datos sin procesar
│   └── processed/   # Datos procesados y limpios
├── notebooks/
│   ├── 01_data_collection.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_analysis.ipynb
├── powerbi/         # Archivos de PowerBI
└── presentation/    # Presentación del proyecto
```

## Fuentes de Datos

- Lahman Baseball Database
- MLB Stats API
- Baseball Reference

## Variables a Analizar

### Ofensivas
BB% (Porcentaje de bases por bolas)
OPS (On-base Plus Slugging)
BA (Promedio de bateo)
Runs (Carreras anotadas)

### Pitcheo
WHIP (Walks + Hits per Inning Pitched)
ERA (Earned Run Average)
K/9 (Strikeouts por 9 innings)

## Requisitos
- Python 3.8+
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebooks
- PowerBI Desktop

`Todos los requisitos se pueden obtener por medio de nix`

# Instalacion
Clonar el repositorio
```sh
# Con nix
nix develop
# Usando pip
# NOTA: en este caso se necesita crear un ambiente virtual de Python
pip install -r requirements.txt
```

# Lineamientos del proyecto
- Crear una presentación (PowerPoint, etc) con los descubrimientos de su análisis
- Crear un tablero de PowerBI
- Opcional (Crear un notebook de python para el modelo de IA)
- Contexto del problema (hablar sobre el dominio)
- Incluir hipótesis de investigación. (Describir las variables a buscar)
- fuentes de datos (Usar al menos 2 fuentes de datos) proceso de limpieza.
- Graficas donde se representen los resultados, (usar la guía que les pase para elegir la grafica)
- (Opcional) agregar un modelo de IA
