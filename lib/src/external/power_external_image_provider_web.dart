import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:power_image/power_image.dart';

class PowerExternalImageProvider extends PowerImageProvider {
  PowerExternalImageProvider(PowerImageRequestOptions options) : super(options);

  @override
  FutureOr<ImageInfo> createImageInfo(Map map) {
    throw UnsupportedError('Not support for this platform');
  }
}
