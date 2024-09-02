set -ex


DOCKER_IMAGE_NAME=weiling-base:xia
#DOCKER_IMAGE_NAME=nvcr.io/nvidia/pytorch:23.08-py3
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
        -v /mnt:/mnt \
        -v /var/run/nvidia-topologyd/virtualTopology.xml:/var/run/nvidia-topologyd/virtualTopology.xml \
        --name ${CONTAINER_NAME} \
        --hostname ${CONTAINER_NAME} \
        ${DOCKER_IMAGE_NAME}
