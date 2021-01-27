# Bizi (Bazel + Tiki)

Bizi demonstrates how to build an iOS application with Bazel.

## Prerequisites

Install with [homebrew](https://brew.sh).

```bash
brew install bazel go
```

## Usage

Open project directory in terminal. 

There are three available environments: develop, staging, production.

```bash
# build the application
make build
# or
bazel build //Bizi:Bizi --define environment=develop

# run the application in the simulator
make run
# or
bazel run //Bizi:Bizi --define environment=develop

# test the application
make test
# or
bazel test //...

```

## Discussion

The building process takes significant time at the first build because it needs to download the dependency then start the local Bazel server.

From now on, it is lightning fast.

## License

[WTFPL](http://www.wtfpl.net)