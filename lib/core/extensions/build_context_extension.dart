import 'package:flutter/material.dart';
import '../theme/app_theme_extension.dart';
import '../theme/text_styles_helper.dart';

/// BuildContext 확장으로 색상과 텍스트 스타일에 쉽게 접근할 수 있도록 제공
/// 사용법: context.colors.textPrimary, context.textStyles.header1
extension AppContextExtension on BuildContext {
  /// 테마 색상에 접근
  AppThemeExtension get colors {
    return Theme.of(this).extension<AppThemeExtension>()!;
  }

  /// 텍스트 스타일에 접근
  /// 사용법: context.textStyles.header1
  AppTextStylesHelper get textStyles => AppTextStylesHelper();

  // Brand Colors
  Color get brandColor => colors.brand;
  Color get brandPressed => colors.brandPressed;
  Color get brandSubtle => colors.brandSubtle;

  // Text Colors
  Color get textPrimary => colors.textPrimary;
  Color get textSecondary => colors.textSecondary;
  Color get textTertiary => colors.textTertiary;
  Color get textDisabled => colors.textDisabled;
  Color get textInverse => colors.textInverse;
  Color get textBrand => colors.textBrand;
  Color get textError => colors.textError;
  Color get textSuccess => colors.textSuccess;
  Color get textWarning => colors.textWarning;
  Color get textInfo => colors.textInfo;

  // Background Colors
  Color get backgroundPrimary => colors.backgroundPrimary;
  Color get backgroundSecondary => colors.backgroundSecondary;
  Color get backgroundTertiary => colors.backgroundTertiary;
  Color get backgroundBrand => colors.backgroundBrand;
  Color get backgroundBrandPressed => colors.brandPressed;
  Color get backgroundBrandSubtle => colors.backgroundBrandSubtle;
  Color get backgroundError => colors.backgroundError;
  Color get backgroundErrorPressed => colors.textError;
  Color get backgroundErrorSubtle => colors.backgroundErrorSubtle;
  Color get backgroundSuccess => colors.backgroundSuccess;
  Color get backgroundSuccessPressed => colors.textSuccess;
  Color get backgroundSuccessSubtle => colors.backgroundSuccessSubtle;
  Color get backgroundWarning => colors.backgroundWarning;
  Color get backgroundWarningPressed => colors.textWarning;
  Color get backgroundInfo => colors.backgroundInfo;

  // Icon Colors
  Color get iconPrimary => colors.iconPrimary;
  Color get iconSecondary => colors.iconSecondary;
  Color get iconTertiary => colors.iconTertiary;
  Color get iconDisabled => colors.iconDisabled;
  Color get iconInverse => colors.iconInverse;
  Color get iconBrand => colors.iconBrand;
  Color get iconError => colors.iconError;
  Color get iconSuccess => colors.iconSuccess;
  Color get iconWarning => colors.iconWarning;
  Color get iconInfo => colors.iconInfo;

  // Border Colors
  Color get borderPrimary => colors.borderPrimary;
  Color get borderSecondary => colors.borderSecondary;
  Color get borderTertiary => colors.borderTertiary;
  Color get borderBrand => colors.brand;
  Color get borderError => colors.borderError;
  Color get borderSuccess => colors.borderSuccess;
  Color get borderWarning => colors.borderWarning;
  Color get borderInfo => colors.borderInfo;

  // Booking Status Colors
  Color get bookingPending => colors.bookingPending;
  Color get bookingConfirmed => colors.bookingConfirmed;
  Color get bookingCancelled => colors.bookingCancelled;
  Color get bookingCompleted => colors.bookingCompleted;
  Color get paymentRequired => colors.paymentRequired;

  // Rating Colors
  Color get ratingFilled => colors.ratingFilled;
  Color get ratingEmpty => colors.ratingEmpty;
}
