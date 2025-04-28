FROM ubuntu:latest
LABEL authors="gaman"

# Install dependencies
RUN apt update && apt install -y python3 python3-pip gunicorn

# Set the working directory
WORKDIR /app

# Copy project files
COPY . /app


# Default command to run the Django app
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "2", "project.wsgi:application"]
