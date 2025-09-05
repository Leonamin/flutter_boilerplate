import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_color.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/icon_button.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/extensions/text_style_color_extension.dart';
import '../../../../core/extensions/text_style_extension.dart';

/// 기본 앱바 컴포넌트
///
/// 앱 전체에서 사용되는 표준 앱바입니다.
/// 뒤로가기 버튼, 제목, 액션 버튼 등을 지원합니다.
///
/// Example:
/// ```dart
/// DefaultAppBar.title(
///   context,
///   title: '페이지 제목',
///   showBackButton: true,
/// )
/// ```
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 왼쪽 영역에 표시될 위젯
  final Widget? leading;

  /// 기본 뒤로가기 버튼 표시 여부
  final bool showDefaultBackButton;

  /// 뒤로가기 버튼 클릭 시 실행될 콜백
  final Function(BuildContext)? onTapBack;

  /// 제목 위젯
  final Widget? title;

  /// 오른쪽 액션 버튼들
  final List<Widget>? actions;

  /// 플렉시블 스페이스 위젯
  final Widget? flexibleSpace;

  /// 하단 위젯 (탭바 등)
  final PreferredSizeWidget? bottom;

  /// 그림자 높이
  final double? elevation;

  /// 스크롤 시 그림자 높이
  final double? scrolledUnderElevation;

  /// 스크롤 알림 조건
  final bool Function(ScrollNotification) notificationPredicate;

  /// 그림자 색상
  final Color? shadowColor;

  /// 표면 틴트 색상
  final Color? surfaceTintColor;

  /// 앱바 모양
  final ShapeBorder? shape;

  /// 배경 색상
  final Color? backgroundColor;

  /// 전경 색상
  final Color? foregroundColor;

  /// 아이콘 테마
  final IconThemeData? iconTheme;

  /// 액션 아이콘 테마
  final IconThemeData? actionsIconTheme;

  /// 기본 위젯 여부
  final bool primary;

  /// 제목 중앙 정렬 여부
  final bool? centerTitle;

  /// 헤더 시맨틱 제외 여부
  final bool excludeHeaderSemantics;

  /// 제목 간격
  final double? titleSpacing;

  /// 툴바 투명도
  final double toolbarOpacity;

  /// 하단 투명도
  final double bottomOpacity;

  /// 툴바 높이
  final double? toolbarHeight;

  /// 리딩 영역 너비
  final double? leadingWidth;

  /// 툴바 텍스트 스타일
  final TextStyle? toolbarTextStyle;

  /// 제목 텍스트 스타일
  final TextStyle? titleTextStyle;

  /// 시스템 오버레이 스타일
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// 강제 머티리얼 투명도
  final bool forceMaterialTransparency;

  /// 클립 동작
  final Clip? clipBehavior;

  /// 뒤로가기 버튼 색상
  final Color? backbuttonColor;

  const DefaultAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.onTapBack,
    this.showDefaultBackButton = true,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = true,
    this.clipBehavior,
    this.backbuttonColor,
  });

  /// 제목이 있는 기본 앱바 팩토리
  ///
  /// 가장 자주 사용되는 앱바 형태를 쉽게 생성할 수 있습니다.
  factory DefaultAppBar.title(
    BuildContext context, {
    required String title,
    List<Widget>? actions,
    TextStyle? titleStyle,
    bool showBackButton = true,
    bool? centerTitle,
    Color? backgroundColor,
    Function(BuildContext)? onTapBack,
  }) {
    return DefaultAppBar(
      title: Text(
        title,
        style: titleStyle ?? context.textStyles.body.semiBold.primary(context),
      ),
      backgroundColor: backgroundColor,
      titleSpacing: showBackButton ? 0 : 16,
      onTapBack: onTapBack,
      showDefaultBackButton: showBackButton,
      centerTitle: centerTitle,
      actions: actions,
      titleTextStyle: titleStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showDefaultBackButton && leading == null
          ? Navigator.canPop(context)
                ? AppIconButton(
                    Icons.arrow_back,
                    size: ButtonSize.large,
                    variant: ButtonVariant.text,
                    color: ButtonColor.secondary,
                    onTap: () => _onTapBack(context),
                  )
                : null
          : leading,
      automaticallyImplyLeading: false,
      title: title,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor ?? context.backgroundPrimary,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle,
      clipBehavior: clipBehavior ?? Clip.none,
      forceMaterialTransparency: forceMaterialTransparency,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);

  void _onTapBack(BuildContext context) {
    Navigator.of(context).maybePop();
    onTapBack?.call(context);
  }
}
