FROM registry.access.redhat.com/ubi9/python-311

WORKDIR /opt/app-root/src

# Install the dependencies
RUN pip install -U "pip>=23.3.1" && \
    pip install -r requirements.txt

# 
COPY streamlit .

EXPOSE 8080

# Run the application
ENTRYPOINT ["streamlit",  "run", "/opt/app-root/src/streamlit/app.py", "--server.port=8080"]
