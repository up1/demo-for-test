pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('run-selenium-side-runner') {
            steps {
                sh 'selenium-side-runner day-01.side'
            }
        }
        stage('run-robot') {
            steps {
                sh 'robot *.robot'
            }
        }
        stage('run-postman') {
            steps {
                sh 'newman *.json'
            }
        }
    }
}
