# //Bizi:Bizi
package = //Bizi:Bizi

# develop | staging | production
environment = develop

build:
	bazel build $(package) --define environment=$(environment)

run:
	bazel run $(package) --define environment=$(environment)

test:
	bazel test //...