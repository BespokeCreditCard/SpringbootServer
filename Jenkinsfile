node {
    stage('Clone') {
            sh '''
            if [ -d "BespokeCreditCard" ]; then
                echo "디렉터리 BespokeCreditCard가 이미 존재하여 삭제합니다."
                rm -rf BespokeCreditCard
            fi
            echo ${env.WORKSPACE}
            '''
            git branch: 'develop', credentialsId: 'bespoke-git-secret-key', url: 'https://github.com/JunGyuRyu/BespokeCreditCard.git'
    }

    withCredentials([file(credentialsId: 'secret-file-env', variable: 'ENV_FILE')]) {
        stage('Set Env & Docker build') {
            sh '''
            sed 's/\r$//' $ENV_FILE > cleaned_env.sh
            sed 's/^/export /' cleaned_env.sh > temp_env.sh
            
            . /var/lib/jenkins/workspace/bepoke-pipeline/temp_env.sh

            yes | sudo docker image prune -a

            sudo docker build -f /var/lib/jenkins/workspace/bepoke-pipeline/bespoke/dockerfile \
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
                -t my-app .

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
                sh(script: 'echo $DOCKER_USER_ID')
                sh(script: 'echo ${DOCKER_USER_ID}')
                sh(script: '''sudo docker tag my-app ${DOCKER_USER_ID}/my-app:${BUILD_NUMBER}''') 
            }
            stage('Docker Push') {
                sh(script: 'sudo docker login -u ${DOCKER_USER_ID} -p ${DOCKER_USER_PASSWORD}') 
                sh(script: 'sudo docker push ${DOCKER_USER_ID}/my-app:${BUILD_NUMBER}') 
            }
    
        withCredentials([file(credentialsId: 'secret-file-env', variable: 'MY_SECRET_FILE')]) {
                stage('Deploy') {
                    sshagent(credentials: ['aws-ssh-pem-key']) {
                        sh(script: 'ssh -o StrictHostKeyChecking=no ubuntu@3.34.232.104 "sudo docker rm -f my-app"')
                        sh(script: 'scp $MY_SECRET_FILE ubuntu@3.34.232.104:~/.env')
                        sh(script: 'ssh ubuntu@3.34.232.104 "sudo docker run --name my-app --env-file ~/.env -e TZ=Asia/Seoul -p 80:8080 -d -t \${DOCKER_USER_ID}/my-app:\${BUILD_NUMBER}"')
                    }
                }
        }
    }
}   
 