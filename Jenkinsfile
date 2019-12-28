pipeline {
  agent any
  stages {
    stage('build') {
      agent {
        docker 'maven:3-alpine'
      }
      steps {
        sh 'mvn --version'
        sh 'mvn package'
        sh 'ls project/target/'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing..'
      }
    }

  }
}