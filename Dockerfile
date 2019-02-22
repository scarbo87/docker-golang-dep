FROM golang:1.11-stretch

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get github.com/derekparker/delve/cmd/dlv
RUN wget -O "$GOPATH/bin/sql-migrate-cobra" https://github.com/scarbo87/sql-migrate-cobra/releases/download/v1.0.1/sql-migrate-cobra_linux_amd64; chmod +x "$GOPATH/bin/sql-migrate-cobra"

ENV GO_DEBUG 0

CMD ["dlv", "debug", "--headless", "--listen=:2345", "--api-version=2"]

EXPOSE 2345
