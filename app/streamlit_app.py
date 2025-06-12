import streamlit as st
import psycopg2

st.title("PostgreSQL Test")

try:
    conn = psycopg2.connect(
        dbname="mydb",
        user="user",
        password="password",
        host="db",  # service name from docker-compose
        port=5432
    )
    cur = conn.cursor()
    cur.execute("SELECT version();")
    version = cur.fetchone()
    st.success("Connected to PostgreSQL!")
    st.code(version)

    cur.close()
    conn.close()
except Exception as e:
    st.error(f"Error: {e}")

