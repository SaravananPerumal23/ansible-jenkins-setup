FROM ubuntu:18.04
RUN mkdir -p /var/run/sshd && \
    apt -y update && \
    apt install -y openjdk-8-jdk && \
    apt-get install -qy maven && \
    apt install -y openssh-server && \
    ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config
RUN echo root:password123 | chpasswd
CMD ["/usr/sbin/sshd", "-D"]
