def builderDocker
def CommitHash
def REPO = 'arifh19/restaurant-frontend'
def BRANCH_DEV = 'dev'
def BRANCH_PROD = 'master'
def REMOTE_DIR = 'restaurant'

pipeline {
    agent any
    parameters {
        booleanParam(name: 'RunTest', defaultValue: true, description: 'Toggle this value for testing')
        choice(name: 'CICD', choices: ['CI', 'CICD'], description: 'Pick something')
    }
    stages {
        stage('Build project') {
            steps {
                nodejs('nodejs12') {
                    sh 'yarn install'
                }
            }
        }
        stage('Run Testing') {
            when {
                expression {
                    params.RunTest
                }
            }
            steps {
                echo 'passed'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {    
                    if (BRANCH_NAME == BRANCH_DEV) {
                        buildDocker  = docker.build("${REPO}:${GIT_BRANCH}", "-f DockerfileDev ./") 
                    }else {
                        buildDocker  = docker.build("${REPO}:${GIT_BRANCH}", "-f Dockerfile ./") 
                    }
                }
            }
        }
        stage('Push Image') {
            when {
                expression {
                    params.RunTest
                }
            }
            steps {
                script {
                    if (BRANCH_NAME == BRANCH_PROD) {
                        buildDocker.push("${GIT_BRANCH}")
                    }else {
                        buildDocker.push("${GIT_BRANCH}")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (BRANCH_NAME == BRANCH_PROD) {
                        sshPublisher(
                            publishers: [
                                sshPublisherDesc(
                                    configName: 'production',
                                    verbose: false,
                                    transfers: [
                                        sshTransfer(
                                            sourceFiles: "docker-compose.yml",
                                            remoteDirectory: "${REMOTE_DIR}",
                                            execCommand: "docker-compose -f restaurant/docker-compose.yml stop; docker rm restaurant_frontend_1; docker rmi ${REPO}:${BRANCH_DEV}; docker-compose -f restaurant/docker-compose.yml up -d",
                                            execTimeout: 120000,
                                        )
                                    ]
                                )
                            ]
                        )
                    } else {
                        sshPublisher(
                            publishers: [
                                sshPublisherDesc(
                                    configName: 'development',
                                    verbose: false,
                                    transfers: [
                                        sshTransfer(
                                            sourceFiles: "docker-compose.dev.yml",
                                            remoteDirectory: "${REMOTE_DIR}",
                                            execCommand: "docker-compose -f restaurant/docker-compose.dev.yml stop; docker rm restaurant_frontend_1; docker rmi ${REPO}:${BRANCH_DEV}; docker-compose -f restaurant/docker-compose.dev.yml up -d",
                                            execTimeout: 120000,
                                        ),
                                    ]
                                ),
                            ]
                        )
                    }
                    
                }
            }
        }
    }
}
