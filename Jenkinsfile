pipeline {
    agent any

 parameters {
        string(name: 'DOCKERHUB_CREDENTIALS', defaultValue: '', description: 'Docker Hub credentials ID')
    }

    stages {

        stage('Build and Publish') {
            steps {
     withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker build -t ${DOCKER_USERNAME}/django:latest ."
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push ${DOCKER_USERNAME}/django:latest"           
            }
        }
    }

        stage('Run Container') {
            steps {
                // Run the Docker container
                script {
                    docker.image('khareutkarsh/django:latest').run('-p 8080:80')
                }
            }
        }
    }
}
