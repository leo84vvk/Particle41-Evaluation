# Use a lightweight base image for minimal load (update base image according to project/code)
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /app

# Create and use a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy dependency file and install dependencies with new user
# Ensure all dependencies have correct versions in requirements.txt
COPY --chown=appuser:appgroup requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files to the working directory and provide access to new user
COPY --chown=appuser:appgroup . .

# Set permissions to ensure the non-root user can access files
RUN chmod -R 755 /app

# Expose the application port (change if needed)
EXPOSE 8000

# Switch to the non-root user
USER appuser

# Run the application as a non-root user
CMD ["python", "main.py"]


