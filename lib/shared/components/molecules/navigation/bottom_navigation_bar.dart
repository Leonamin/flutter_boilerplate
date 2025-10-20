import 'package:flutter/material.dart';
import '../../../../core/extensions/index.dart';
import '../../atoms/navigation/nav_button.dart';

/// 바텀 네비게이션 바 아이템 정보
class BottomNavItem {
  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.route,
    this.badge,
  });

  /// 아이콘
  final IconData icon;

  /// 라벨 텍스트
  final String label;

  /// 라우트 경로
  final String route;

  /// 배지 (알림 개수 등)
  final String? badge;
}

/// 커스텀 바텀 네비게이션 바 컴포넌트 (Molecule)
///
/// NavButton atom들을 조합하여 바텀 네비게이션 바를 구성합니다.
/// 5개의 탭을 지원하며, 선택된 탭에 따라 색상이 변경됩니다.
///
/// Example:
/// ```dart
/// SeoulutionBottomNavigationBar(
///   items: [
///     BottomNavItem(icon: Icons.explore, label: '탐색', route: '/explore'),
///     BottomNavItem(icon: Icons.favorite, label: '위시리스트', route: '/wishlist'),
///     // ...
///   ],
///   currentIndex: 0,
///   onTap: (index) => navigateToTab(index),
/// )
/// ```
class SeoulutionBottomNavigationBar extends StatelessWidget {
  const SeoulutionBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  /// 네비게이션 아이템들
  final List<BottomNavItem> items;

  /// 현재 선택된 인덱스
  final int currentIndex;

  /// 탭 선택 콜백
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        border: Border(
          top: BorderSide(color: colors.borderPrimary, width: 1.0),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return Expanded(
                child: NavButton(
                  icon: item.icon,
                  label: item.label,
                  isSelected: currentIndex == index,
                  badge: item.badge,
                  onTap: () => onTap(index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
