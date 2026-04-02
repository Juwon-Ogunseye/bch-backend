# bch-backend/Dockerfile
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies for MySQL client and other build tools
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install async MySQL driver (required for the app)
RUN pip install asyncmy

# Copy application code
COPY . .

# Create .env file from example if .env doesn't exist
RUN if [ ! -f .env ] && [ -f .env.example ]; then cp .env.example .env; fi

# Expose port
EXPOSE 8000

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]