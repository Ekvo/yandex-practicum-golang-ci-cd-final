FROM golang:1.23 AS builder

LABEL stage=builder

ENV CGO_ENABLED=0

ENV GOOS=linux

ENV GOARCH=amd64

WORKDIR /usr/src/build

ADD go.mod .

ADD go.sum .

RUN go mod download

COPY . ./

RUN  go build -o final-cicd ./cmd/app/main.go

FROM scratch

WORKDIR /usr/src/app

COPY ./storage ./storage

COPY --from=builder /usr/src/build/final-cicd /usr/src/app/final-cicd

CMD ["/usr/src/app/final-cicd"]