pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'project_scripting_jenkins:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main','https://github.com/Ivvyafter/project_scripting_jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh 'docker run --rm $DOCKER_IMAGE npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            mail to: 'ivvyafter@gmail.com',
                 subject: "Succès : Build ${env.BUILD_NUMBER}",
                 body: "Le build ${env.BUILD_NUMBER} a réussi."
        }
        failure {
            mail to: 'ivvyafter@gmail.com',
                 subject: "Échec : Build ${env.BUILD_NUMBER}",
                 body: "Le build ${env.BUILD_NUMBER} a échoué."
        }
    }
}
