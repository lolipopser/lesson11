pipeline {
    agent none

    stages {
        stage ('make container and push in repo'){
              agent any
              steps {
                    git 'https://github.com/lolipopser/lesson11.git'
                    docker build -t builder:2.1 ./builder
                    docker tag builder:2.1 20.79.251.46:8123/builder:2.1
                    docker push  20.79.251.46:8123/builder:2.1
                }
              }
        stage ('Build war and put it to container'){
              agent {
                    docker {
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                    image 'build_war:2.1'
                    registryCredentialsId 'dc917212-dd0b-45fc-ac76-ef4cf0256eb2'
                    registryUrl 'http://20.79.251.46:8123'
                     }
                    }
              steps {
                     git 'https://github.com/lolipopser/boxf.git'
                     sh 'mvn package'
                     git 'https://github.com/lolipopser/lesson11.git'
                     sh 'cp target/hello-1.0.war ./'
                     sh 'docker build -t 20.113.35.233:8123/prod:1.0 . '
                     sh 'docker push 20.113.35.233:8123/prod:1.0'
                    }

                }
        stage ('deploy and run app') {
            agent any
            steps {

                sh 'docker run -d -p 8777:8080 --name prod1 20.113.35.233:8123/prod:1.0'

            }
        }

    }

}