import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user.dart';

part 'auth_session.freezed.dart';

@freezed
sealed class AuthSession with _$AuthSession {
  const factory AuthSession.unauthenticated() = Unauthenticated;

  const factory AuthSession.authenticated({required AuthUser user}) =
      Authenticated;
}
