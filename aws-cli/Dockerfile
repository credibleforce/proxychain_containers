FROM debian:bullseye-slim
RUN apt-get update -qq \ 
    && apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	git \
	libbz2-1.0 \
	libcom-err2 \
	libcrypt1 \
	libffi7 \
	libgssapi-krb5-2 \
	libk5crypto3 \
	libkeyutils1 \
	libkrb5-3 \
	libkrb5support0 \
	liblzma5 \
	libncursesw6 \
	libnsl2 \
	libreadline8 \
	libsqlite3-0 \
	libsqlite3-dev \
	libssl-dev \
	libssl1.1 \
	libtinfo6 \
	libtirpc3 \
	pkg-config \
	procps \
	unzip \
	wget \
	zlib1g \
    netcat-openbsd \
    proxychains4 \
    curl
COPY entrypoint.sh /entrypoint.sh

# install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

# install aws session manager
RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" \
    && dpkg -i session-manager-plugin.deb

# add kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# latest terraform
RUN mkdir -p /workspace

# entry point
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]


