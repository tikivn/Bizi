"""
This modules contains rules for building/testing an Apple application.
"""

load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_unit_test",
)
load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)
load(
    "//config:config.bzl",
    "swift_library_compiler_flags",
)
load(
    "//config:constants.bzl",
    "MINIMUM_IOS_VERSION",
    "PRODUCT_BUNDLE_IDENTIFIER_PREFIX",
    "SWIFT_VERSION",
)

def swift_unit_test(
        name,
        srcs = [],
        deps = [],
        visibility = ["//visibility:public"]):
    test_lib_name = name + "TestLib"
    host_application = ":" + name
    swift_library(
        name = test_lib_name,
        srcs = srcs,
        deps = deps + [host_application],
        module_name = test_lib_name,
        visibility = ["//visibility:private"],
    )

    test_name = name + "Tests"
    ios_unit_test(
        name = test_name,
        deps = [test_lib_name],
        minimum_os_version = MINIMUM_IOS_VERSION,
        visibility = visibility,
    )

def first_party_library(
        name,
        deps = [],
        data = [],
        test_deps = [],
        swift_compiler_flags = [],
        swift_version = SWIFT_VERSION,
        visibility = ["//visibility:public"]):
    swift_unit_test(
        name = name,
        srcs = native.glob(["Tests/**/*.swift"]),
        deps = test_deps,
    )

    swift_library(
        name = name,
        module_name = name,
        srcs = native.glob(["Sources/**/*.swift"]),
        deps = deps,
        copts = swift_compiler_flags + swift_library_compiler_flags() + ["-swift-version", swift_version],
        data = data,
        visibility = visibility,
    )

def application(
        name,
        infoplist,
        deps = [],
        test_deps = [],
        app_icons = [],
        resources = [],
        swift_version = SWIFT_VERSION):
    first_party_library(
        name = name + "Lib",
        data = [],
        deps = deps,
        test_deps = test_deps,
        swift_version = swift_version,
    )

    ios_application(
        name = name,
        bundle_id = PRODUCT_BUNDLE_IDENTIFIER_PREFIX + "." + name,
        families = [
            "iphone",
        ],
        app_icons = app_icons,
        resources = resources,
        infoplists = [infoplist],
        minimum_os_version = MINIMUM_IOS_VERSION,
        deps = deps + [":" + name + "Lib"],
    )
