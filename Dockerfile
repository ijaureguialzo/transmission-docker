FROM jaymoulin/transmission

COPY my-daemon /usr/bin/my-daemon
RUN chmod +x /usr/bin/my-daemon
