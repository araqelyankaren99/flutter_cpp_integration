cmake_minimum_required(VERSION 3.22)

project(calculator)

set(CPP_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../cpp)

add_library(
        calculator
        SHARED
        ${CPP_SOURCE_DIR}/calculator.cpp
)

target_include_directories(
        calculator
        PUBLIC
        ${CPP_SOURCE_DIR}
)

# ANDROID_ABI is set by the NDK toolchain file for whichever ABI this particular
# CMake invocation is building (arm64-v8a, x86_64, armeabi-v7a...). Writing the
# .so directly here lands it in Gradle's standard prebuilt-jniLibs location.
set_target_properties(calculator PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/app/src/main/jniLibs/${ANDROID_ABI}
)