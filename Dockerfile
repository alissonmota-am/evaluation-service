FROM golang:1.26 AS build
WORKDIR /app
COPY . .
RUN go mod tidy
RUN CGO_ENABLED=0 go build -v -o /evaluation-service .

FROM scratch
EXPOSE 8004
COPY --from=build /evaluation-service /evaluation-service
CMD ["/evaluation-service"]