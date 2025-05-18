FROM golang:1.24.3-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod init service-b && go mod tidy && go build -o /service-b .

FROM alpine:3.21
RUN adduser -D -u 1000 appuser
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata
WORKDIR /app
COPY --from=builder /service-b .
RUN chown -R appuser:appuser /app
EXPOSE 5001
USER appuser
CMD ["/app/service-b"]