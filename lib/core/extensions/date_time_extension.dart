import 'package:intl/intl.dart';
import 'date_format_type.dart';

/// DateTime 확장 메서드
extension DateTimeExtension on DateTime {
  /// 오늘인지 확인
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// 어제인지 확인
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// 내일인지 확인
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// 같은 날짜인지 확인
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// 같은 날짜이거나 이후인지 확인
  bool isSameDateOrAfter(DateTime other) => isAfter(other) || isSameDate(other);

  /// 같은 날짜이거나 이전인지 확인
  bool isSameDateOrBefore(DateTime other) =>
      isBefore(other) || isSameDate(other);

  /// 두 날짜 사이에 있는지 확인
  bool isBetween(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) return false;
    return (isSameDate(startDate) || isAfter(startDate)) &&
        (isBefore(endDate) || isSameDate(endDate));
  }

  /// 같은 달인지 확인
  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;

  /// 어제 날짜
  DateTime get yesterday => subtract(const Duration(days: 1));

  /// 내일 날짜
  DateTime get tomorrow => add(const Duration(days: 1));

  /// 7일 전
  DateTime get aWeekAgo => subtract(const Duration(days: 7));

  /// 7일 후
  DateTime get aWeekLater => add(const Duration(days: 7));

  /// 이번 달 첫째 날
  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  /// 이번 달 마지막 날
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// 다음 달 첫째 날
  DateTime get firstDayOfNextMonth => DateTime(year, month + 1, 1);

  /// 다음 달 마지막 날
  DateTime get lastDayOfNextMonth => DateTime(year, month + 2, 0);

  /// 이전 달 첫째 날
  DateTime get firstDayOfPrevMonth => DateTime(year, month - 1, 1);

  /// 이전 달 마지막 날
  DateTime get lastDayOfPrevMonth => DateTime(year, month, 0);

  /// yyyymmdd 형식으로 변환
  int toYMD() => int.parse(toString().substring(0, 10).replaceAll('-', ''));

  /// 시간만 표시 (HH:mm)
  String toTimeString() {
    return DateFormat('HH:mm').format(this);
  }

  /// 12시간 형식 시간 표시 (h:mm a)
  String toTime12String() {
    return DateFormat('h:mm a').format(this);
  }

  /// 로케일에 맞는 월-일 형식
  String toIntlMD() {
    final locale = Intl.getCurrentLocale();
    final dateFormatType = DateFormatType.getDateFormatTypeForLocale(locale);

    switch (dateFormatType) {
      case DateFormatType.ymd:
        if (locale == 'ja_JP') {
          return DateFormat('M月d日').format(this);
        }
        if (locale == 'zh_CN') {
          return DateFormat('M月d日').format(this);
        }
        if (locale == 'ko_KR') {
          return DateFormat('M월 d일').format(this);
        }
        return DateFormat('M/d').format(this);
      case DateFormatType.mdy:
        return DateFormat('MMM d').format(this);
      case DateFormatType.dmy:
        return DateFormat('d MMM').format(this);
    }
  }

  /// 로케일에 맞는 년-월-일 형식
  String toIntlYMD() {
    final locale = Intl.getCurrentLocale();
    final format = DateFormat.yMd(locale);
    return format.format(this);
  }

  /// 로케일에 맞는 년-월-일 시:분 형식
  String toIntlYMDHm() {
    final locale = Intl.getCurrentLocale();
    final format = DateFormat.yMd(locale).add_Hm();
    return format.format(this);
  }

  /// 로케일에 맞는 월-일 시:분 형식
  String toIntlMDHm() {
    final locale = Intl.getCurrentLocale();
    final dateFormatType = DateFormatType.getDateFormatTypeForLocale(locale);

    switch (dateFormatType) {
      case DateFormatType.ymd:
        if (locale == 'ja_JP') {
          return DateFormat('M月d日 HH:mm').format(this);
        }
        if (locale == 'zh_CN') {
          return DateFormat('M月d日 HH:mm').format(this);
        }
        if (locale == 'ko_KR') {
          return DateFormat('M월 d일 HH:mm').format(this);
        }
        return DateFormat('M/d HH:mm').format(this);
      case DateFormatType.mdy:
        return DateFormat('MMM d, HH:mm').format(this);
      case DateFormatType.dmy:
        return DateFormat('d MMM, HH:mm').format(this);
    }
  }

  /// 상대적 시간 표시 (방금 전, 1분 전, 1시간 전, 1일 전 등)
  String toRelativeString() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '방금 전';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}일 전';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks주 전';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months개월 전';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years년 전';
    }
  }

  /// 스마트 날짜 표시 (오늘, 어제, 내일이면 해당 텍스트, 아니면 날짜)
  String toSmartDateString() {
    if (isToday) {
      return '오늘';
    } else if (isYesterday) {
      return '어제';
    } else if (isTomorrow) {
      return '내일';
    } else {
      return toIntlMD();
    }
  }

  /// 스마트 날짜 + 시간 표시
  String toSmartDateTimeString() {
    final dateStr = toSmartDateString();
    final timeStr = toTimeString();
    return '$dateStr $timeStr';
  }

  /// 로케일에 맞는 요일 표시 (짧은 형식)
  String toWeekdayString() {
    final locale = Intl.getCurrentLocale();
    return DateFormat.E(locale).format(this);
  }

  /// 로케일에 맞는 요일 표시 (긴 형식)
  String toWeekdayLongString() {
    final locale = Intl.getCurrentLocale();
    return DateFormat.EEEE(locale).format(this);
  }

  /// 로케일에 맞는 월 이름 (짧은 형식)
  String toMonthString() {
    final locale = Intl.getCurrentLocale();
    return DateFormat.MMM(locale).format(this);
  }

  /// 로케일에 맞는 월 이름 (긴 형식)
  String toMonthLongString() {
    final locale = Intl.getCurrentLocale();
    return DateFormat.MMMM(locale).format(this);
  }

  /// 숫자 기반 월 표시 (1월, 2월 등 - 동아시아 언어용)
  String toNumericMonthString() {
    final locale = Intl.getCurrentLocale();
    final dateFormatType = DateFormatType.getDateFormatTypeForLocale(locale);

    if (dateFormatType == DateFormatType.ymd) {
      // 동아시아 언어들은 숫자 기반 월 표시
      if (locale == 'ko_KR') {
        return '$month월';
      } else if (locale == 'ja_JP') {
        return '$month月';
      } else if (locale == 'zh_CN') {
        return '$month月';
      }
    }

    // 다른 언어들은 월 이름 사용
    return toMonthString();
  }

  /// 요일 포함 날짜 표시
  String toDateWithWeekday() {
    return '${toIntlMD()} (${toWeekdayString()})';
  }

  /// 스마트 월-일 표시 (로케일에 따라 숫자 또는 월 이름 사용)
  String toSmartMonthDay({bool useShort = false}) {
    final locale = Intl.getCurrentLocale();
    final dateFormatType = DateFormatType.getDateFormatTypeForLocale(locale);

    if (dateFormatType == DateFormatType.ymd) {
      // 동아시아 언어들은 숫자 기반
      if (locale == 'ko_KR') {
        return '$month월 $day일';
      } else if (locale == 'ja_JP') {
        return '$month月$day日';
      } else if (locale == 'zh_CN') {
        return '$month月$day日';
      }
    }

    // 서구 언어들은 월 이름 사용
    return DateFormat(useShort ? 'MMM d' : 'MMMM d').format(this);
  }

  /// 스마트 년-월-일 표시
  String toSmartYearMonthDay() {
    final locale = Intl.getCurrentLocale();
    final dateFormatType = DateFormatType.getDateFormatTypeForLocale(locale);

    if (dateFormatType == DateFormatType.ymd) {
      // 동아시아 언어들은 숫자 기반
      if (locale == 'ko_KR') {
        return '$year년 $month월 $day일';
      } else if (locale == 'ja_JP') {
        return '$year年$month月$day日';
      } else if (locale == 'zh_CN') {
        return '$year年$month月$day日';
      }
    }

    // 서구 언어들은 표준 형식 사용
    return DateFormat.yMMMd(locale).format(this);
  }

  /// 시작일부터 종료일까지의 기간 표시
  String toPeriodString(DateTime endDate) {
    if (isSameDate(endDate)) {
      return toIntlMD();
    }

    if (isSameMonth(endDate)) {
      return '${DateFormat('M월 d일').format(this)} - ${DateFormat('d일').format(endDate)}';
    }

    if (year == endDate.year) {
      return '${DateFormat('M월 d일').format(this)} - ${DateFormat('M월 d일').format(endDate)}';
    }

    return '${toIntlYMD()} - ${endDate.toIntlYMD()}';
  }
}
