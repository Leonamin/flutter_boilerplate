import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 앱의 테마 확장
/// ThemeExtension을 사용하여 라이트/다크 모드 전환 시 자연스러운 색상 애니메이션 제공
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  // Brand Colors
  final Color brand;
  final Color brandPressed;
  final Color brandSubtle;

  // Text Colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textInverse;
  final Color textBrand;
  final Color textError;
  final Color textSuccess;
  final Color textWarning;
  final Color textInfo;

  // Background Colors
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;
  final Color backgroundBrand;
  final Color backgroundBrandSubtle;
  final Color backgroundBrandBold;
  final Color backgroundSecondaryBold;
  final Color backgroundTertiaryBold;
  final Color backgroundError;
  final Color backgroundErrorSubtle;
  final Color backgroundErrorBold;
  final Color backgroundSuccess;
  final Color backgroundSuccessSubtle;
  final Color backgroundSuccessBold;
  final Color backgroundWarning;
  final Color backgroundWarningSubtle;
  final Color backgroundWarningBold;
  final Color backgroundInfo;
  final Color backgroundInfoSubtle;
  final Color backgroundInfoBold;

  // Icon Colors
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconTertiary;
  final Color iconDisabled;
  final Color iconInverse;
  final Color iconBrand;
  final Color iconError;
  final Color iconSuccess;
  final Color iconWarning;
  final Color iconInfo;

  // Border Colors
  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderTertiary;
  final Color borderFocus;
  final Color borderError;
  final Color borderSuccess;
  final Color borderWarning;
  final Color borderInfo;

  // Special Colors
  final Color shadow;
  final Color overlay;
  final Color divider;

  // Booking Status Colors
  final Color bookingPending;
  final Color bookingConfirmed;
  final Color bookingCancelled;
  final Color bookingCompleted;
  final Color paymentRequired;

  // Rating Colors
  final Color ratingFilled;
  final Color ratingEmpty;

  const AppThemeExtension({
    required this.brand,
    required this.brandPressed,
    required this.brandSubtle,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textInverse,
    required this.textBrand,
    required this.textError,
    required this.textSuccess,
    required this.textWarning,
    required this.textInfo,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.backgroundBrand,
    required this.backgroundBrandSubtle,
    required this.backgroundBrandBold,
    required this.backgroundSecondaryBold,
    required this.backgroundTertiaryBold,
    required this.backgroundError,
    required this.backgroundErrorSubtle,
    required this.backgroundErrorBold,
    required this.backgroundSuccess,
    required this.backgroundSuccessSubtle,
    required this.backgroundSuccessBold,
    required this.backgroundWarning,
    required this.backgroundWarningSubtle,
    required this.backgroundWarningBold,
    required this.backgroundInfo,
    required this.backgroundInfoSubtle,
    required this.backgroundInfoBold,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconTertiary,
    required this.iconDisabled,
    required this.iconInverse,
    required this.iconBrand,
    required this.iconError,
    required this.iconSuccess,
    required this.iconWarning,
    required this.iconInfo,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.borderTertiary,
    required this.borderFocus,
    required this.borderError,
    required this.borderSuccess,
    required this.borderWarning,
    required this.borderInfo,
    required this.shadow,
    required this.overlay,
    required this.divider,
    required this.bookingPending,
    required this.bookingConfirmed,
    required this.bookingCancelled,
    required this.bookingCompleted,
    required this.paymentRequired,
    required this.ratingFilled,
    required this.ratingEmpty,
  });

  /// 라이트 테마 인스턴스
  static const AppThemeExtension light = AppThemeExtension(
    // Brand Colors
    brand: AppColors.primary500,
    brandPressed: AppColors.primary600,
    brandSubtle: AppColors.primary50,

    // Text Colors
    textPrimary: AppColors.gray900,
    textSecondary: AppColors.gray700,
    textTertiary: AppColors.gray600,
    textDisabled: AppColors.gray500,
    textInverse: AppColors.white,
    textBrand: AppColors.primary500,
    textError: AppColors.error500,
    textSuccess: AppColors.success600,
    textWarning: AppColors.warning600,
    textInfo: AppColors.info600,

    // Background Colors
    backgroundPrimary: AppColors.white,
    backgroundSecondary: AppColors.gray50,
    backgroundTertiary: AppColors.gray100,
    backgroundBrand: AppColors.primary500,
    backgroundBrandSubtle: AppColors.primary50,
    backgroundBrandBold: AppColors.primary700,
    backgroundSecondaryBold: AppColors.gray200,
    backgroundTertiaryBold: AppColors.gray300,
    backgroundError: AppColors.error500,
    backgroundErrorSubtle: AppColors.error50,
    backgroundErrorBold: AppColors.error700,
    backgroundSuccess: AppColors.success500,
    backgroundSuccessSubtle: AppColors.success50,
    backgroundSuccessBold: AppColors.success700,
    backgroundWarning: AppColors.warning500,
    backgroundWarningSubtle: AppColors.warning50,
    backgroundWarningBold: AppColors.warning700,
    backgroundInfo: AppColors.info500,
    backgroundInfoSubtle: AppColors.info50,
    backgroundInfoBold: AppColors.info700,

    // Icon Colors
    iconPrimary: AppColors.gray700,
    iconSecondary: AppColors.gray600,
    iconTertiary: AppColors.gray500,
    iconDisabled: AppColors.gray400,
    iconInverse: AppColors.white,
    iconBrand: AppColors.primary500,
    iconError: AppColors.error500,
    iconSuccess: AppColors.success600,
    iconWarning: AppColors.warning600,
    iconInfo: AppColors.info600,

    // Border Colors
    borderPrimary: AppColors.gray300,
    borderSecondary: AppColors.gray200,
    borderTertiary: AppColors.gray100,
    borderFocus: AppColors.primary500,
    borderError: AppColors.error500,
    borderSuccess: AppColors.success500,
    borderWarning: AppColors.warning500,
    borderInfo: AppColors.info500,

    // Special Colors
    shadow: Color(0x1A000000),
    overlay: Color(0x80000000),
    divider: AppColors.gray200,

    // Booking Status Colors
    bookingPending: AppColors.warning500,
    bookingConfirmed: AppColors.success500,
    bookingCancelled: AppColors.error500,
    bookingCompleted: AppColors.gray500,
    paymentRequired: AppColors.secondary500,

    // Rating Colors
    ratingFilled: AppColors.accent500,
    ratingEmpty: AppColors.gray300,
  );

  /// 다크 테마 인스턴스
  static const AppThemeExtension dark = AppThemeExtension(
    // Brand Colors
    brand: AppColors.primary400,
    brandPressed: AppColors.primary500,
    brandSubtle: AppColors.primary900,

    // Text Colors
    textPrimary: AppColors.white,
    textSecondary: AppColors.gray300,
    textTertiary: AppColors.gray400,
    textDisabled: AppColors.gray600,
    textInverse: AppColors.black,
    textBrand: AppColors.primary400,
    textError: AppColors.error400,
    textSuccess: AppColors.success400,
    textWarning: AppColors.warning400,
    textInfo: AppColors.info400,

    // Background Colors
    backgroundPrimary: AppColors.gray900,
    backgroundSecondary: AppColors.gray800,
    backgroundTertiary: AppColors.gray700,
    backgroundBrand: AppColors.primary600,
    backgroundBrandSubtle: AppColors.primary900,
    backgroundBrandBold: AppColors.primary400,
    backgroundSecondaryBold: AppColors.gray600,
    backgroundTertiaryBold: AppColors.gray500,
    backgroundError: AppColors.error600,
    backgroundErrorSubtle: AppColors.error900,
    backgroundErrorBold: AppColors.error400,
    backgroundSuccess: AppColors.success600,
    backgroundSuccessSubtle: AppColors.success900,
    backgroundSuccessBold: AppColors.success400,
    backgroundWarning: AppColors.warning600,
    backgroundWarningSubtle: AppColors.warning900,
    backgroundWarningBold: AppColors.warning400,
    backgroundInfo: AppColors.info600,
    backgroundInfoSubtle: AppColors.info900,
    backgroundInfoBold: AppColors.info400,

    // Icon Colors
    iconPrimary: AppColors.gray300,
    iconSecondary: AppColors.gray400,
    iconTertiary: AppColors.gray500,
    iconDisabled: AppColors.gray600,
    iconInverse: AppColors.black,
    iconBrand: AppColors.primary400,
    iconError: AppColors.error400,
    iconSuccess: AppColors.success400,
    iconWarning: AppColors.warning400,
    iconInfo: AppColors.info400,

    // Border Colors
    borderPrimary: AppColors.gray600,
    borderSecondary: AppColors.gray700,
    borderTertiary: AppColors.gray800,
    borderFocus: AppColors.primary400,
    borderError: AppColors.error400,
    borderSuccess: AppColors.success400,
    borderWarning: AppColors.warning400,
    borderInfo: AppColors.info400,

    // Special Colors
    shadow: Color(0x33000000),
    overlay: Color(0x80000000),
    divider: AppColors.gray700,

    // Booking Status Colors
    bookingPending: AppColors.warning400,
    bookingConfirmed: AppColors.success400,
    bookingCancelled: AppColors.error400,
    bookingCompleted: AppColors.gray400,
    paymentRequired: AppColors.secondary400,

    // Rating Colors
    ratingFilled: AppColors.accent400,
    ratingEmpty: AppColors.gray600,
  );

  @override
  AppThemeExtension copyWith({
    Color? brand,
    Color? brandPressed,
    Color? brandSubtle,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textInverse,
    Color? textBrand,
    Color? textError,
    Color? textSuccess,
    Color? textWarning,
    Color? textInfo,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
    Color? backgroundBrand,
    Color? backgroundBrandSubtle,
    Color? backgroundBrandBold,
    Color? backgroundSecondaryBold,
    Color? backgroundTertiaryBold,
    Color? backgroundError,
    Color? backgroundErrorSubtle,
    Color? backgroundErrorBold,
    Color? backgroundSuccess,
    Color? backgroundSuccessSubtle,
    Color? backgroundSuccessBold,
    Color? backgroundWarning,
    Color? backgroundWarningSubtle,
    Color? backgroundWarningBold,
    Color? backgroundInfo,
    Color? backgroundInfoSubtle,
    Color? backgroundInfoBold,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconTertiary,
    Color? iconDisabled,
    Color? iconInverse,
    Color? iconBrand,
    Color? iconError,
    Color? iconSuccess,
    Color? iconWarning,
    Color? iconInfo,
    Color? borderPrimary,
    Color? borderSecondary,
    Color? borderTertiary,
    Color? borderFocus,
    Color? borderError,
    Color? borderSuccess,
    Color? borderWarning,
    Color? borderInfo,
    Color? shadow,
    Color? overlay,
    Color? divider,
    Color? bookingPending,
    Color? bookingConfirmed,
    Color? bookingCancelled,
    Color? bookingCompleted,
    Color? paymentRequired,
    Color? ratingFilled,
    Color? ratingEmpty,
  }) {
    return AppThemeExtension(
      brand: brand ?? this.brand,
      brandPressed: brandPressed ?? this.brandPressed,
      brandSubtle: brandSubtle ?? this.brandSubtle,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverse: textInverse ?? this.textInverse,
      textBrand: textBrand ?? this.textBrand,
      textError: textError ?? this.textError,
      textSuccess: textSuccess ?? this.textSuccess,
      textWarning: textWarning ?? this.textWarning,
      textInfo: textInfo ?? this.textInfo,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      backgroundBrand: backgroundBrand ?? this.backgroundBrand,
      backgroundBrandSubtle: backgroundBrandSubtle ?? this.backgroundBrandSubtle,
      backgroundBrandBold: backgroundBrandBold ?? this.backgroundBrandBold,
      backgroundSecondaryBold: backgroundSecondaryBold ?? this.backgroundSecondaryBold,
      backgroundTertiaryBold: backgroundTertiaryBold ?? this.backgroundTertiaryBold,
      backgroundError: backgroundError ?? this.backgroundError,
      backgroundErrorSubtle: backgroundErrorSubtle ?? this.backgroundErrorSubtle,
      backgroundErrorBold: backgroundErrorBold ?? this.backgroundErrorBold,
      backgroundSuccess: backgroundSuccess ?? this.backgroundSuccess,
      backgroundSuccessSubtle: backgroundSuccessSubtle ?? this.backgroundSuccessSubtle,
      backgroundSuccessBold: backgroundSuccessBold ?? this.backgroundSuccessBold,
      backgroundWarning: backgroundWarning ?? this.backgroundWarning,
      backgroundWarningSubtle: backgroundWarningSubtle ?? this.backgroundWarningSubtle,
      backgroundWarningBold: backgroundWarningBold ?? this.backgroundWarningBold,
      backgroundInfo: backgroundInfo ?? this.backgroundInfo,
      backgroundInfoSubtle: backgroundInfoSubtle ?? this.backgroundInfoSubtle,
      backgroundInfoBold: backgroundInfoBold ?? this.backgroundInfoBold,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconTertiary: iconTertiary ?? this.iconTertiary,
      iconDisabled: iconDisabled ?? this.iconDisabled,
      iconInverse: iconInverse ?? this.iconInverse,
      iconBrand: iconBrand ?? this.iconBrand,
      iconError: iconError ?? this.iconError,
      iconSuccess: iconSuccess ?? this.iconSuccess,
      iconWarning: iconWarning ?? this.iconWarning,
      iconInfo: iconInfo ?? this.iconInfo,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      borderTertiary: borderTertiary ?? this.borderTertiary,
      borderFocus: borderFocus ?? this.borderFocus,
      borderError: borderError ?? this.borderError,
      borderSuccess: borderSuccess ?? this.borderSuccess,
      borderWarning: borderWarning ?? this.borderWarning,
      borderInfo: borderInfo ?? this.borderInfo,
      shadow: shadow ?? this.shadow,
      overlay: overlay ?? this.overlay,
      divider: divider ?? this.divider,
      bookingPending: bookingPending ?? this.bookingPending,
      bookingConfirmed: bookingConfirmed ?? this.bookingConfirmed,
      bookingCancelled: bookingCancelled ?? this.bookingCancelled,
      bookingCompleted: bookingCompleted ?? this.bookingCompleted,
      paymentRequired: paymentRequired ?? this.paymentRequired,
      ratingFilled: ratingFilled ?? this.ratingFilled,
      ratingEmpty: ratingEmpty ?? this.ratingEmpty,
    );
  }

  @override
  AppThemeExtension lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;

    return AppThemeExtension(
      brand: Color.lerp(brand, other.brand, t) ?? brand,
      brandPressed: Color.lerp(brandPressed, other.brandPressed, t) ?? brandPressed,
      brandSubtle: Color.lerp(brandSubtle, other.brandSubtle, t) ?? brandSubtle,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t) ?? textTertiary,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t) ?? textDisabled,
      textInverse: Color.lerp(textInverse, other.textInverse, t) ?? textInverse,
      textBrand: Color.lerp(textBrand, other.textBrand, t) ?? textBrand,
      textError: Color.lerp(textError, other.textError, t) ?? textError,
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t) ?? textSuccess,
      textWarning: Color.lerp(textWarning, other.textWarning, t) ?? textWarning,
      textInfo: Color.lerp(textInfo, other.textInfo, t) ?? textInfo,
      backgroundPrimary: Color.lerp(backgroundPrimary, other.backgroundPrimary, t) ?? backgroundPrimary,
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t) ?? backgroundSecondary,
      backgroundTertiary: Color.lerp(backgroundTertiary, other.backgroundTertiary, t) ?? backgroundTertiary,
      backgroundBrand: Color.lerp(backgroundBrand, other.backgroundBrand, t) ?? backgroundBrand,
      backgroundBrandSubtle: Color.lerp(backgroundBrandSubtle, other.backgroundBrandSubtle, t) ?? backgroundBrandSubtle,
      backgroundBrandBold: Color.lerp(backgroundBrandBold, other.backgroundBrandBold, t) ?? backgroundBrandBold,
      backgroundSecondaryBold: Color.lerp(backgroundSecondaryBold, other.backgroundSecondaryBold, t) ?? backgroundSecondaryBold,
      backgroundTertiaryBold: Color.lerp(backgroundTertiaryBold, other.backgroundTertiaryBold, t) ?? backgroundTertiaryBold,
      backgroundError: Color.lerp(backgroundError, other.backgroundError, t) ?? backgroundError,
      backgroundErrorSubtle: Color.lerp(backgroundErrorSubtle, other.backgroundErrorSubtle, t) ?? backgroundErrorSubtle,
      backgroundErrorBold: Color.lerp(backgroundErrorBold, other.backgroundErrorBold, t) ?? backgroundErrorBold,
      backgroundSuccess: Color.lerp(backgroundSuccess, other.backgroundSuccess, t) ?? backgroundSuccess,
      backgroundSuccessSubtle: Color.lerp(backgroundSuccessSubtle, other.backgroundSuccessSubtle, t) ?? backgroundSuccessSubtle,
      backgroundSuccessBold: Color.lerp(backgroundSuccessBold, other.backgroundSuccessBold, t) ?? backgroundSuccessBold,
      backgroundWarning: Color.lerp(backgroundWarning, other.backgroundWarning, t) ?? backgroundWarning,
      backgroundWarningSubtle: Color.lerp(backgroundWarningSubtle, other.backgroundWarningSubtle, t) ?? backgroundWarningSubtle,
      backgroundWarningBold: Color.lerp(backgroundWarningBold, other.backgroundWarningBold, t) ?? backgroundWarningBold,
      backgroundInfo: Color.lerp(backgroundInfo, other.backgroundInfo, t) ?? backgroundInfo,
      backgroundInfoSubtle: Color.lerp(backgroundInfoSubtle, other.backgroundInfoSubtle, t) ?? backgroundInfoSubtle,
      backgroundInfoBold: Color.lerp(backgroundInfoBold, other.backgroundInfoBold, t) ?? backgroundInfoBold,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t) ?? iconPrimary,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t) ?? iconSecondary,
      iconTertiary: Color.lerp(iconTertiary, other.iconTertiary, t) ?? iconTertiary,
      iconDisabled: Color.lerp(iconDisabled, other.iconDisabled, t) ?? iconDisabled,
      iconInverse: Color.lerp(iconInverse, other.iconInverse, t) ?? iconInverse,
      iconBrand: Color.lerp(iconBrand, other.iconBrand, t) ?? iconBrand,
      iconError: Color.lerp(iconError, other.iconError, t) ?? iconError,
      iconSuccess: Color.lerp(iconSuccess, other.iconSuccess, t) ?? iconSuccess,
      iconWarning: Color.lerp(iconWarning, other.iconWarning, t) ?? iconWarning,
      iconInfo: Color.lerp(iconInfo, other.iconInfo, t) ?? iconInfo,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t) ?? borderPrimary,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t) ?? borderSecondary,
      borderTertiary: Color.lerp(borderTertiary, other.borderTertiary, t) ?? borderTertiary,
      borderFocus: Color.lerp(borderFocus, other.borderFocus, t) ?? borderFocus,
      borderError: Color.lerp(borderError, other.borderError, t) ?? borderError,
      borderSuccess: Color.lerp(borderSuccess, other.borderSuccess, t) ?? borderSuccess,
      borderWarning: Color.lerp(borderWarning, other.borderWarning, t) ?? borderWarning,
      borderInfo: Color.lerp(borderInfo, other.borderInfo, t) ?? borderInfo,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
      overlay: Color.lerp(overlay, other.overlay, t) ?? overlay,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
      bookingPending: Color.lerp(bookingPending, other.bookingPending, t) ?? bookingPending,
      bookingConfirmed: Color.lerp(bookingConfirmed, other.bookingConfirmed, t) ?? bookingConfirmed,
      bookingCancelled: Color.lerp(bookingCancelled, other.bookingCancelled, t) ?? bookingCancelled,
      bookingCompleted: Color.lerp(bookingCompleted, other.bookingCompleted, t) ?? bookingCompleted,
      paymentRequired: Color.lerp(paymentRequired, other.paymentRequired, t) ?? paymentRequired,
      ratingFilled: Color.lerp(ratingFilled, other.ratingFilled, t) ?? ratingFilled,
      ratingEmpty: Color.lerp(ratingEmpty, other.ratingEmpty, t) ?? ratingEmpty,
    );
  }
}
