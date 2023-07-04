#!/bin/sh
set -e

# Check if TORPROXY IP is provided
if [ -z "$TORPROXY" ]; then
    echo "TORPROXY IP not provided. Exiting."
    exit 1
else
    echo "TORPROXY: $TORPROXY"
fi

# Write the proxychains config
cat > /etc/proxychains4.conf <<- EOM
dynamic_chain
proxy_dns
tcp_read_time_out 15000
tcp_connect_time_out 8000
[ProxyList]
socks5  $TORPROXY  9050
EOM

# Check if the TOR connection is up
while ! proxychains curl -s --connect-timeout 5 http://icanhazip.com 2> /dev/null; do
    echo "Waiting for TOR connection..."
    sleep 5
done

# Run command with TOR proxy
proxychains "${@}"