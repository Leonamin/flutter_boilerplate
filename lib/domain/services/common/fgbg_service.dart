import 'package:flutter_boilerplate/core/utils/listener.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';

class FGBGService {
  final ValueListener<FGBGType> _fgbgListener = ValueListener();

  int addListener(Function(FGBGType) callback) => _fgbgListener.add(callback);

  void removeListener(int? id) => _fgbgListener.remove(id);

  void onChangeFGBG(FGBGType type) {
    Logger.debug('FGBG event: $type', tag: 'FGBGService');
    _fgbgListener.notify(type);
  }
}
