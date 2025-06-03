load("@rules_cc//cc:cc_binary.bzl", "cc_binary")
load("@rules_cc//cc:cc_library.bzl", "cc_library")
load("@rules_cc//cc:cc_test.bzl", "cc_test")

PROJECT_COPTS = [
    "-std=c++17",
    "-O3",
    "-Wall",
    "-Wno-misleading-indentation",
]

PROJECT_DEFINES = []

PROJECT_LINKOPTS = ["-ldl", "-lrt"]

def project_cc_library(*, name, copts = [], defines = [], visibility = None, **kwargs):
    copts = PROJECT_COPTS + copts
    defines = PROJECT_DEFINES + defines

    #if visibility == None:
    #    visibility = [
    #        "//my/custom/visibility:__subpackages__",
    #    ]

    native.cc_library(
        name = name,
        copts = copts,
        defines = defines,
        visibility = visibility,
        **kwargs
    )

def project_cc_binary(*, name, copts = [], defines = [], linkopts = [], visibility = None, **kwargs):
    copts = PROJECT_COPTS + copts
    defines = PROJECT_DEFINES + defines
    linkopts = PROJECT_LINKOPTS + linkopts

    #if visibility == None:
    #    visibility = [
    #        "//my/custom/visibility:__subpackages__",
    #    ]

    native.cc_binary(
        name = name,
        copts = copts,
        defines = defines,
        linkopts = linkopts,
        visibility = visibility,
        **kwargs
    )

def project_cc_test(*, name, copts = [], defines = [], linkopts = [], **kwargs):
    copts = PROJECT_COPTS + copts
    defines = PROJECT_DEFINES + defines
    linkopts = PROJECT_LINKOPTS + linkopts

    cc_test(
        name = name,
        copts = copts,
        defines = defines,
        linkopts = linkopts,
        **kwargs
    )
