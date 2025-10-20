import 'dart:io';
import 'package:flutter/foundation.dart';

/// 디바이스 타입 Enum
/// DB의 device_type SMALLINT와 매핑
enum DeviceType {
  android(1),
  ios(2),
  web(3);

  const DeviceType(this.value);

  final int value;

  static DeviceType fromValue(int value) {
    return DeviceType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => DeviceType.android,
    );
  }

  /// 현재 플랫폼의 DeviceType 반환
  static DeviceType get current {
    if (kIsWeb) {
      return DeviceType.web;
    } else if (Platform.isAndroid) {
      return DeviceType.android;
    } else if (Platform.isIOS) {
      return DeviceType.ios;
    }
    return DeviceType.android; // fallback
  }
}
