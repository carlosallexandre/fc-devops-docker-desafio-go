FROM golang:1.21.7 AS builder
WORKDIR /usr/src/app
COPY . .
RUN go build -o /usr/local/bin/app main.go


FROM scratch
COPY --from=builder /usr/local/bin/app /
CMD ["/app"]