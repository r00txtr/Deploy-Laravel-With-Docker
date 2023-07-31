pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                docker build -t img-perpus-r00txtr1 .
                docker-compose up -d
                docker exec -it perpus-rootxtr1 php artisan migrate
                docker exec -it perpus-rootxtr1 php artisan db:seed
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                curl localhost:8000
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}
