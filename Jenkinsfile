pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat '"C:\\Program Files\\apache-maven-3.9.9\\bin\\mvn.cmd" clean compile'
            }
        }

        stage('Test') {
            steps {
                bat '"C:\\Program Files\\apache-maven-3.9.9\\bin\\mvn.cmd" test'
            }
        }

        stage('Package') {
            steps {
                bat '"C:\\Program Files\\apache-maven-3.9.9\\bin\\mvn.cmd" package'
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
