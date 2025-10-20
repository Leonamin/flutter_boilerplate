import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 네비게이션 버튼 컴포넌트 (Atom)
///
/// 바텀 네비게이션 바에서 사용되는 버튼으로, 선택/비선택 상태를 가집니다.
/// 아이콘과 라벨을 함께 표시하며, 선택 상태에 따라 색상이 변경됩니다.
///
/// Example:
/// ```dart
/// NavButton(
///   icon: Icons.home,
///   label: '홈',
///   isSelected: true,
///   onTap: () => navigateToHome(),
/// )
/// ```
class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.onTap,
    this.badge,
  });

  /// 아이콘
  final IconData icon;

  /// 라벨 텍스트
  final String label;

  /// 선택 상태
  final bool isSelected;

  /// 탭 이벤트 핸들러
  final VoidCallback? onTap;

  /// 배지 (알림 개수 등)
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // 선택 상태에 따른 색상 설정
    final iconColor = isSelected ? colors.textPrimary : colors.textSecondary;
    final labelColor = isSelected ? colors.textPrimary : colors.textSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 아이콘과 배지
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 24.0, color: iconColor),
                if (badge != null && badge!.isNotEmpty)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: colors.textError,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        badge!,
                        style: context.textStyles.caption.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4.0),
            // 라벨
            Text(
              label,
              style: context.textStyles.caption.copyWith(
                color: labelColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
