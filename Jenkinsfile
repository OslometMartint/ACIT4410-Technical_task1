pipeline {
  agent any
  tools {nodejs "node"}
    
  stages {
    stage('Initial setup') {
      steps {
        sshagent(credentials: ['master_key']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.29.255 "cd /home/ubuntu/ACIT4410-Technical_task1/pipeline_scripts/ && bash initial_setup.sh"'
        }
      }
    }
    stage('Creating new docker image') {
      steps {
        sshagent(credentials: ['master_key']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.29.255 "cd /home/ubuntu/ACIT4410-Technical_task1/pipeline_scripts/ && bash create_docker_image.sh"'
        }
      }
    }
    stage('Run new image on vm') {
      steps {
        sshagent(credentials: ['master_key']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.29.255 "cd /home/ubuntu/ACIT4410-Technical_task1/pipeline_scripts/ && sudo bash run_docker_image.sh"'
        }
      }
    }
    stage("Run linters") {
        parallel {
            stage('JS Linter') {
                steps {
                    sshagent(credentials: ['master_key']) {
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.29.255 "cd /home/ubuntu/ACIT4410-Technical_task1/pipeline_scripts/ && sudo bash eslint.sh"'
                    }
                }
            }
            stage('HTML Linter') {
                steps {
                    sshagent(credentials: ['master_key']) {
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.29.255 "cd /home/ubuntu/ACIT4410-Technical_task1/pipeline_scripts/ && sudo bash htmlhint.sh"'
                    }
                }
            }
        }
    }
    stage("Run Accessibility tests") {
        steps {
            sshagent(credentials: ['master_key']) {
                sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.29.255 "cd /home/ubuntu/ACIT4410-Technical_task1/pipeline_scripts/ && bash pa11y-ci_tests.sh"'
            }
        }
    }
  }
}
