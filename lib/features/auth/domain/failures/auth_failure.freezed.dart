// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure()';
}


}

/// @nodoc
class $AuthFailureCopyWith<$Res>  {
$AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MissingEmail value)?  missingEmail,TResult Function( InvalidEmail value)?  invalidEmail,TResult Function( MissingPassword value)?  missingPassword,TResult Function( PasswordTooShort value)?  passwordTooShort,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MissingEmail() when missingEmail != null:
return missingEmail(_that);case InvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case MissingPassword() when missingPassword != null:
return missingPassword(_that);case PasswordTooShort() when passwordTooShort != null:
return passwordTooShort(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MissingEmail value)  missingEmail,required TResult Function( InvalidEmail value)  invalidEmail,required TResult Function( MissingPassword value)  missingPassword,required TResult Function( PasswordTooShort value)  passwordTooShort,}){
final _that = this;
switch (_that) {
case MissingEmail():
return missingEmail(_that);case InvalidEmail():
return invalidEmail(_that);case MissingPassword():
return missingPassword(_that);case PasswordTooShort():
return passwordTooShort(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MissingEmail value)?  missingEmail,TResult? Function( InvalidEmail value)?  invalidEmail,TResult? Function( MissingPassword value)?  missingPassword,TResult? Function( PasswordTooShort value)?  passwordTooShort,}){
final _that = this;
switch (_that) {
case MissingEmail() when missingEmail != null:
return missingEmail(_that);case InvalidEmail() when invalidEmail != null:
return invalidEmail(_that);case MissingPassword() when missingPassword != null:
return missingPassword(_that);case PasswordTooShort() when passwordTooShort != null:
return passwordTooShort(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  missingEmail,TResult Function()?  invalidEmail,TResult Function()?  missingPassword,TResult Function( int minimumLength)?  passwordTooShort,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MissingEmail() when missingEmail != null:
return missingEmail();case InvalidEmail() when invalidEmail != null:
return invalidEmail();case MissingPassword() when missingPassword != null:
return missingPassword();case PasswordTooShort() when passwordTooShort != null:
return passwordTooShort(_that.minimumLength);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  missingEmail,required TResult Function()  invalidEmail,required TResult Function()  missingPassword,required TResult Function( int minimumLength)  passwordTooShort,}) {final _that = this;
switch (_that) {
case MissingEmail():
return missingEmail();case InvalidEmail():
return invalidEmail();case MissingPassword():
return missingPassword();case PasswordTooShort():
return passwordTooShort(_that.minimumLength);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  missingEmail,TResult? Function()?  invalidEmail,TResult? Function()?  missingPassword,TResult? Function( int minimumLength)?  passwordTooShort,}) {final _that = this;
switch (_that) {
case MissingEmail() when missingEmail != null:
return missingEmail();case InvalidEmail() when invalidEmail != null:
return invalidEmail();case MissingPassword() when missingPassword != null:
return missingPassword();case PasswordTooShort() when passwordTooShort != null:
return passwordTooShort(_that.minimumLength);case _:
  return null;

}
}

}

/// @nodoc


class MissingEmail implements AuthFailure {
  const MissingEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.missingEmail()';
}


}




/// @nodoc


class InvalidEmail implements AuthFailure {
  const InvalidEmail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidEmail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.invalidEmail()';
}


}




/// @nodoc


class MissingPassword implements AuthFailure {
  const MissingPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.missingPassword()';
}


}




/// @nodoc


class PasswordTooShort implements AuthFailure {
  const PasswordTooShort({required this.minimumLength});
  

 final  int minimumLength;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordTooShortCopyWith<PasswordTooShort> get copyWith => _$PasswordTooShortCopyWithImpl<PasswordTooShort>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordTooShort&&(identical(other.minimumLength, minimumLength) || other.minimumLength == minimumLength));
}


@override
int get hashCode => Object.hash(runtimeType,minimumLength);

@override
String toString() {
  return 'AuthFailure.passwordTooShort(minimumLength: $minimumLength)';
}


}

/// @nodoc
abstract mixin class $PasswordTooShortCopyWith<$Res> implements $AuthFailureCopyWith<$Res> {
  factory $PasswordTooShortCopyWith(PasswordTooShort value, $Res Function(PasswordTooShort) _then) = _$PasswordTooShortCopyWithImpl;
@useResult
$Res call({
 int minimumLength
});




}
/// @nodoc
class _$PasswordTooShortCopyWithImpl<$Res>
    implements $PasswordTooShortCopyWith<$Res> {
  _$PasswordTooShortCopyWithImpl(this._self, this._then);

  final PasswordTooShort _self;
  final $Res Function(PasswordTooShort) _then;

/// Create a copy of AuthFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? minimumLength = null,}) {
  return _then(PasswordTooShort(
minimumLength: null == minimumLength ? _self.minimumLength : minimumLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
