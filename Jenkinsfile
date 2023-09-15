pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'python manage.py test'
            }
        }

        stage('Collect Static Files') {
            steps {
                sh 'python manage.py collectstatic --noinput'
            }
        }

        stage('Database Migrations') {
            steps {
                sh 'python manage.py migrate'
            }
        }

        stage('Deploy') {
            steps {
                // Add your deployment steps here
                // This could involve copying files to a server, updating a web server, etc.
            }
        }
    }

    post {
        success {
            // This section is executed when the pipeline is successful
            echo 'Pipeline completed successfully'
        }

        failure {
            // This section is executed when the pipeline fails
            echo 'Pipeline failed'
        }
    }
}
