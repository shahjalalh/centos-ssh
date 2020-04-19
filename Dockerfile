FROM centos:7

RUN yum -y install openssh-server passwd

RUN useradd shahjalal && \
    echo "123456" | passwd shahjalal --stdin && \
    mkdir /home/shahjalal/.ssh && \
    chmod 700 /home/shahjalal/.ssh 

RUN chown shahjalal:shahjalal -R /home/shahjalal && \
    mkdir /home/shahjalal/.ssh/authorized_keys && \
    chmod 600 /home/shahjalal/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D