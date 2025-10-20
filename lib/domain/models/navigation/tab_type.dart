import 'package:flutter_boilerplate/core/routes/app_route_type.dart';

/// 바텀 네비게이션 탭 타입
enum TabType {
  home(0, '');

  const TabType(this.tabIndex, this.routeName);

  /// 탭 인덱스
  final int tabIndex;

  /// 탭 라우트 이름
  final String routeName;

  /// 인덱스로 TabType 찾기
  static TabType fromIndex(int index) {
    return TabType.values.firstWhere(
      (tab) => tab.tabIndex == index,
      orElse: () => TabType.home,
    );
  }

  /// 라우트로 TabType 찾기
  static TabType? fromRoute(String route) {
    try {
      return TabType.values.firstWhere((tab) => tab.routeName == route);
    } catch (e) {
      return null;
    }
  }

  /// TODO: appRouteType 구현
  AppRouteType get appRouteType {
    throw UnimplementedError();
  }
}
