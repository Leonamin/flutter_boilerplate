enum CurrencyCode {
  usd('USD'),
  eur('EUR'),
  krw('KRW'),
  jpy('JPY'),
  cny('CNY'),
  thb('THB'),
  gbp('GBP'),
  aud('AUD'),
  cad('CAD'),
  sgd('SGD'),
  hkd('HKD'),
  twd('TWD'),
  myr('MYR'),
  php('PHP'),
  vnd('VND'),
  idr('IDR');

  final String code;

  const CurrencyCode(this.code);

  static CurrencyCode fromCode(String code) {
    return CurrencyCode.values.firstWhere(
      (c) => c.code == code,
      orElse: () => CurrencyCode.usd,
    );
  }

  String getSymbol() {
    switch (this) {
      case CurrencyCode.usd:
        return '\$';
      case CurrencyCode.eur:
        return '€';
      case CurrencyCode.krw:
        return '₩';
      case CurrencyCode.jpy:
        return '¥';
      case CurrencyCode.cny:
        return '¥';
      case CurrencyCode.thb:
        return '฿';
      case CurrencyCode.gbp:
        return '£';
      case CurrencyCode.aud:
        return 'A\$';
      case CurrencyCode.cad:
        return 'C\$';
      case CurrencyCode.sgd:
        return 'S\$';
      case CurrencyCode.hkd:
        return 'HK\$';
      case CurrencyCode.twd:
        return 'NT\$';
      case CurrencyCode.myr:
        return 'RM';
      case CurrencyCode.php:
        return '₱';
      case CurrencyCode.vnd:
        return '₫';
      case CurrencyCode.idr:
        return 'Rp';
    }
  }

  bool get hasCents {
    switch (this) {
      case CurrencyCode.krw:
      case CurrencyCode.jpy:
      case CurrencyCode.vnd:
      case CurrencyCode.idr:
        return false;
      default:
        return true;
    }
  }
}
