#!/usr/bin/env groovy

node {
    stage('Checkout') {
        git 'https://github.com/wwyhy/hello-world-war.git'
    }
    stage('Build') {
        sh '/var/jenkins_home/tools/maven/bin/mvn -B -f /var/jenkins_home/workspace/${JOB_NAME}/master/pom.xml clean install'
    }
    stage('Build Image and Push ') {
        def imageName = 'localhost:5000/${JOB_NAME}:${BUILD_NUMBER}'
        docker.withRegistry('http://localhost:5000') {
        docker.build(imageName).push()
        }
    }
    stage('Deploy') {
        marathon credentialsId: '', docker: 'localhost:5000/${JOB_NAME}:${BUILD_NUMBER}', filename: 'marathon.json', id: '', url: 'http://10.28.0.166:8080'
    }

}
