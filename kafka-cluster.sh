#!/bin/bash

cmd=${1}
USERNAME=${2}
USER_PASS${3}
HOSTNAME=${4}
script=$(basename $0)
projectname=kafkacluster
kafka_image=spiside/kafka-cluster


docker_compose() {
    docker-compose -p $projectname "$@"
}

if [ -n "$cmd" ] && [ "$cmd" = 'setup' ]; then

        # Check that the image exists and, if not, pull it.\

        docker inspect spiside/kafka-cluster &> /dev/null
        if [ $? -ne 0 ]; then
            echo "Docker image doesn't exist, pulling..."
            docker pull $kafka_image
        fi

        set -e
        # Start up the containers.
        docker_compose up -d --force-recreate
        docker_compose scale kafka=2
        sleep 3  # wait for kafka to start.
        echo "setup ran successfully!"
        set +e

fi
