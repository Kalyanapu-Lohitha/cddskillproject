pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Kalyanapu-Lohitha/cddskillproject'
            }
        }
        stage('Terraform Infrastructure') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Ansible Configuration') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i inventory.ini deploy.yml'
                }
            }
        }
        stage('Install Frontend Dependencies') {
            steps {
                dir('frontendapp') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('Install Backend Dependencies') {
            steps {
                dir('backendapp') {
                    sh 'npm install'
                }
            }
        }
        stage('Start Backend Server') {
            steps {
                dir('backendapp') {
                    sh 'node index.js'
                }
            }
        }
    }
}
