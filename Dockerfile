FROM busybox:1.31.1

# Add a health check
HEALTHCHECK CMD ping -c 1 127.0.0.1 || exit 1

# Add a non-root user and switch to it
RUN adduser -D appuser
USER appuser

CMD echo "Hello, Docker!"
