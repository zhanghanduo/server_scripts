DOCKER_IMAGE_NAME=m004_llm_evaluation:v0.1

docker stop weiling-m004 || true

docker rm weiling-m004 || true

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
        --name weiling-m004 \
        --hostname weiling-m004 \
        ${DOCKER_IMAGE_NAME}
