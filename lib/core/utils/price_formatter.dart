import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/core/models/currency_code.dart';
import 'package:flutter_boilerplate/core/models/price.dart';
import 'package:intl/intl.dart';

/// 가격 포맷팅 유틸리티 클래스
/// 다국가 통화 지원 및 센트 단위 처리
class PriceFormatter {
  /// ProductPrice를 포맷팅된 문자열로 변환
  static String formatPrice(Price price, {bool showCents = true}) {
    return formatAmount(price.amount, price.currencyCode, showCents: showCents);
  }

  /// 금액과 통화 코드를 포맷팅된 문자열로 변환
  static String formatAmount(
    int amountInCents,
    CurrencyCode currencyCode, {
    bool showCents = true,
  }) {
    final symbol = currencyCode.getSymbol();
    final hasCents = currencyCode.hasCents;

    if (!hasCents) {
      // 센트 단위가 없는 통화 (원, 엔 등)
      return '$symbol${NumberFormat('#,###').format(amountInCents)}';
    }

    // 센트 단위가 있는 통화
    final amount = amountInCents / 100.0;

    if (!showCents && amount == amount.toInt()) {
      // 정수인 경우 센트 표시 안함
      return '$symbol${NumberFormat('#,###').format(amount.toInt())}';
    }

    return '$symbol${NumberFormat('#,##0.00').format(amount)}';
  }

  /// 간단한 가격 포맷 (센트가 00인 경우 생략)
  static String formatSimplePrice(Price price) {
    return formatSimpleAmount(price.amount, price.currencyCode);
  }

  /// 간단한 금액 포맷 (센트가 00인 경우 생략)
  static String formatSimpleAmount(
    int amountInCents,
    CurrencyCode currencyCode,
  ) {
    final symbol = currencyCode.getSymbol();
    final hasCents = currencyCode.hasCents;

    if (!hasCents) {
      return '$symbol${NumberFormat('#,###').format(amountInCents)}';
    }

    final amount = amountInCents / 100.0;

    if (amount == amount.toInt()) {
      // 정수인 경우 센트 생략
      return '$symbol${NumberFormat('#,###').format(amount.toInt())}';
    }

    return '$symbol${NumberFormat('#,##0.00').format(amount)}';
  }

  /// "From $XX / guest" 형태의 가격 텍스트 생성 (다국어 지원)
  /// TODO: 다국어 지원
  static String formatPriceWithUnit(
    BuildContext context,
    Price price, {
    String? unit,
  }) {
    throw UnimplementedError();
    // final formattedPrice = formatSimplePrice(price);
    // final s = AppLocalizations.of(context);

    // // unit이 명시적으로 제공되지 않으면 기본값 사용
    // final resolvedUnit = unit ?? s.pricePerGuest;

    // return s.priceFormatWithUnit(formattedPrice, resolvedUnit);
  }

  /// 통화 심볼 가져오기
  static String getCurrencySymbol(CurrencyCode currencyCode) {
    return currencyCode.getSymbol();
  }

  /// 가격 비교를 위한 정규화된 값 반환 (모두 센트 단위로)
  static int normalizeAmount(int amount, CurrencyCode currencyCode) {
    if (!currencyCode.hasCents) {
      return amount; // 이미 최소 단위
    }
    return amount; // 센트 단위로 저장됨
  }

  /// 사용자 친화적인 가격 범위 표시
  static String formatPriceRange(Price minPrice, Price maxPrice) {
    if (minPrice.currencyCode != maxPrice.currencyCode) {
      // 다른 통화인 경우 개별 표시
      return '${formatSimplePrice(minPrice)} - ${formatSimplePrice(maxPrice)}';
    }

    final symbol = getCurrencySymbol(minPrice.currencyCode);
    final hasCents = minPrice.currencyCode.hasCents;

    if (!hasCents) {
      final minAmount = minPrice.amount;
      final maxAmount = maxPrice.amount;
      return '$symbol${NumberFormat('#,###').format(minAmount)} - ${NumberFormat('#,###').format(maxAmount)}';
    }

    final minAmount = minPrice.amount / 100.0;
    final maxAmount = maxPrice.amount / 100.0;

    if (minAmount == minAmount.toInt() && maxAmount == maxAmount.toInt()) {
      return '$symbol${NumberFormat('#,###').format(minAmount.toInt())} - ${NumberFormat('#,###').format(maxAmount.toInt())}';
    }

    return '$symbol${NumberFormat('#,##0.00').format(minAmount)} - ${NumberFormat('#,##0.00').format(maxAmount)}';
  }
}
