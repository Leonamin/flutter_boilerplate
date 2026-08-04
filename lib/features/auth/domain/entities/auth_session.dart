import 'package:flutter_boilerplate/features/auth/domain/entities/auth_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_session.freezed.dart';

@freezed
sealed class AuthSession with _$AuthSession {
  const factory AuthSession.unauthenticated() = Unauthenticated;

  const factory AuthSession.authenticated({required AuthUser user}) =
      Authenticated;
}
