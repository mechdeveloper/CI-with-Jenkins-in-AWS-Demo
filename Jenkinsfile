pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker { image 'maven:3-alpine' }
      }
      steps {
        sh 'mvn --version'
        // sh 'mvn package'
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
