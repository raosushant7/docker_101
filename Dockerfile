# Use official python
FROM python:3.12-slim

# Set working dir in container. Never set this to root
WORKDIR /app

# Copy requirements.txt (for better caching)
COPY requirements.txt .

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code and other things (WHY???)
COPY app.py .
COPY model.pkl .
COPY scaler.pkl .

# Expose port 8000 (to what?)
EXPOSE 8000

# Final command to run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]