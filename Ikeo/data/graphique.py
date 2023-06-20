import matplotlib.pyplot as plt
import streamlit as st
import data.data as dd
import data.queries as dq
import numpy as np

def graph1():
    # Obtenir les données à partir du module data en utilisant query9
    df = dd.get_data(dq.query9)
    
    # Trier les données par 'Quantité commandée'
    df = df.sort_values('Quantité commandée')
    
    # Créer une figure et des axes
    fig, ax = plt.subplots(figsize=[20, 8])
    
    # Extraire les colonnes de données requises
    qte_produit = df['Quantité commandée']
    nom_produits = df['nom']
    
    # Définir les couleurs des barres
    bar_colors = ["tab:red", "tab:blue", "tab:green", "tab:red", "tab:blue", "tab:green", "tab:red", "tab:blue", "tab:green"]
    
    # Créer un diagramme à barres
    ax.bar(nom_produits, qte_produit, color=bar_colors)
    
    # Définir le titre du graphique et les étiquettes des axes
    ax.set_title("Histogramme des commandes")
    ax.set_ylabel("quantité")
    ax.set_xlabel("nom des produits")
    
    # Afficher le graphique en utilisant Streamlit
    st.pyplot(fig)

def graph2():
    # Obtenir les données à partir du module data en utilisant queryst4
    df = dd.get_data(dq.queryst4)
    
    # Trier les données par 'Quantité commandée'
    df = df.sort_values('Quantité commandée')
    
    # Créer une figure et des axes
    fig, ax = plt.subplots(figsize=[25, 8])
    
    # Extraire les colonnes de données requises
    qte_produits = df['Quantité commandée']
    usine = df['raison_sociale'] + " " + df['ville_c']
    
    # Définir les couleurs des barres
    bar_colors = ["tab:red", "tab:gray", "tab:blue", "tab:green", "tab:purple", "tab:orange"]
    
    # Créer un diagramme à barres
    ax.bar(usine, qte_produits, color=bar_colors)
    
    # Définir le titre du graphique et les étiquettes des axes
    ax.set_title("Commandes par client :")
    ax.set_ylabel('Client')
    ax.set_xlabel('Quantité commandée')
    
    # Afficher le graphique en utilisant Streamlit
    st.pyplot(fig)
