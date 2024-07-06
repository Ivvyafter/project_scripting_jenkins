pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'project_scripting_jenkins'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Ivvyafter/project_scripting_jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").inside {
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${env.BUILD_NUMBER}").run('-p 3000:3000')
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
