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
      steps {
        withDockerRegistry(credentialsId: 'docker-hun-creds', url: 'https://index.docker.io/v1/') {
        sh "docker push segevb/todoapi:${BUILD_ID}"

}
      }
    }

  }
}
