FROM mashape/kong:0.9.0

ENV ENABLE_SSL "false"
COPY kong.conf /etc/kong/kong.conf

WORKDIR /kong

EXPOSE 8000 8001
CMD ["kong", "start", "-vv", "--conf", "/etc/kong/kong.conf"]
