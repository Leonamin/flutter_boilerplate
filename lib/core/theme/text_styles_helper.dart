import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/theme/app_text_styles.dart';
import 'package:flutter_boilerplate/core/theme/app_theme_extension.dart';

/// 텍스트 스타일 헬퍼 클래스
class AppTextStylesHelper {
  AppThemeExtension colors(BuildContext context) {
    return Theme.of(context).extension<AppThemeExtension>()!;
  }

  // Display Styles
  TextStyle get displayLg => AppTextStyles.displayLg;
  TextStyle get display => AppTextStyles.display;

  // Header Styles
  TextStyle get header1 => AppTextStyles.header1;
  TextStyle get header2 => AppTextStyles.header2;
  TextStyle get header3 => AppTextStyles.header3;

  // Body Styles
  TextStyle get bodyLg => AppTextStyles.bodyLg;
  TextStyle get body => AppTextStyles.body;

  // Caption Styles
  TextStyle get captionLg => AppTextStyles.captionLg;
  TextStyle get caption => AppTextStyles.caption;
  TextStyle get tiny => AppTextStyles.tiny;

  // Special Styles
  TextStyle get button => AppTextStyles.button;
  TextStyle get link => AppTextStyles.link;
  TextStyle get price => AppTextStyles.price;
  TextStyle get rating => AppTextStyles.rating;
  TextStyle get status => AppTextStyles.status;
  TextStyle get overline => AppTextStyles.overline;

  // Booking Status Colors
  Color bookingPending(BuildContext context) => colors(context).bookingPending;
  Color bookingConfirmed(BuildContext context) => colors(context).bookingConfirmed;
  Color bookingCancelled(BuildContext context) => colors(context).bookingCancelled;
  Color bookingCompleted(BuildContext context) => colors(context).bookingCompleted;
  Color paymentRequired(BuildContext context) => colors(context).paymentRequired;

  // Rating Colors
  Color ratingFilled(BuildContext context) => colors(context).ratingFilled;
  Color ratingEmpty(BuildContext context) => colors(context).ratingEmpty;
}
