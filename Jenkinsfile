pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('run-selenium-side-runner') {
            steps {
                sh 'selenium-side-runner demo_02.side --output-directory=./reports --output-format=junit --server http://159.223.80.233/wd/hub -c "browserName=chrome"'
            }
        }
        stage('run-robot') {
            steps {
                sh 'robot google.robot'
            }
        }
        stage('run-postman') {
            steps {
                sh 'newman run day01.postman_collection.json'
            }
        }
    }
}
