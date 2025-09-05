import 'package:flutter/material.dart';

/// 프로젝트 전용 색상 팔레트
/// 한국 전통 색상과 현대적 감성을 조화시킨 색상 시스템
class AppColors {
  AppColors._();

  // Base Colors
  static const Color transparent = Colors.transparent;
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Primary Colors - 한국 전통 청색 (청자색) 기반
  static const Color primary50 = Color(0xFFEEF4F8);
  static const Color primary100 = Color(0xFFD4E4ED);
  static const Color primary200 = Color(0xFFA9C9DB);
  static const Color primary300 = Color(0xFF7EAEC9);
  static const Color primary400 = Color(0xFF5393B7);
  static const Color primary500 = Color(0xFF2E5984);  // Main brand color
  static const Color primary600 = Color(0xFF284F77);
  static const Color primary700 = Color(0xFF1F3D5C);
  static const Color primary800 = Color(0xFF162B41);
  static const Color primary900 = Color(0xFF0D1926);

  // Secondary Colors - 한국 전통 적색 (단청색) 기반
  static const Color secondary50 = Color(0xFFFDF2F1);
  static const Color secondary100 = Color(0xFFFBE5E3);
  static const Color secondary200 = Color(0xFFF7CBC7);
  static const Color secondary300 = Color(0xFFF3B1AB);
  static const Color secondary400 = Color(0xFFEF978F);
  static const Color secondary500 = Color(0xFFD73027);  // Main secondary color
  static const Color secondary600 = Color(0xFFC22B23);
  static const Color secondary700 = Color(0xFF9A221C);
  static const Color secondary800 = Color(0xFF731A15);
  static const Color secondary900 = Color(0xFF4C110E);

  // Accent Colors - 한국 전통 황색 (황토색) 기반
  static const Color accent50 = Color(0xFFFFF8E6);
  static const Color accent100 = Color(0xFFFFEFCC);
  static const Color accent200 = Color(0xFFFFDF99);
  static const Color accent300 = Color(0xFFFFCF66);
  static const Color accent400 = Color(0xFFFFBF33);
  static const Color accent500 = Color(0xFFFFB74D);  // Main accent color
  static const Color accent600 = Color(0xFFE6A544);
  static const Color accent700 = Color(0xFFCC933B);
  static const Color accent800 = Color(0xFFB38132);
  static const Color accent900 = Color(0xFF996F29);

  // Grayscale Colors - 현대적 그레이 스케일
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);

  // Success Colors - 자연스러운 녹색
  static const Color success50 = Color(0xFFF0F9F0);
  static const Color success100 = Color(0xFFE1F3E1);
  static const Color success200 = Color(0xFFC3E7C3);
  static const Color success300 = Color(0xFFA5DBA5);
  static const Color success400 = Color(0xFF87CF87);
  static const Color success500 = Color(0xFF4CAF50);
  static const Color success600 = Color(0xFF449E48);
  static const Color success700 = Color(0xFF3C8D40);
  static const Color success800 = Color(0xFF347C38);
  static const Color success900 = Color(0xFF2C6B30);

  // Warning Colors - 따뜻한 주황색
  static const Color warning50 = Color(0xFFFFF3E0);
  static const Color warning100 = Color(0xFFFFE7C1);
  static const Color warning200 = Color(0xFFFFCF83);
  static const Color warning300 = Color(0xFFFFB745);
  static const Color warning400 = Color(0xFFFF9F07);
  static const Color warning500 = Color(0xFFFF9800);
  static const Color warning600 = Color(0xFFE68900);
  static const Color warning700 = Color(0xFFCC7A00);
  static const Color warning800 = Color(0xFFB36B00);
  static const Color warning900 = Color(0xFF995C00);

  // Error Colors - 부드러운 빨간색
  static const Color error50 = Color(0xFFFDEDED);
  static const Color error100 = Color(0xFFFBDBDB);
  static const Color error200 = Color(0xFFF7B7B7);
  static const Color error300 = Color(0xFFF39393);
  static const Color error400 = Color(0xFFEF6F6F);
  static const Color error500 = Color(0xFFF44336);
  static const Color error600 = Color(0xFFDC3C31);
  static const Color error700 = Color(0xFFC4352C);
  static const Color error800 = Color(0xFFAC2E27);
  static const Color error900 = Color(0xFF942722);

  // Info Colors - 차분한 파란색
  static const Color info50 = Color(0xFFE3F2FD);
  static const Color info100 = Color(0xFFBBDEFB);
  static const Color info200 = Color(0xFF90CAF9);
  static const Color info300 = Color(0xFF64B5F6);
  static const Color info400 = Color(0xFF42A5F5);
  static const Color info500 = Color(0xFF2196F3);
  static const Color info600 = Color(0xFF1E88E5);
  static const Color info700 = Color(0xFF1976D2);
  static const Color info800 = Color(0xFF1565C0);
  static const Color info900 = Color(0xFF0D47A1);

  // Special Colors - 특화 색상
  
  /// 한복 색상 - 전통 자주색
  static const Color hanbok = Color(0xFF8E4EC6);
  
  /// 한옥 색상 - 전통 갈색
  static const Color hanok = Color(0xFF8D6E63);
  
  /// 한강 색상 - 물빛 청색
  static const Color hangang = Color(0xFF4FC3F7);
  
  /// 단풍 색상 - 가을 단풍
  static const Color autumn = Color(0xFFFF7043);
  
  /// 벚꽃 색상 - 봄 벚꽃
  static const Color sakura = Color(0xFFFFB3BA);
}
