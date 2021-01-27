filegroup(
    name = "AppIcon",
    srcs = select({
        "//config:develop": glob(["Assets.xcassets/AppIcon-Dev.appiconset/**"]),
        "//config:staging": glob(["Assets.xcassets/AppIcon-Dev.appiconset/**"]),
        "//config:production": glob(["Assets.xcassets/AppIcon.appiconset/**"]),
        "//conditions:default": glob(["Assets.xcassets/AppIcon.appiconset/**"]),
    }),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "Assets",
    srcs = glob(
        [
            "**/*",
        ],
    ),
    visibility = ["//visibility:public"],
)
