/// Contains methods and structs from the opus_libinfo group of opus_defines.h.
///
/// AUTOMATICALLY GENERATED FILE. DO NOT MODIFY.

library opus_libinfo;

import 'proxy_ffi.dart' as ffi;

typedef _get_version_C = ffi.Pointer<ffi.Uint8> Function();
typedef _get_version_Dart = ffi.Pointer<ffi.Uint8> Function();

typedef _bezier_intersect_C = ffi.Pointer<ffi.Double> Function(ffi.Pointer<ffi.Double>);
typedef _bezier_intersect_Dart = ffi.Pointer<ffi.Double> Function(ffi.Pointer<ffi.Double>);

typedef _free_pointer_C = ffi.Void Function(ffi.Pointer<ffi.Void>);
typedef _free_pointer_Dart = void Function(ffi.Pointer<ffi.Void>);


class FunctionsAndGlobals {
  FunctionsAndGlobals(ffi.DynamicLibrary _dynamicLibrary)
      : _get_version = _dynamicLibrary.lookupFunction<
            _get_version_C, _get_version_Dart>(
          'get_version',
        )
        ,_bezier_intersect = _dynamicLibrary.lookupFunction<
              _bezier_intersect_C, _bezier_intersect_Dart>(
            'bezier_intersect',
        )
        ,_free_pointer = _dynamicLibrary.lookupFunction<
              _free_pointer_C, _free_pointer_Dart>(
            'free_pointer',
        );
        

  /// Gets the libopus version string.
  ///
  /// Applications may look for the substring "-fixed" in the version string to determine whether they have a fixed-point or floating-point build at runtime.
  ///
  /// @returns Version string
  ffi.Pointer<ffi.Uint8> get_version() {
    return _get_version();
  }


  ffi.Pointer<ffi.Double> bezier_intersect(ffi.Pointer<ffi.Double> p) {
    return _bezier_intersect(p);
  }

  void free_pointer(ffi.Pointer<ffi.Void> p) {
    return _free_pointer(p);
  }

  final _get_version_Dart _get_version;


  final _bezier_intersect_Dart _bezier_intersect;

  final _free_pointer_Dart _free_pointer;
}
