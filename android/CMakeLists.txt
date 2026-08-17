cmake_minimum_required(VERSION 3.22)

project(calculator)

add_library(
        calculator
        SHARED
        calculator.cpp
)

target_include_directories(
        calculator
        PUBLIC
        ../cpp/Classes/calculator.cpp
)