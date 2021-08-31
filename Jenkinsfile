pipeline {
  agent {
    node {
      label 'docker-vm'
    }

  }
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/segevb/dotnet-core-api.git', branch: 'master', changelog: true, poll: true)
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t segevb/todoapi:${BUILD_ID} .'
      }
    }

    stage('Upload Docker Image to Repo') {
      parallel {
        stage('Upload Docker Image to Repo') {
          steps {
            withDockerRegistry(credentialsId: 'docker-hun-creds', url: 'https://index.docker.io/v1/') {
              sh "docker push segevb/todoapi:${BUILD_ID}"
            }

          }
        }

        stage('Test and Run the Image') {
          steps {
             sh '''docker run -itd -p 80:80 --name todoapi segevb/todoapi:${BUILD_ID}; sleep 3s; curl localhost:80; docker stop todoapi; docker rm todoapi
             '''
          }
        }

      }
    }

  }
}
