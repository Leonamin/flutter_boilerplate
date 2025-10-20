import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

/// 프로필 이미지 Placeholder 크기 열거형
enum ProfileImagePlaceholderSize {
  small(24.0),
  medium(40.0),
  large(56.0),
  xlarge(80.0),
  xxlarge(120.0);

  const ProfileImagePlaceholderSize(this.value);
  final double value;
}

/// 프로필 이미지 Placeholder 컴포넌트
///
/// 사용자 프로필 이미지가 없을 때 표시되는 기본 아바타 컴포넌트입니다.
/// 다양한 크기와 스타일을 지원하며, 이니셜 표시 기능도 제공합니다.
///
/// 예시:
/// ```dart
/// ProfileImagePlaceHolder(
///   size: ProfileImagePlaceholderSize.large,
///   initials: 'JD',
/// )
/// ```
class ProfileImagePlaceHolder extends StatelessWidget {
  /// 플레이스홀더 크기
  final ProfileImagePlaceholderSize size;

  /// 표시할 이니셜 (선택사항)
  final String? initials;

  /// 배경 색상 (선택사항, 기본값: backgroundSecondary)
  final Color? backgroundColor;

  /// 텍스트 색상 (선택사항, 기본값: textSecondary)
  final Color? textColor;

  /// 아이콘 색상 (선택사항, 기본값: iconSecondary)
  final Color? iconColor;

  /// 테두리 표시 여부
  final bool showBorder;

  /// 테두리 색상 (선택사항, 기본값: borderSecondary)
  final Color? borderColor;

  /// 테두리 두께
  final double borderWidth;

  /// 클릭 이벤트 핸들러
  final VoidCallback? onTap;

  const ProfileImagePlaceHolder({
    super.key,
    this.size = ProfileImagePlaceholderSize.medium,
    this.initials,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final diameter = size.value;
    final radius = diameter / 2;

    // 이니셜이 있는 경우 폰트 크기 계산
    final fontSize = _calculateFontSize(diameter);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? context.colors.backgroundSecondary,
          border: showBorder
              ? Border.all(
                  color: borderColor ?? context.colors.borderSecondary,
                  width: borderWidth,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: _buildContent(context, fontSize),
        ),
      ),
    );
  }

  /// 플레이스홀더 내용 빌드
  Widget _buildContent(BuildContext context, double fontSize) {
    if (initials != null && initials!.isNotEmpty) {
      return _buildInitials(context, fontSize);
    } else {
      return _buildDefaultIcon(context);
    }
  }

  /// 이니셜 표시 위젯 빌드
  Widget _buildInitials(BuildContext context, double fontSize) {
    return Center(
      child: Text(
        _formatInitials(initials!),
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor ?? context.colors.textSecondary,
          height: 1.0,
        ),
      ),
    );
  }

  /// 기본 아이콘 위젯 빌드
  Widget _buildDefaultIcon(BuildContext context) {
    final iconSize = _calculateIconSize(size.value);

    return Center(
      child: Icon(
        Icons.person,
        size: iconSize,
        color: iconColor ?? context.colors.iconSecondary,
      ),
    );
  }

  /// 이니셜 포맷팅 (최대 2글자)
  String _formatInitials(String initials) {
    final trimmed = initials.trim().toUpperCase();
    if (trimmed.length <= 2) {
      return trimmed;
    }

    // 공백으로 분리된 경우 각 단어의 첫 글자
    final words = trimmed.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}';
    }

    // 단일 단어인 경우 첫 2글자
    return trimmed.substring(0, 2);
  }

  /// 크기에 따른 폰트 크기 계산
  double _calculateFontSize(double diameter) {
    switch (size) {
      case ProfileImagePlaceholderSize.small:
        return 10.0;
      case ProfileImagePlaceholderSize.medium:
        return 14.0;
      case ProfileImagePlaceholderSize.large:
        return 18.0;
      case ProfileImagePlaceholderSize.xlarge:
        return 24.0;
      case ProfileImagePlaceholderSize.xxlarge:
        return 36.0;
    }
  }

  /// 크기에 따른 아이콘 크기 계산
  double _calculateIconSize(double diameter) {
    return diameter * 0.5;
  }
}

/// 프로필 이미지 또는 Placeholder를 표시하는 위젯
///
/// 이미지 URL이 있으면 NetworkImage를 표시하고,
/// 없으면 ProfileImagePlaceHolder를 표시합니다.
class ProfileImageOrPlaceholder extends StatelessWidget {
  /// 이미지 URL (선택사항)
  final String? imageUrl;

  /// 플레이스홀더 크기
  final ProfileImagePlaceholderSize size;

  /// 표시할 이니셜 (선택사항)
  final String? initials;

  /// 배경 색상 (선택사항)
  final Color? backgroundColor;

  /// 텍스트 색상 (선택사항)
  final Color? textColor;

  /// 아이콘 색상 (선택사항)
  final Color? iconColor;

  /// 테두리 표시 여부
  final bool showBorder;

  /// 테두리 색상 (선택사항)
  final Color? borderColor;

  /// 테두리 두께
  final double borderWidth;

  /// 클릭 이벤트 핸들러
  final VoidCallback? onTap;

  /// 이미지 로딩 실패 시 플레이스홀더 표시 여부
  final bool showPlaceholderOnError;

  const ProfileImageOrPlaceholder({
    super.key,
    this.imageUrl,
    this.size = ProfileImagePlaceholderSize.medium,
    this.initials,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.showPlaceholderOnError = true,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return _buildNetworkImage(context);
    } else {
      return _buildPlaceholder(context);
    }
  }

  /// 네트워크 이미지 빌드
  Widget _buildNetworkImage(BuildContext context) {
    final diameter = size.value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: showBorder
              ? Border.all(
                  color: borderColor ?? context.colors.borderPrimary,
                  width: borderWidth,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(diameter / 2),
          child: Image.network(
            imageUrl!,
            width: diameter,
            height: diameter,
            fit: BoxFit.cover,
            errorBuilder: showPlaceholderOnError
                ? (context, error, stackTrace) => _buildPlaceholder(context)
                : null,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return _buildLoadingPlaceholder(context);
            },
          ),
        ),
      ),
    );
  }

  /// 플레이스홀더 빌드
  Widget _buildPlaceholder(BuildContext context) {
    return ProfileImagePlaceHolder(
      size: size,
      initials: initials,
      backgroundColor: backgroundColor,
      textColor: textColor,
      iconColor: iconColor,
      showBorder: showBorder,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onTap: onTap,
    );
  }

  /// 로딩 플레이스홀더 빌드
  Widget _buildLoadingPlaceholder(BuildContext context) {
    final diameter = size.value;

    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? context.backgroundSecondary,
      ),
      child: Center(
        child: SizedBox(
          width: diameter * 0.3,
          height: diameter * 0.3,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(context.brandColor),
          ),
        ),
      ),
    );
  }
}
