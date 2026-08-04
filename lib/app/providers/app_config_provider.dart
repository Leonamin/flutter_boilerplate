import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/app_config.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  throw StateError('appConfigProvider must be overridden at bootstrap.');
});
