pipeline {
  environment {
    registry = "ashishbagheldocker/javamvn"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
  }
  stages {
    stage ('SCM Checkout') {
      steps {
        script {
          git credentialsId: 'gitcredentials', url: 'https://github.com/mechdeveloper/CI-with-Jenkins-in-AWS-Demo.git'
        }
      }
    }
    stage('Build Docker Image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          // sh "ls"
        }
      }
    }
    stage('Push Docker Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            // sh "ls"
          }
        }
      }
    }
    stage('Remove Unused local image') {
      steps {
        script {
          // sh "docker rmi $registry:$BUILD_NUMBER"
          sh "ls"
        }
      }
    }
    stage('Deploy Docker Image'){
      steps {
        script {
          def imageName = registry + ":$BUILD_NUMBER"
          def dockerRun = "docker run -p 8080:8080 -d --name javawebapp ${imageName}"
          sh "ssh -o StrictHostKeyChecking=no mechashishisngh@docker-server-760210 ${dockerRun}"
        }
      }
    }
  }
}
