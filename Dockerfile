FROM debian:bookworm

#-------------------------------------
# Update & install dependencies
#-------------------------------------
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    git \
    openssh-client \
    curl \
    ca-certificates \
    build-essential \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

#-------------------------------------
# Install Ansible & Ansible-lint
#-------------------------------------
RUN python3 -m pip install --upgrade pip --break-system-packages && \
    pip install --break-system-packages ansible ansible-lint

#-------------------------------------
# Set workdir and entrypoint
#-------------------------------------
WORKDIR /ansible
CMD ["bash"]
