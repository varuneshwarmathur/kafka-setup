USERNAME=${0}
USER_PASS${1}
HOSTNAME=${2}
projectname=kafkacluster
kafka_image=spiside/kafka-cluster
kafka_folder


sudo apt-get install sshpass

scp -r ../ sshpass -p '$USER_PASS' ssh -o StrictHostKeyChecking=no $USERNAME@$HOSTNAME /opt/kafkasetup

sshpass -p '$USER_PASS' ssh -o StrictHostKeyChecking=no $USERNAME@$HOSTNAME 'cd /opt/kafkasetup && ./kafka-cluster.sh setup'
