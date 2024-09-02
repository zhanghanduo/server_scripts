DOCKER_IMAGE_NAME=weiling-eval:latest

docker stop weiling-m002 || true

docker rm weiling-m002 || true

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
        --name weiling-m002 \
        --hostname weiling-m002 \
        ${DOCKER_IMAGE_NAME}
