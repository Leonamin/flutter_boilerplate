import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
sealed class AuthFailure with _$AuthFailure implements Exception {
  const factory AuthFailure.missingEmail() = MissingEmail;

  const factory AuthFailure.invalidEmail() = InvalidEmail;

  const factory AuthFailure.missingPassword() = MissingPassword;

  const factory AuthFailure.passwordTooShort({required int minimumLength}) =
      PasswordTooShort;
}
