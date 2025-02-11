# SimpleTimeService

SimpleTimeService is a minimalist web service that returns the current timestamp and the client's IP address in JSON format. This application is containerized using Docker and can be deployed to any cloud platform.

## Features

*   Returns the current timestamp in ISO format.
*   Retrieves the client's IP address.
*   Lightweight and optimized for containerized environments.

## Technology Stack

*   Programming Language: Python 3.11
*   Framework: FastAPI
*   Containerization: Docker
*   Base Image: Python 3.11 Alpine

## Getting Started

### Prerequisites

Ensure you have the following installed:

*   Docker

### Building the Docker Image

1.  Clone this repository:

    ```bash
    git clone <repository_url> # you can find it in the git repo clone option
    cd Particle41-Evaluation  # Go to the project directory
    ```

2.  Build the Docker image:

    ```bash
    docker build -t simple-time-service:v01.001 . #make sure to update the image version with each build
    ```
    This command builds the image and tags it as `simple-time-service:<version>`. The `.` specifies the build context (the current directory).The build version will keep track of the each version updates.

### Running the Docker Container

1.  Run the Docker container:

    ```bash
    docker run -p 8000:8000 simple-time-service:<version>
    ```
    This command runs the container and maps port 8000 on your host machine to port 8000 inside the container. If your application uses a different port, adjust accordingly.

### Pushing the Docker Image (Optional)

If you want to push the image to a public Docker Hub repository:

1.  Log in to Docker Hub:

    ```bash
    docker login -u <your_dockerhub_username>
    ```

2.  Tag the image with your Docker Hub username and repository name:

    ```bash
    docker tag simple-time-service:latest <your_dockerhub_username>/simple-time-service:latest
    ```

3.  Push the image:

    ```bash
    docker push <your_dockerhub_username>/simple-time-service:latest
    ```

### Accessing the Application

Once the container is running, you should be able to access the application by navigating to `http://localhost:8000` (update localhost with IP or domain name if you are using diffrent server to access it) in your web browser (or the appropriate address if you're running it remotely).  You should see a JSON response containing the current timestamp and your IP address.

### Dockerfile Details

The `Dockerfile` in this repository uses the following:

*   Base Image: `python:3.11-alpine` (A lightweight Python base image)
*   Working Directory: `/app`
*   Dependencies: Installed from `requirements.txt` using `pip`. Make sure to list all required Python packages in this file.
*   Application Files: Copied from the current directory (`.`) to the working directory.
*   Port: 8000 (Exposed port)
*   Command: `python main.py` (The command to run when the container starts, ensure you have the main.py in your code, if not update the command accordingly)
