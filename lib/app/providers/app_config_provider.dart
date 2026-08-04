import 'package:flutter_boilerplate/core/config/app_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  throw StateError('appConfigProvider must be overridden at bootstrap.');
});
