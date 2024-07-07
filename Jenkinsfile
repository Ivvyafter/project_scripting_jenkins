pipeline {
    agent any 
    environment {
        GIT_REPO = 'https://github.com/Ivvyafter/project_scripting_jenkins.git'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: GIT_REPO, credentialsId: 'eec61187-4364-46df-bc46-7556a839b558'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([string(credentialsId: 'GITHUB_TOKEN', variable: 'GITHUB_TOKEN')]) {
                    sh """
                    git config --global user.name "ivvyafter"
                    git config --global user.email "ivvyafter@gmail.com"
                    git remote set-url origin https://${GITHUB_TOKEN}@github.com/Ivvyafter/project_scripting_jenkins.git
                    git add .
                    git commit -m "Automated Jenkins commit"
                    git push origin main
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
