FROM mashape/kong:0.8.3

ENV ENABLE_SSL "false"
COPY kong.yml /etc/kong/kong.yml

WORKDIR /kong
COPY Makefile /kong/Makefile

EXPOSE 8000 8001
CMD kong start
