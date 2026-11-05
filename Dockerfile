FROM golang:1.24 AS build
WORKDIR /app
COPY . .
RUN go mod tidy
RUN CGO_ENABLED=0 go build -v -o /evaluation-service .

# distroless/static inclui certificados CA — necessario para o OTLP via TLS
FROM gcr.io/distroless/static:nonroot
EXPOSE 8004
COPY --from=build /evaluation-service /evaluation-service
CMD ["/evaluation-service"]