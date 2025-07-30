FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:latest AS builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

ENV CGO_ENABLED=0
ENV GOOS=${TARGETOS}
ENV GOARCH=${TARGETARCH}

RUN go build -ldflags "-s -w" -trimpath -o alps ./cmd/alps

FROM --platform=${BUILDPLATFORM:-linux/amd64} gcr.io/distroless/static-debian12 AS release

WORKDIR /app

COPY --from=builder /app/alps /app/alps
COPY --from=builder /app/themes /app/themes
COPY --from=builder /app/plugins /app/plugins

USER nonroot:nonroot

EXPOSE 1323

ENTRYPOINT ["/app/alps", "-addr", ":1323", "-theme", "alps"]