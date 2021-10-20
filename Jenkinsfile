pipeline {
    agent none

    stages {
        stage ('make container and push in repo'){
              agent any
              steps {
                    git 'https://github.com/lolipopser/lesson11.git'
                    script {
                    docker.withRegistry('http://20.79.251.46:8123', 'dc917212-dd0b-45fc-ac76-ef4cf0256eb2') {
                    def customImage = docker.build("builder:2.1","./builder")
                    /* Push the container to the custom Registry */
                    customImage.push()
                    }
                    }
                }
              }
        stage ('Build war and put it to container'){
              agent {
                    docker {
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                    image 'builder:2.1'
                    registryCredentialsId 'dc917212-dd0b-45fc-ac76-ef4cf0256eb2'
                    registryUrl 'http://20.79.251.46:8123'
                     }
                    }
              steps {
                     git 'https://github.com/lolipopser/boxf.git'
                     sh 'mvn package'
                     git 'https://github.com/lolipopser/lesson11.git'
                     sh 'cp target/hello-1.0.war ./prod'
                     sh 'docker build -t 20.79.251.46:8123/prod:1.0 ./prod '
                     sh 'docker push 20.79.251.46:8123/prod:1.0'
                    }

                }
        stage ('deploy and run app') {
            agent any
            steps {
                   sshagent(credentials : ['2e7aadba-7ea6-43f7-86da-98e6b366f871']) {
                   sh '''
                   ssh -o StrictHostKeyChecking=no azureuser@20.79.251.46 uptime
                   ssh azureuser@20.79.251.46
                   sudo su

                   docker pull 20.79.251.46:8123/prod:1.0
                   docker run -d -p 8777:8080 --name prod1 prod:1.0
                   '''
                }
                /*sh 'docker run -d -p 8777:8080 --name prod1 20.113.35.233:8123/prod:1.0'*/

            }
        }

    }

}