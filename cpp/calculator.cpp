#include "calculator.h"

// __attribute__((used)) keeps these symbols even though nothing in
// Swift/ObjC/Kotlin calls them directly -- dart:ffi resolves them by name at
// runtime, which the linker's dead-code stripping can't see, so without this
// it silently drops them (hit specifically on macOS, where DEAD_CODE_STRIPPING
// is on even for Debug builds).

__attribute__((used))
int calculator_add(int a, int b) {
    return a + b;
}

__attribute__((used))
double calculator_multiply(double a, double b) {
    return a * b;
}

__attribute__((used))
const char* calculator_get_message() {
    return "Hello from C++";
}