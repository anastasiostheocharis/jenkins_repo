// Jenkinsfile — a minimal pipeline to prove your Jenkins + GitHub webhook wiring works.
// It uses ONLY shell commands, so it runs in the plain jenkins/jenkins:lts-jdk21
// container with no extra tools (no Maven, Node, or Python needed).

pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                echo '==> Build stage: preparing the app'
                sh 'chmod +x app.sh test.sh'
                sh './app.sh'
            }
        }

        stage('Test') {
            steps {
                echo '==> Test stage: checking the app output'
                sh './test.sh'
            }
        }

        stage('Deploy') {
            // NOTE: In a real multibranch setup you'd gate this with:
            //     when { branch 'main' }
            // so it only deploys from main. In this single-branch test job we
            // leave it unguarded so you see the whole pipeline go green.
            steps {
                echo '==> Deploy stage: pretending to deploy'
                sh 'echo "Deployed successfully (not really — this is a demo)."'
            }
        }
    }

    post {
        success {
            echo 'PIPELINE SUCCEEDED — your webhook wiring works!'
        }
        failure {
            echo 'PIPELINE FAILED — check the console output above.'
        }
    }
}
