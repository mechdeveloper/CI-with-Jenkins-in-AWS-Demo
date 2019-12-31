pipeline {
  environment {
    registry = "ashishbagheldocker/javamvn"
    registryCredential = 'docker-hub-credentials'
    dockerImage = ''
  }
  agent any
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
          sh "docker rmi $registry:$BUILD_NUMBER"
          // sh "ls"
        }
      }
    }
    stage('Deploy Docker Image'){
      steps {
        script {
          def imageName = registry + ":$BUILD_NUMBER"
          def dockerRun = "docker run -p 8080:8080 -d --name javawebapp ${imageName}"
          // sh "ssh -o StrictHostKeyChecking=no mechashishisngh@docker-server-760210 ${dockerRun}"
          // sh "sudo apt update && sudo apt install python-pip -y && pip install --upgrade google-api-python-client"
          // sh "curl -O https://raw.githubusercontent.com/GoogleCloudPlatform/python-docs-samples/master/compute/oslogin/service_account_ssh.py"
          sh "apt install python-pip -y && pip install --upgrade google-api-python-client"
          sh "python /home/mechashishsingh_gmail_com/service_account_ssh.py \
                --cmd '${dockerRun}' \
                --project tcs-devops-e2 --zone asia-south1-c --instance docker-server-760210"
        }
      }
    }
  }
}
