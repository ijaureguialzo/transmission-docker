FROM jaymoulin/transmission:3.00

COPY my-daemon /usr/bin/my-daemon
RUN chmod +x /usr/bin/my-daemon
