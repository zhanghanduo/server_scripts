docker run -dit \
        --gpus all \
        --shm-size=512g \
        --net=host \
        --ipc=host \
        --ulimit memlock=-1 \
        --ulimit stack=67108864 \
        --privileged \
        -v /data2:/data2 -v /data3:/data3 -v /data2/chenweiling:/root \
        -v /var/run/nvidia-topologyd/virtualTopology.xml:/var/run/nvidia-topologyd/virtualTopology.xml \
        --hostname xia-v \
        --name xia-v \
        weiling-base:xia
