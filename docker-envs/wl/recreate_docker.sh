DOCKER_IMAGE_NAME=weiling-base:latest
CONTAINER_NAME=$1

docker stop ${CONTAINER_NAME} || true

docker rm ${CONTAINER_NAME} || true

docker run -dit \
        --gpus all \
        --shm-size=512g \
        --net=host \
        --ipc=host \
        --ulimit memlock=-1 \
        --ulimit stack=67108864 \
        --privileged \
        -v /mnt/chenweiling:/root \
        -v /mnt:/mnt \
	-v /data2:/data2 \
	-v /data3:/data3 \
        -v /var/run/nvidia-topologyd/virtualTopology.xml:/var/run/nvidia-topologyd/virtualTopology.xml \
        --name ${CONTAINER_NAME} \
        --hostname ${CONTAINER_NAME} \
        ${DOCKER_IMAGE_NAME}
