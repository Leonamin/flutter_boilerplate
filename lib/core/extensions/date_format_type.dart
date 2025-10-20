import 'package:intl/intl.dart';

/// 지역별 날짜 형식을 정의하는 열거형
enum DateFormatType {
  /// 동아시아 국가들의 날짜 형식 (년-월-일)
  ymd,

  /// 미국의 날짜 형식 (월-일-년)
  mdy,

  /// 유럽의 날짜 형식 (일-월-년)
  dmy;

  /// 로케일에 따른 날짜 형식 타입을 반환
  static DateFormatType getDateFormatTypeForLocale(String locale) {
    // ymd 형식 (년-월-일)
    const ymdLocales = ['ko_KR', 'zh_CN', 'ja_JP'];

    // mdy 형식 (월-일-년)
    const mdyLocales = ['en_US'];

    // dmy 형식 (일-월-년)
    const dmyLocales = ['en_GB', 'fr_FR', 'es_ES', 'de_DE', 'it_IT'];

    if (ymdLocales.contains(locale)) {
      return DateFormatType.ymd;
    } else if (mdyLocales.contains(locale)) {
      return DateFormatType.mdy;
    } else if (dmyLocales.contains(locale)) {
      return DateFormatType.dmy;
    } else {
      // 기본값은 mdy (미국 형식)
      return DateFormatType.mdy;
    }
  }

  /// 현재 로케일에 맞는 날짜 형식 타입을 반환
  static DateFormatType get current {
    final locale = Intl.getCurrentLocale();
    return getDateFormatTypeForLocale(locale);
  }
}
