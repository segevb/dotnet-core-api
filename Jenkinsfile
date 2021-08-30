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

  }
}