import mysql.connector
import pandas as pd


def get_data(query):
    # Connection à la BDD
    mydb = mysql.connector.connect(
        host="localhost",
        port="3307",
        user="ikeouser",
        password="example",
        database="ikeo"
    )
    # Le curseur permet d'intéragir avec la BDD
    db = mydb.cursor()

    db.execute(query)
    dataframe = pd.DataFrame(db.fetchall(), columns=[i[0] for i in db.description])

    db.close()
    mydb.close()

    return dataframe


def exec_query(query):
    # Connection à la BDD
    mydb = mysql.connector.connect(
        host="localhost",
        port="3307",
        user="ikeouser",
        password="example",
        database="ikeo"
    )
    # Le curseur permet d'intéragir avec la BDD
    db = mydb.cursor()

    db.execute(query)
    mydb.commit()

    db.close()
    mydb.close()
