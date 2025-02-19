import 'dart:async';

// import 'dart:ffi';
import '../common/export_ffi.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:power_image/power_image.dart';

class PowerExternalImageProvider extends PowerImageProvider {
  PowerExternalImageProvider(PowerImageRequestOptions options) : super(options);

  @override
  FutureOr<ImageInfo> createImageInfo(Map map) {
    Completer<ImageInfo> completer = Completer<ImageInfo>();
    int handle = map['handle'];
    int length = map['length'];
    int width = map['width'];
    int height = map['height'];
    int? rowBytes = map['rowBytes'];
    ui.PixelFormat pixelFormat =
        ui.PixelFormat.values[map['flutterPixelFormat'] ?? 0];
    Pointer<Uint8> pointer = Pointer<Uint8>.fromAddress(handle);
    Uint8List pixels = pointer.asTypedList(length);
    ui.decodeImageFromPixels(pixels, width, height, pixelFormat,
        (ui.Image image) {
      ImageInfo imageInfo = PowerImageInfo(image: image);
      completer.complete(imageInfo);
      //释放platform_image
      PowerImageLoader.instance.releaseImageRequest(options);
    }, rowBytes: rowBytes);
    return completer.future;
  }
}
