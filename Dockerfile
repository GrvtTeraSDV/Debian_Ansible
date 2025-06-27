FROM debian:bookworm

#-------------------------------------
#    Run Update and Upgrade
#-------------------------------------
RUN apt update && apt upgrade -y

#-------------------------------------
#    Install Essential Packages
#-------------------------------------
RUN apt install -y \
    python3 \
    python3-pip \
    python3-full \
    python3-venv \
    pipx \
    python3-setuptools \
    git \
    openssh-client \
    openssh-server \
    curl \
    ca-certificates \
    make

#-------------------------------------
#    Install Python Packages
#-------------------------------------
RUN pipx ensurepath

RUN pipx install  ansible 
RUN pipx install ansible-lint