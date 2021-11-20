ARG VERSION

FROM jaymoulin/transmission:${VERSION}

COPY my-daemon /usr/bin/my-daemon
RUN chmod +x /usr/bin/my-daemon

COPY rpc-host /usr/local/bin/rpc-host
RUN chmod +x /usr/local/bin/rpc-host

USER 1000:1000
