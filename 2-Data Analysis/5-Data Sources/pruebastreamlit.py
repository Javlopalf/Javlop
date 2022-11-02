
import streamlit as st
import pandas as pd


df = pd.read_csv("Sevici.csv")




menu_lateral = st.sidebar.selectbox("Menu",["Home", "Datos", "Visualizacion", "Filtrado"])


if menu_lateral == "Home":
    st.title("Bienvenido a la aplicación")
    with st.expander("Pulsa para hacer: "):
      st.balloons()

    checkbox = st.checkbox("Clickame para empezar")    

    if checkbox:
      st.markdown("Has pulsado crack")



elif menu_lateral == "Datos":
    st.title(" Datos de Sevici")
    st.metric('Distrito', df['capacity'].sum(), delta=20, delta_color="normal", help=None)
 
    df


elif menu_lateral == "Visualizacion":
    st.title("Mapa de Bicis")

    st.map(data=df, zoom=None, use_container_width=True)


elif menu_lateral == "Filtrado":
    
    menu_radio =  st.sidebar.radio('Selecciona una opción de filtro', ('Calle', 'Capacidad & Distrito'))
    if menu_radio == 'Calle':
        calle = st.sidebar.selectbox('Calle', df['name'].unique())
        df = df[df['name'] == 'Calle']
        st.dataframe(df)
        st.map(df[['lon', 'lat']], use_container_width = False)


    

    

    

   









