import 'package:flutter/material.dart';
import '../theme/app_theme_extension.dart';

/// TextStyle에 색상을 적용하는 확장
/// BuildContext를 통해 테마별 색상을 자동으로 적용
extension TextStyleColorExtension on TextStyle {
  /// Primary 텍스트 색상 적용 (가장 진한 색상)
  TextStyle primary(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textPrimary,
    );
  }

  /// Secondary 텍스트 색상 적용 (중간 색상)
  TextStyle secondary(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textSecondary,
    );
  }

  /// Tertiary 텍스트 색상 적용 (가장 연한 색상)
  TextStyle tertiary(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textTertiary,
    );
  }

  /// Disabled 텍스트 색상 적용
  TextStyle disabled(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textDisabled,
    );
  }

  /// Inverse 텍스트 색상 적용 (배경과 대비되는 색상)
  TextStyle inverse(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textInverse,
    );
  }

  /// Brand 텍스트 색상 적용
  TextStyle brand(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textBrand,
    );
  }

  /// Error 텍스트 색상 적용
  TextStyle error(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textError,
    );
  }

  /// Success 텍스트 색상 적용
  TextStyle success(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textSuccess,
    );
  }

  /// Warning 텍스트 색상 적용
  TextStyle warning(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textWarning,
    );
  }

  /// Info 텍스트 색상 적용
  TextStyle info(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.textInfo,
    );
  }

  // 예약 상태별 색상

  /// 예약 대기 색상
  TextStyle bookingPending(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.bookingPending,
    );
  }

  /// 예약 확정 색상
  TextStyle bookingConfirmed(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.bookingConfirmed,
    );
  }

  /// 예약 취소 색상
  TextStyle bookingCancelled(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.bookingCancelled,
    );
  }

  /// 예약 완료 색상
  TextStyle bookingCompleted(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.bookingCompleted,
    );
  }

  /// 결제 필요 색상
  TextStyle paymentRequired(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.paymentRequired,
    );
  }

  /// 평점 색상
  TextStyle ratingFilled(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.ratingFilled,
    );
  }

  /// 빈 평점 색상
  TextStyle ratingEmpty(BuildContext context) {
    return copyWith(
      color: Theme.of(context).extension<AppThemeExtension>()!.ratingEmpty,
    );
  }
}
