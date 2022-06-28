# Go Multi Platform Example

This example demonstrates how to publish your Go multi platform binaries on Valist.

[Click here to view this project on Valist.](https://mumbai.valist.io/nasdf/example-go-multi-platform)

## Publish with the Valist GitHub Action

See the [GitHub Action Quick Start](https://docs.valist.io/github-action/github-action-quick-start) for more info.

```yaml
on:
  release:
    types: [published]
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/setup-go@v3
        with:
          go-version: '^1.17'
      - uses: actions/checkout@v2
      - run: make all
      - uses: valist-io/valist-github-action@dev
        with:
          private-key: ${{ secrets.PRIVATE_KEY }}
          account: <your-account-name-here>
          project: <your-project-name-here>
          release: ${{ github.ref_name }}
          path: './dist'
          install-name: hello
          install-darwin-amd64: darwin-amd64/hello
          install-darwin-arm64: darwin-arm64/hello
          install-linux-amd64: linux-amd64/hello
          install-linux-arm64: linux-arm64/hello
          install-windows-amd64: linux-amd64/hello.exe
```

## Publish with the Valist CLI

See the [CLI Quick Start](https://docs.valist.io/cli/cli-quick-start) for more info.

Create a `valist.yml` file in your project root.

```yaml
account: <your-account-name-here>
project: <your-project-name-here>
release: <your-release-name-here>
path: ./dist
install:
  name: hello
  darwin_amd64: darwin-amd64/hello
  darwin_arm64: darwin-arm64/hello
  linux_amd64: linux-amd64/hello
  linux_arm64: linux-arm64/hello
  windows_amd64: linux-amd64/hello.exe
```

Run the following from your project root.

```bash
$ npm run build
$ valist publish
```