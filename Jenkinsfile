pipeline {
    agent any

    environment {
        POSTGRES_USER = 'docker'
        POSTGRES_PASSWORD = 'ci-validation-only'
        POSTGRES_DB = 'micorservice_db'
        AWS_DEFAULT_REGION = 'us-east-1'
        ECR_REGISTRY = '625867802100.dkr.ecr.us-east-1.amazonaws.com'
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
            }
        }

        stage('Push Images to AWS ECR') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-ecr-credentials',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh '''
                        set -e
                        aws --version

                        aws ecr get-login-password --region "$AWS_DEFAULT_REGION" |
                        docker login --username AWS --password-stdin "$ECR_REGISTRY"

                        docker tag microservices-cicd-pipeline-user-service:latest "$ECR_REGISTRY/microservices-devops/user-service:$BUILD_NUMBER"
                        docker tag microservices-cicd-pipeline-product-service:latest "$ECR_REGISTRY/microservices-devops/product-service:$BUILD_NUMBER"
                        docker tag microservices-cicd-pipeline-order-service:latest "$ECR_REGISTRY/microservices-devops/order-service:$BUILD_NUMBER"

                        docker push "$ECR_REGISTRY/microservices-devops/user-service:$BUILD_NUMBER"
                        docker push "$ECR_REGISTRY/microservices-devops/product-service:$BUILD_NUMBER"
                        docker push "$ECR_REGISTRY/microservices-devops/order-service:$BUILD_NUMBER"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'CI pipeline and ECR image push completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the stage logs.'
        }
    }
}
