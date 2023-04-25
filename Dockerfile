FROM golang:1.19 as pgfutter

WORKDIR /app

ADD . /app

RUN go build -v


FROM postgres:14.7

RUN mkdir /app

COPY --from=pgfutter /app/pgfutter /app/pgfutter

RUN chmod +x /app/pgfutter

WORKDIR /app

ENTRYPOINT [ "/app/pgfutter" ]