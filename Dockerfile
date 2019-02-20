FROM golang:1.11-stretch

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get github.com/derekparker/delve/cmd/dlv

ENV GO_DEBUG 0

CMD ["dlv", "debug", "--headless", "--listen=:2345", "--api-version=2"]

EXPOSE 2345