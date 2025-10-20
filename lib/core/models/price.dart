import 'package:flutter_boilerplate/core/models/currency_code.dart';

class Price {
  final int amount;
  final CurrencyCode currencyCode;

  Price({required this.amount, required this.currencyCode});

  Price.fromCode({required this.amount, required String currencyCode})
    : currencyCode = CurrencyCode.fromCode(currencyCode);

  Price copyWith({int? amount, CurrencyCode? currencyCode}) {
    return Price(
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  @override
  String toString() {
    return 'Price(amount: $amount, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Price &&
        other.amount == amount &&
        other.currencyCode == currencyCode;
  }

  @override
  int get hashCode {
    return amount.hashCode ^ currencyCode.hashCode;
  }
}
