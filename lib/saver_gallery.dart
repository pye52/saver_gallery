import 'dart:async';

import 'package:flutter/services.dart';

class SaverGallery {
  static const MethodChannel _channel = MethodChannel('saver_gallery');

  /// Save the PNG，JPG，JPEG image or video located at [path] to the local device media gallery.
  static Future<SaveResult> saveFile({required String path}) async {
    final result = await _channel.invokeMapMethod<String, dynamic>(
      'saveFileToGallery',
      <String, dynamic>{'path': path},
    );
    return SaveResult.fromMap(result!);
  }
}

class SaveResult {
  bool isSuccess;
  String? errorMessage;

  SaveResult(this.isSuccess, this.errorMessage);

  factory SaveResult.fromMap(Map<String, dynamic> json) {
    return SaveResult(json['isSuccess'], json['errorMessage']);
  }

  @override
  String toString() {
    return 'SaveResult{isSuccess: $isSuccess, errorMessage: $errorMessage}';
  }
}
