FROM debian:bookworm

#------------------------------------------
# Update & install & secure dependencies
#------------------------------------------

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-venv \
    curl \
    ca-certificates \
    build-essential \
    libffi-dev \
    libssl-dev \
    libgnutls30 \
    && rm -rf /var/lib/apt/lists/*

#------------------------------------------
# Install Dependencies and secure pip
#------------------------------------------

RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --break-system-packages && \
    rm get-pip.py

Run python3 -m pip install --upgrade pip --break-system-packages --no-cache-dir && \
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
WORKDIR /ansible
CMD ["bash", "-c", "while true; do sleep 3600; done"]