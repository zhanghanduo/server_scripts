# Base image from NVIDIA NGC
FROM nvcr.io/nvidia/pytorch:23.08-py3

# Install systemd, SSH, tmux, vim, and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    systemd \
    openssh-server \
    openssh-client \
    tmux \
    vim && \
    rm -rf /var/lib/apt/lists/*

# Configure SSH to allow root login and use custom port
RUN sed -i 's/#Port 22/Port 10122/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 10122

# Start the SSH service via systemd
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/lib/systemd/systemd"]

# Set working directory
WORKDIR /root
CMD ["bash"]
