FROM redis:4.0.11

ENV REDIS_PASSWORD hQ0xnPVjpJw4gRSE

CMD ["sh", "-c", "exec redis-server --requirepass \"$REDIS_PASSWORD\""]
