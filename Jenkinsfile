pipeline {
  environment {
    registry = "ashishbagheldocker/javamvn"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Building image') {
      steps{
        script {
          // dockerImage = docker.build registry + ":$BUILD_NUMBER"
          sh "ls"
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            // dockerImage.push()
            sh "ls"
          }
        }
      }
    }
    stage('Remove Unused local image') {
      steps{
        // sh "docker rmi $registry:$BUILD_NUMBER"
        sh "ls"
      }
    }
    stage('Deploy') {
      steps {
        sh "ls"
        sh "ssh -o StrictHostKeyChecking=no mechashishsingh@docker-server-760210 ls"
      }
    }
  }
}
