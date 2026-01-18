FROM python:3.11-slim

WORKDIR /app

# Install Python deps
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source (including uploads/ used for first-time init)
COPY . .

# Ensure start script is executable (harmless if already)
RUN chmod +x scripts/render_start.sh

EXPOSE 8000

CMD ["sh", "scripts/render_start.sh"]
