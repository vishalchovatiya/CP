# https://hub.docker.com/_/gcc
FROM gcc:10.4 

LABEL description="GNU C/C++ development environment" 

# Install build dependencies to build and debug 
RUN apt-get update \
    && apt-get install -y build-essential make cmake gdb gdbserver \
        rsync zip openssh-server git libgmp3-dev ninja-build clang-format \
        fish

# Configure SSH for communication with Visual Studio Code
RUN mkdir -p /var/run/sshd

# PermitRootLogin without-password through client & generate user keys
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PermitEmptyPasswords yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    ssh-keygen -A

# Create directory CP & go there
RUN mkdir -p /CP
WORKDIR /CP

# Run ssh server & expose port port 22 to connect from host PC
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# Enter to fish shell
RUN chsh -s /usr/bin/fish
ENV SHELL /usr/bin/fish
ENTRYPOINT [ "fish" ]