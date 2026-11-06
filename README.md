# Building Microservices with Node.js, Express.js, Postgres, Kafka and Docker Compose

## Overview

This project demonstrates a microservices architecture using Node.js and Docker Compose. The application consists of multiple services that work together to achieve a specific functionality.

## Prerequisites

- Docker installed on your machine: [Docker Installation Guide](https://docs.docker.com/get-docker/)
- Docker Compose installed on your machine: [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)
- Node.js installed on your machine: [Node.js Installation Guide](https://nodejs.org/en/download/)

## Getting Started

1. Clone the repository:

    ```bash
    git clone https://github.com/sonukumar16/node-microservices-kafka-postgres
    ```

2. Navigate to the project directory:

    ```bash
    cd your-repository
    ```

3. Build and start the services using Docker Compose:

    ```bash
    docker-compose up --build
    ```

   This command will download the necessary images, build the services, and start the containers.

4. Access the application:

   - User Service: [http://localhost:3000](http://localhost:3000)
   - Product Service: [http://localhost:3001](http://localhost:3001)
   - Order Service: [http://localhost:3002](http://localhost:3002)

## Services

### Service 1

- Description: Service 1 description.
- Endpoint: [http://localhost:3000](http://localhost:3000)

### Service 2

- Description: Service 2 description.
- Endpoint: [http://localhost:4000](http://localhost:4000)

## Configuration

- Modify the environment variables in the `.env` file to customize the application settings.
- Note: In this application no `.env` fiel need to be configured.

## Development

- Add development-specific instructions here.

## Troubleshooting

- Include common issues and their solutions.

## Contributing

- If you'd like to contribute, please follow our [Contribution Guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).


## API Documentation
- Sample curls are defined in `.api-curls.txt` file
# Microservices DevOps Assessment

## Project Overview
Deployment and monitoring of three Node.js microservices on AWS EC2 using Docker, Jenkins, Terraform, Prometheus and Grafana.

## Architecture
- AWS EC2 (Ubuntu 24.04)
- Docker and Docker Compose
- Nginx reverse proxy
- PostgreSQL
- Apache Kafka and Zookeeper
- Amazon ECR
- Jenkins CI/CD
- Prometheus and Node Exporter
- Grafana

## Microservices
| Service | Port | API Route |
|---|---:|---|
| User Service | 3000 | /user |
| Product Service | 3001 | /product |
| Order Service | 3002 | /order |

All three services are accessible through Nginx on port 80.

## AWS Infrastructure
Terraform configuration is available in the terraform directory. It defines EC2, ECR repositories, IAM permissions and security groups.

## CI/CD
Jenkins pipeline performs GitHub checkout, Docker Compose validation and microservices image builds. An ECR publishing stage is configured.

## Deployment Verification
Run `sudo docker compose ps` on EC2 to check application containers.
All three API routes were verified through Nginx and returned HTTP 200.

## Monitoring
Prometheus scrapes its own metrics and Node Exporter every 15 seconds.
Grafana uses Prometheus as its data source.
Node Exporter Full dashboard (ID 1860) displays CPU, memory, disk and network metrics.
Monitoring access is restricted to localhost and can be accessed through SSM port forwarding.

## Terraform Commands
- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply`

## Cleanup
Use `terraform destroy` when the assessment infrastructure is no longer required.
