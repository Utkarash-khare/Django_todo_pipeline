pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from your version control system (e.g., Git)
                checkout scm
            }
        }

        

        stage('Build & Push') {
            steps {
                script {
 
                    // Log in to Docker registry
                    withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                       // Build the Docker image
                    sh "docker build -t ${DOCKER_USERNAME}/django:latest ." 
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    // Push the Docker image to your registry (e.g., Docker Hub)
                    sh "docker push ${DOCKER_USERNAME}/django:latest"
                    }
                }
            }
        }
