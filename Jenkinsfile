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
                    // Clean up any existing container with this name
                    sh 'docker rm -f simple-node-app || true'
                    
                    // Run the new container in detached mode
                    sh 'docker run -d --rm -p 3000:3000 --name simple-node-app simple-node-app'
                    
                    // Wait a few seconds to allow the app to start
                    sh 'sleep 5'
                    
                    // Test the running app by executing curl inside the container
                    sh 'docker exec simple-node-app curl http://localhost:3000'
                    
                    // Stop the container after testing
                    sh 'docker stop simple-node-app'
                }
            }
        }
    }
}
