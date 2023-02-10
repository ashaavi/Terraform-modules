pipeline {
    agent {
        label ('terraform-slave')
    }
    stages{
        stage ('Git Checkout') {
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ashaavi/Terraform-modules.git']])
            }
        }
        stage ('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage ('terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
