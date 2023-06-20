import data.data as dd
import data.queries as dq
import data.graphique as dg
import streamlit as st

st.write("Afficher les noms et descriptions de tous les produits : ")
st.code(dq.query1)
st.write("Afficher tous les meubles qui sont abandonnés : ")
st.code(dq.query2)
st.write("Effacer le Bo Meuble de Brest : ")
st.code(dq.query3)
st.write("Il y a une erreur sur le nom du meuble Apfelgluk, il faut le récrire Apfelgluck : ")
st.code(dq.query4)
st.write("Ajouter un nouveau client : Tout à la maison, Place Terreaux, Lyon : ")
st.code(dq.query5)
st.write("Ajouter une nouvelle facture pour le tout à la maison de Lyon , enregistré le 28/08/2018, à 18h : ")
st.code(dq.query6)
st.write("La commande est composé de 18 Naess : ")
st.code(dq.query7)
st.write("Retrouver toutes les factures enregistrées depuis le 1er juillet 2018 : ")
st.code(dq.query8)
st.write("Afficher le nombre de commandes par meubles : ")
st.code(dq.query9)
st.write("Afficher tous les produits ainsi que leurs sites de production : ")
st.code(dq.queryst1)
st.write("Afficher le nombre de commandes par clients")
st.code(dq.queryst4)