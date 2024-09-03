docker run -dit \
        --gpus all \
        --shm-size=512g \
        --net=host \
        --ipc=host \
        --ulimit memlock=-1 \
        --ulimit stack=67108864 \
        --privileged \
        -v /mnt:/mnt \
        -v /mnt/handuo:/root \
        -v /mnt:/mnt \
        -v /data2:/data2 -v /data3:/data3 \
        -v /var/run/nvidia-topologyd/virtualTopology.xml:/var/run/nvidia-topologyd/virtualTopology.xml \
        --hostname hd-v \
        --name hd-base-v \
        handuo:hd-base
