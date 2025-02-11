# Use a lightweight base image for minimal load (update according to project/code)
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file and install dependencies
# Ensure all dependencies have correct versions in requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files to the working directory
COPY . .

# Expose the application port (change if needed)
EXPOSE 8000

# Run the application as root
CMD ["python", "main.py"]
