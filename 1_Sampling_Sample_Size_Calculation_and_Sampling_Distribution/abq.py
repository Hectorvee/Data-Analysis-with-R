import numpy as np
import pandas as pd
import plotly.graph_objs as go
import plotly.express as px

# Load the iris dataset
from sklearn.datasets import load_iris

iris = load_iris(as_frame=True).frame

# Systematic Random Sampling
N = len(iris)
n = 6
k = N // n  # Systematic increment
np.random.seed(1234567)  # Set seed for reproducibility
start = np.random.randint(1, k+1)  # Randomly select a starting point between 1 and 25

sys_list = [start + i * k for i in range(n)]
sys_sample = iris.iloc[sys_list]

# Import ABQ data
ABQ = pd.read_csv("ABQ.csv")

# Sort the ABQ data in path order to create the path
ABQorder = ABQ.sort_values(by="path")

# Import the coordinates of the area labels
ABQcoord = pd.read_csv("ABQcoord.csv")

# Create base plot with ABQ data
fig = go.Figure()

# Plot the map with ABQ data points
fig.add_trace(go.Scatter(
    x=ABQ['Lattitude'],
    y=ABQ['Longitude'],
    mode='markers+text',
    text=ABQ['path'],
    textposition='top center',
    marker=dict(size=6, color='black'),
    name='ABQ Locations'
))

# Add the area labels
fig.add_trace(go.Scatter(
    x=ABQcoord['Lattitude'],
    y=ABQcoord['Longitude'],
    mode='text',
    text=ABQcoord['Name'],
    textposition='bottom center',
    textfont=dict(color='blue', size=10),
    name='Area Labels'
))

# Add the path
fig.add_trace(go.Scatter(
    x=ABQorder['Lattitude'],
    y=ABQorder['Longitude'],
    mode='lines',
    line=dict(color='red'),
    name='Path'
))

# Systematic random sampling
k = len(ABQorder) // 5
ABQsys_list = [np.random.randint(1, k+1)]

# Select every kth location on the path
for i in range(1, 5):
    ABQsys_list.append(ABQsys_list[-1] + k)

ABQsys_sample = ABQorder.iloc[ABQsys_list]

# Plot the selected systematic sample points
fig.add_trace(go.Scatter(
    x=ABQsys_sample['Lattitude'],
    y=ABQsys_sample['Longitude'],
    mode='markers',
    marker=dict(size=10, color='green', symbol='circle'),
    name='Systematic Sample'
))

# Simple random sampling
ABQsrs_set = ABQorder.sample(n=5, replace=False).sort_index()

# Plot the sampled locations selected through the two different sampling methodologies
fig.add_trace(go.Scatter(
    x=ABQsrs_set['Lattitude'],
    y=ABQsrs_set['Longitude'],
    mode='markers',
    marker=dict(size=12, color='red', symbol='x'),
    name='Simple Random Sample'
))

# Show the plot
fig.update_layout(
    title="Systematic and Simple Random Sampling on ABQ Data",
    xaxis_title="Lattitude",
    yaxis_title="Longitude",
    showlegend=True
)

fig.show()
