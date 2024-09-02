#syntax=docker/dockerfile:experimental
FROM nvcr.io/nvidia/pytorch:23.08-py3
#FROM nvcr.io/nvidia/pytorch:22.12-py3

RUN apt update && apt install -y fish screen

RUN apt install -y openssh-server openssh-client
RUN echo -e "Port 10122\nPermitRootLogin yes\n" >> /etc/ssh/sshd_config
EXPOSE 10122
RUN echo '/etc/init.d/ssh restart' > /opt/restart_ssh.sh
RUN chmod +x /opt/restart_ssh.sh
WORKDIR /root
ENTRYPOINT fish

