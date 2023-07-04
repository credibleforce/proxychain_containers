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

# nmap
RUN apt-get update && apt-get install -y \
	nmap \
	--no-install-recommends

# entry point
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]