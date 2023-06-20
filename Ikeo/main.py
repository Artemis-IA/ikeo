import data.data as dd
import data.queries as dq
import data.graphique as dg
import streamlit as st
import streamlit.web.bootstrap as stb
import os

def main():
    # Récupérer les données
    df = dd.get_data(dq.queryst1)

    # Sélectionner une usine avec une boîte de sélection
    option = st.selectbox('Choisissez votre usine', df['usine'].unique())

    # Afficher les données filtrées selon l'usine sélectionnée
    st.dataframe(df[df['usine'] == option].reset_index(drop=True).drop('usine', axis=1))

    # Afficher les graphiques
    dg.graph1()
    dg.graph2()

if __name__ == "__main__":
    if st.runtime.exists():
        main()
    else:
        # Exécuter l'application Streamlit avec Streamlit-Boostrap
        streamlit_script_path = os.path.join(os.getcwd(), "main.py")
        stb.run(streamlit_script_path, '', [], flag_options=[])
        main()
