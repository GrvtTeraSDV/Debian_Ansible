FROM debian:bookworm

#------------------------------------------
# Update & install & secure dependencies
#------------------------------------------

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
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

#------------------------------------------
# Install Dependencies and secure pip
#------------------------------------------

RUN python3 -m pip install --upgrade pip --break-system-packages && \
    python3 -m pip install --upgrade setuptools --break-system-packages && \
    python3 -m pip install --upgrade wheel --break-system-packages && \
    python3 -m pip install --upgrade cryptography --break-system-packages

#------------------------------------------
# Install Ansible & Ansible-lint
#------------------------------------------

RUN pip install --break-system-packages ansible ansible-lint

#------------------------------------------
# Set workdir and entrypoint
#------------------------------------------
EXPOSE 22
EXPOSE 80
EXPOSE 443
WORKDIR /ansible
CMD ["bash", "-c", "while true; do sleep 3600; done"]