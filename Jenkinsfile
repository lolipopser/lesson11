pipeline {
    agent none

    stages {

        stage ('Build war and put it to container'){
              agent {
                    docker {
                    args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
                    image 'build_war:v2.0'
                    registryCredentialsId 'f27d57dd-5835-4003-b45a-b0598a851790'
                    registryUrl 'http://20.113.35.233:8123'
                   }
              steps {

              }

        }




    }

}