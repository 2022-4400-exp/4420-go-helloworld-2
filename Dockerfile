FROM golang:alpine as builder

COPY . /app
WORKDIR /app

RUN go install

RUN go build -a -tags "netgo" -installsuffix netgo -ldflags="-s -w -extldflags \"-static\"" -o helloworld

FROM scratch
COPY --from=builder /app/helloworld /

CMD ["/helloworld"]
