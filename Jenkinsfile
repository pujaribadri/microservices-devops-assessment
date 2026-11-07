pipeline {
    agent any

    environment {
        POSTGRES_USER = 'docker'
        POSTGRES_PASSWORD = 'ci-validation-only'
        POSTGRES_DB = 'micorservice_db'
    }

    options {
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/pujaribadri/microservices-devops-assessment.git'
            }
        }

        stage('Validate Docker Compose') {
            steps {
                sh 'docker compose config --quiet'
                echo 'Docker Compose validation successful'
            }
        }

        stage('Build Microservices') {
            steps {
                sh 'docker compose build user-service product-service order-service'
                echo 'All three microservice images built successfully'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: Checkout, validation and all microservice builds completed.'
        }
        failure {
            echo 'FAILURE: Check the Jenkins console output.'
        }
    }
}