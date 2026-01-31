pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'Java17'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                powershell 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                powershell 'mvn test'
            }
        }

        stage('Package') {
            steps {
                powershell 'mvn package'
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
            archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
        }
    }
}