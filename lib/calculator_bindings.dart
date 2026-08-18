import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

typedef _CalculatorAddNative = Int32 Function(Int32 a, Int32 b);
typedef _CalculatorAddDart = int Function(int a, int b);

typedef _CalculatorMultiplyNative = Double Function(Double a, Double b);
typedef _CalculatorMultiplyDart = double Function(double a, double b);

typedef _CalculatorGetMessageNative = Pointer<Utf8> Function();
typedef _CalculatorGetMessageDart = Pointer<Utf8> Function();

/// Dart bindings for the native `calculator` library defined in
/// `cpp/calculator.h` / `cpp/calculator.cpp`.
class CalculatorBindings {
  CalculatorBindings._();

  static final DynamicLibrary _lib = _loadLibrary();

  static DynamicLibrary _loadLibrary() {
    if (Platform.isAndroid) {
      // Name matches add_library(calculator ...) in android/CMakeLists.txt;
      // Android's linker prefixes it with "lib" and adds ".so" automatically.
      return DynamicLibrary.open('libcalculator.so');
    }
    if (Platform.isIOS || Platform.isMacOS) {
      // On iOS/macOS the C++ code is compiled directly into the app via the
      // local CocoaPods pod (ios/calculator), not a separate loadable library,
      // so its symbols are looked up in the process's own image.
      return DynamicLibrary.process();
    }
    throw UnsupportedError(
      'CalculatorBindings is only wired up for Android and iOS so far.',
    );
  }

  static final _CalculatorAddDart add = _lib
      .lookup<NativeFunction<_CalculatorAddNative>>('calculator_add')
      .asFunction();

  static final _CalculatorMultiplyDart multiply = _lib
      .lookup<NativeFunction<_CalculatorMultiplyNative>>('calculator_multiply')
      .asFunction();

  static final _CalculatorGetMessageDart _getMessage = _lib
      .lookup<NativeFunction<_CalculatorGetMessageNative>>(
        'calculator_get_message',
      )
      .asFunction();

  static String getMessage() => _getMessage().toDartString();
}
