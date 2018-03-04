#!/usr/bin/env groovy

node {
    stage('Checkout') {
        git 'https://github.com/wwyhy/hello-world-war.git'
    }
    stage('Build') {
        sh '/var/jenkins_home/tools/maven/bin/mvn -B -f ${WORKSPACE}/${JOB_NAME}/pom.xml clean install'
    }
    stage('Build Image and Push ') {
        def imageName = 'demo.local:5000/${JOB_NAME}:${BUILD_NUMBER}'
        docker.withRegistry('http://demo.local:5000') {
        docker.build(imageName).push()
        }
    }
    stage('Deploy') {
        marathon credentialsId: '', docker: 'demo.local:5000/${JOB_NAME}:${BUILD_NUMBER}', filename: 'marathon.json', id: '', url: 'http://demo.local:8080'
    }

}
