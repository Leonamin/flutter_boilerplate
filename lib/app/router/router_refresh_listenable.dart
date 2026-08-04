import 'package:flutter/foundation.dart';

final class RouterRefreshListenable extends ChangeNotifier {
  void refresh() {
    notifyListeners();
  }
}
