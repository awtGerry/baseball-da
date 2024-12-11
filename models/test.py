import pandas as pd
import joblib
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Cargar el modelo y el escalador previamente guardados
rf_model = joblib.load('../models/playoffs_predictor.joblib')
scaler = joblib.load('../models/scaler.joblib')

# Definir los features que el modelo espera
features = ['R/G', 'OPS', 'BB%', 'ISO', 'WHIP', 'ERA', 'K/9', 'DER']

# Función para hacer predicciones con nuevos datos
def predict_playoffs(team_stats):
    """
    Hace predicción de playoffs para nuevos datos de equipo.
    
    Parameters:
    team_stats (dict): Diccionario con estadísticas del equipo
    
    Returns:
    tuple: (predicción, probabilidades)
    """
    # Crear DataFrame con los stats del equipo
    team_df = pd.DataFrame([team_stats])
    
    # Escalar los datos
    team_scaled = scaler.transform(team_df[features])
    
    # Hacer predicción
    prediction = rf_model.predict(team_scaled)
    probabilities = rf_model.predict_proba(team_scaled)
    
    return prediction[0], probabilities[0]

# Ejemplo de uso con un equipo ficticio
example_team = {
    'R/G': 5.2,    # Runs per game
    'OPS': .780,   # On-base Plus Slugging
    'BB%': 9.5,    # Walk percentage
    'ISO': .180,   # Isolated Power
    'WHIP': 1.25,  # Walks and Hits per Inning Pitched
    'ERA': 3.80,   # Earned Run Average
    'K/9': 9.2,    # Strikeouts per 9 innings
    'DER': .700    # Defensive Efficiency Ratio
}

prediction, probabilities = predict_playoffs(example_team)
print("\nPredicción para equipo ejemplo:")
print(f"¿Llegará a playoffs?: {'Sí' if prediction else 'No'}")
print(f"Probabilidad de playoffs: {probabilities[1]:.2%}")
print(f"Probabilidad de no playoffs: {probabilities[0]:.2%}")

# Visualizar la probabilidad en un gráfico de barras
labels = ['No Playoffs', 'Playoffs']
plt.bar(labels, probabilities, color=['red', 'green'])
plt.title('Probabilidades de Clasificación a Playoffs')
plt.ylabel('Probabilidad')
plt.show()
