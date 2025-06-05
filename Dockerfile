# Start from an official slim Python 3.6 image
FROM python:3.6.15-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8888

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    libssl-dev \
    libgl1-mesa-glx \
    libxrender1 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy app files
COPY . /app/

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Default command (from Procfile)
CMD ["voila", "--template=materialscloud", "--port=8888", "--no-browser"]