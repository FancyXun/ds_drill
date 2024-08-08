FROM ds_dev:0.14.4


RUN apt-get install -y openssh-server && \

RUN echo 'root:root' | chpasswd

RUN rm -f /etc/ssh/ssh_host_rsa_key && \
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
rm -f /etc/ssh/ssh_host_dsa_key && \
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N '' && \
rm -f /etc/ssh/ssh_host_ecdsa_key && \
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
rm -f /etc/ssh/ssh_host_ed25519_key && \
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''


RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
