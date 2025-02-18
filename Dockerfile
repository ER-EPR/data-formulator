FROM python:3.11-slim
WORKDIR /app

# Create directory for API keys
RUN mkdir -p /app/config

# Copy entrypoint script
#COPY docker-entrypoint.sh /app/
#RUN chmod +x /app/docker-entrypoint.sh

# Set environment variables
ENV PORT=5000
ENV CONFIG_DIR=/app/config
# Install data_formulator package
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir data_formulator
    # Note: we had to merge the two "pip install" package lists here, otherwise
    # the last "pip install" command in the OP may break dependency resolution…
# Expose backend port
EXPOSE 5000
CMD ["python", "-m", "data_formulator"]
