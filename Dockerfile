FROM python:3.10-slim

WORKDIR /data

# Install system dependencies including distutils
RUN apt-get update && apt-get install -y python3-distutils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Django
RUN pip install django==3.2

# Copy your project
COPY . .

# Run database migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
