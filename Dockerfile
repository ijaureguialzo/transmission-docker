ARG VERSION

FROM jaymoulin/transmission:${VERSION}

# https://blog.samcater.com/fix-workaround-rpi4-docker-libseccomp2-docker-20/
RUN apk upgrade --update --no-cache transmission-daemon

COPY my-daemon /usr/bin/my-daemon
RUN chmod +x /usr/bin/my-daemon

COPY rpc-host /usr/local/bin/rpc-host
RUN chmod +x /usr/local/bin/rpc-host

USER 1000:1000
