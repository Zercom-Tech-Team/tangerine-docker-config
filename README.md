# Tangerine LMS Containerization Template

This repository offers a comprehensive template designed to streamline the deployment and management of Tangerine LMS through containerization.

## Features

- **Pre-configured Containers**: Containers are pre-configured for immediate deployment, ensuring a quick and efficient setup.
- **Scalability**: Designed for scalability, this template supports increasing user demands seamlessly.
- **Security**: Incorporates advanced security measures to safeguard data and regulate user access effectively.

## Getting Started

### Prerequisites

- Docker installed
- Docker Compose installed (required for orchestrating multi-container environments)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository/tangerine-lms-containerization.git
   ```

2. Copy the downloaded files into your project directory and navigate to the project root:
   ```bash
   cd your/tangerine/project
   ```

3. Copy the `.env.example` file to create a `.env` file and update the environmental variables:
   ```bash
   cp .env.example .env
   ```

4. Adjust the Dockerfile and docker-compose.yml as necessary to reflect the correct project directory and configure the ports for the Apache web server and SQL server.

5. Build and launch the containers:
   ```bash
   docker-compose up --build
   ```

## Usage

Once installed, Tangerine LMS can be accessed at `http://localhost:port`, where `port` is the port number defined in your docker-compose.yml file.

## License

This project is distributed under the MIT License. For more details, see the [LICENSE](LICENSE) file.
