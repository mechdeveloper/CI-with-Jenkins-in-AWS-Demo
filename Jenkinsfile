pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker {
          image 'maven:3-alpine'
        }

      }
      steps {
        sh 'mvn --version'
        sh 'ls project/target/'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing..'
      }
    }

    stage('Build image') {
      steps {
        echo 'Building image ...'
      }
    }

  }
}