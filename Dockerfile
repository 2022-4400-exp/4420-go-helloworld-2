FROM golang:alpine as builder

COPY . /app
WORKDIR /app

RUN go install

RUN go build -o helloworld

FROM scratch
COPY --from=builder /app/helloworld /

CMD ["/helloworld"]
