FROM continuumio/miniconda3

WORKDIR /app

# Copy environment lock and app files
COPY conda-lock.yml pyproject.toml ./
RUN pip install conda-lock
RUN conda-lock install --name streamlit

# this fails. use conda run
#RUN conda init
#RUN conda activate streamlit

# Copy Streamlit app
COPY app ./app

# Streamlit settings to allow it to be served from outside
ENV STREAMLIT_PORT=8505
ENV STREAMLIT_ENABLE_CORS=false
ENV STREAMLIT_HEADLESS=true

EXPOSE 8505


# Run streamlit using conda
CMD ["conda", "run", "--name", "streamlit", "streamlit", "run", "app/streamlit_app.py", \
     "--server.port=8505", \
     "--server.address=0.0.0.0", \
     "--server.enableCORS=false"]

