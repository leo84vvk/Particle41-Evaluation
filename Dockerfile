# Use a lightweight base image for minimal load (update base image according to project/code)
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /app

# Create and use a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy dependency file and install dependencies
# Ensure all dependencies have correct versions in requirements.txt
COPY --chown=appuser:appgroup requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files to the working directory and provide the access to new user
COPY --chown=appuser:appgroup . .

# Expose the application port (change if needed)
EXPOSE 8000

# Run the application as a non-root user
CMD ["python", "main.py"]

