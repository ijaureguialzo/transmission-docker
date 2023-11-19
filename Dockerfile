ARG VERSION

FROM linuxserver/transmission:${VERSION}

COPY rpc-host /usr/local/bin/rpc-host
RUN chmod +x /usr/local/bin/rpc-host
