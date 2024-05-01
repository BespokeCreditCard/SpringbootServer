node {
    stage('Pull') {
            git branch: 'deploy', credentialsId: 'bespoke-git-secret-key', url: 'https://github.com/JunGyuRyu/BespokeCreditCard.git'
    }

    withCredentials([file(credentialsId: 'secret-file-env', variable: 'ENV_FILE')]) {
        stage('Set Env & Docker build') {
            sh "echo 2 ${JOB_NAME}"
            sh '''
            sed 's/\r$//' $ENV_FILE > cleaned_env.sh
            sed 's/^/export /' cleaned_env.sh > temp_env.sh
            . /var/lib/jenkins/workspace/${JOB_NAME}/temp_env.sh

            yes | sudo docker image prune -a

            sudo docker build -f /var/lib/jenkins/workspace/${JOB_NAME}/bespoke/Dockerfile \
                --build-arg DBURL=$DBURL \
                --build-arg DBID=$DBID \
                --build-arg DBPW=$DBPW \
                --build-arg S3Endpoint=$S3Endpoint \
                --build-arg S3Region=$S3Region \
                --build-arg S3Accesskey=$S3Accesskey \
                --build-arg S3Secretkey=$S3Secretkey \
                --build-arg DALLE=$DALLE \
                --build-arg ElasticID=$ElasticID \
                --build-arg ElasticPW=$ElasticPW \
                --build-arg springJwtSecret=$springJwtSecret \
                --build-arg DEEPL=$DEEPL \
                -t spring-app .
            '''
            sh '''
                rm temp_env.sh
                rm cleaned_env.sh
            '''
        }
    }

    withCredentials([[$class: 'UsernamePasswordMultiBinding', 
        credentialsId: 'docker-hub', 
        usernameVariable: 'DOCKER_USER_ID', 
        passwordVariable: 'DOCKER_USER_PASSWORD']]) {
            stage('Docker Tag') {
                sh(script: '''sudo docker tag spring-app ${DOCKER_USER_ID}/spring-app:${BUILD_NUMBER}''') 
            }
            stage('Docker Push') {
                sh(script: 'sudo docker login -u ${DOCKER_USER_ID} -p ${DOCKER_USER_PASSWORD}') 
                sh(script: 'sudo docker push ${DOCKER_USER_ID}/spring-app:${BUILD_NUMBER}') 
            }
    
        withCredentials([file(credentialsId: 'secret-file-env', variable: 'MY_SECRET_FILE')]) {
                stage('Deploy') {
                    sshagent(credentials: ['aws-ssh-pem-key']) {
                        sh(script: 'ssh -o StrictHostKeyChecking=no ubuntu@3.34.232.104 "sudo docker rm -f spring-app"')
                        sh(script: 'scp $MY_SECRET_FILE ubuntu@3.34.232.104:~/.env')
                        sh(script: 'ssh ubuntu@3.34.232.104 "sudo docker run --name spring-app --env-file ~/.env -e TZ=Asia/Seoul -p 80:8080 -d -t \${DOCKER_USER_ID}/spring-app:\${BUILD_NUMBER}"')
                    }
                }
        }
    } 

    stage('Cleaning up') { 
              sh "sudo docker rmi ${DOCKER_USER_ID}/spring-app:${BUILD_NUMBER}" // sudo docker image 제거
      } 
}  
 