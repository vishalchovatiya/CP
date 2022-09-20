FROM gcc:10.4

LABEL description="Container for use with Visual Studio" 

# install build dependencies to build and debug 
RUN apt-get update \
    && apt-get install -y build-essential make cmake gdb gdbserver \
        rsync zip openssh-server git libgmp3-dev ninja-build clang-format

# configure SSH for communication with Visual Studio 
RUN mkdir -p /var/run/sshd

RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PermitEmptyPasswords yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    ssh-keygen -A

RUN mkdir -p /CP
WORKDIR /CP

CMD ["/usr/sbin/sshd", "-D"]

EXPOSE 22

# COPY . /usr/src/myapp
# WORKDIR /usr/src/myapp
# RUN gcc -o myapp main.c
# CMD ["./myapp"]