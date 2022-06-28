SHELL=/bin/bash

all: bin-linux-amd64 bin-linux-arm64 bin-darwin-amd64 bin-darwin-arm64 bin-windows-amd64

bin-linux-amd64:
	GOOS=linux GOARCH=amd64 go build -o ./dist/linux-amd64/hello main.go

bin-linux-arm64:
	GOOS=linux GOARCH=arm64 go build -o ./dist/linux-arm64/hello main.go

bin-darwin-amd64:
	GOOS=darwin GOARCH=amd64 go build -o ./dist/darwin-amd64/hello main.go

bin-darwin-arm64:
	GOOS=darwin GOARCH=arm64 go build -o ./dist/darwin-arm64/hello main.go

bin-windows-amd64:
	GOOS=windows GOARCH=amd64 go build -o ./dist/windows-amd64/hello.exe main.go

.PHONY: all
