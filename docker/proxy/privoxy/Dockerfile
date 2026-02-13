FROM alpine:latest
RUN apk add --no-cache privoxy
COPY config /etc/privoxy/config
COPY match-all.action /etc/privoxy/match-all.action
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3128
USER privoxy
ENTRYPOINT ["/entrypoint.sh"]
CMD ["privoxy", "--no-daemon", "/etc/privoxy/config"]
