pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/Ivvyafter/project_scripting_jenkins.git'
        BRANCH_NAME = 'main'
        GITHUB_TOKEN = credentials('github_token')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: "${BRANCH_NAME}", url: "${REPO_URL}"
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy to GitHub Pages') {
            steps {
                script {
                    def remote = "https://${GITHUB_TOKEN}@github.com/Ivvyafter/project_scripting_jenkins.git"
                    sh '''
                    git config user.name "jenkins"
                    git config user.email "jenkins@example.com"
                    npm run deploy -- --repo $remote
                    '''
                }
            }
        }
    }

    post {
        always {
           

        }
    }
}
