FROM python:3.6.15-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy app files
COPY . /app/

EXPOSE 80

# Default command (from Procfile)
CMD ["voila", "--template=materialscloud", "--port=80", "--no-browser", "--Voila.root_dir=."]