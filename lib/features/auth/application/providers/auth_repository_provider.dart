import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';

/// The application composition root must override this port.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  throw StateError(
    'authRepositoryProvider must be overridden by the application bootstrap.',
  );
});
