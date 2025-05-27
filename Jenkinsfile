pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t simple-node-app .'
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d --rm -p 3000:3000 --name simple-node-app simple-node-app'
                    sh 'sleep 5'
                    sh 'docker exec simple-node-app curl http://localhost:3000'
                    sh 'docker stop simple-node-app'
                }
            }
        }
    }
}
