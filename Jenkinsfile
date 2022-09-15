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
            post {
              always {
                    junit 'reports/*.xml'
              }
            }
        }
        stage('run-robot') {
            steps {
                sh 'robot google.robot'
            }
            post {
              always {
                    robot archiveDirName: 'robot-plugin', outputPath: './', overwriteXAxisLabel: '', passThreshold: 100.0, unstableThreshold: 100.0
              }
            }
        }
        stage('run-postman') {
            steps {
                sh 'rm -rf newman/'
                sh 'newman run day01.postman_collection.json --reporters cli,junit'
            }
            post {
              always {
                    junit 'newman/*.xml'
              }
            }
        }
    }
}