FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN go build -o /app/main
FROM scratch
COPY --from=builder /app/main /main
CMD ["/main"]
