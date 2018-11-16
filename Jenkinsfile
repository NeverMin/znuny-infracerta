pipeline {
  agent {
    docker {
      image 'maureliosilverio/ubuntu-gitlab:v1.0'
    }

  }
  stages {
    stage('run shell script') {
      parallel {
        stage('run shell script') {
          steps {
            sh 'echo teste'
            echo 'Hello darkness my old friend'
          }
        }
        stage('run another shell script') {
          steps {
            sh 'echo "teste 2"'
          }
        }
      }
    }
    stage('mensagem 1') {
      steps {
        echo 'outra mensagem'
      }
    }
    stage('print second message') {
      steps {
        echo 'hahahah'
      }
    }
  }
}