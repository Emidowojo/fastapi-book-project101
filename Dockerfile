FROM python:3.9-slim

WORKDIR /app

# Install dependencies first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 8000


# Remove --reload for production
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]