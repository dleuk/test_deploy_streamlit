# Base image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Copy files
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

# Streamlit settings to allow it to be served from outside
ENV STREAMLIT_PORT=8501
ENV STREAMLIT_ENABLE_CORS=false
ENV STREAMLIT_HEADLESS=true

# Run Streamlit
CMD ["streamlit", "run", "app/streamlit_app.py", "--server.port=8503", "--server.enableCORS=false", "--server.enableXsrfProtection=false"]

