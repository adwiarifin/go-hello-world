FROM golang:1.16.0-alpine3.13

WORKDIR /go/src/app
ADD hello-world.go /go/src/app

RUN go build hello-world.go

FROM alpine:3.13

LABEL org.opencontainers.image.source="https://github.com/adwiarifin/go-hello-world"

COPY --from=0 "/go/src/app/hello-world" hello-world

ENTRYPOINT ./hello-world