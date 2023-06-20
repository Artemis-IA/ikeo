import streamlit as st

st.header("Dictionnaire des données : ")
ddonnee=["ID du site","nom du site","adresse du site","ville du site","ID du client","type de client","raison sociale du client","adresse du client","ville du client","pays du client","ID du produit","nom du produit","ref du produit","description du produit","etat du produit","position du produit","Numéro de facture","date de facture","quantité de chaque produit"]
for i in ddonnee:
    st.write(i)