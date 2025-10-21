import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'text_field_variant.dart';
import 'text_field_color.dart';
import 'text_field_size.dart';

/// 커스텀 텍스트 필드
class AppTextField extends StatefulWidget {
  /// 텍스트 필드 스타일 variant
  final TextFieldVariant variant;

  /// 텍스트 필드 색상
  final TextFieldColor color;

  /// 텍스트 필드 크기
  final TextFieldSize size;

  /// 텍스트 컨트롤러
  final TextEditingController? controller;

  /// 라벨 텍스트
  final String? labelText;

  /// 힌트 텍스트
  final String? hintText;

  /// 에러 텍스트
  final String? errorText;

  /// 좌측 아이콘
  final Widget? prefixIcon;

  /// 우측 아이콘
  final Widget? suffixIcon;

  /// 좌측 아이콘 버튼 콜백
  final VoidCallback? onPrefixIconPressed;

  /// 우측 아이콘 버튼 콜백
  final VoidCallback? onSuffixIconPressed;

  /// 텍스트 입력 타입
  final TextInputType? keyboardType;

  /// 텍스트 입력 액션
  final TextInputAction? textInputAction;

  /// 비밀번호 필드 여부
  final bool obscureText;

  /// 활성화 여부
  final bool enabled;

  /// 읽기 전용 여부
  final bool readOnly;

  /// 최대 라인 수
  final int? maxLines;

  /// 최소 라인 수
  final int? minLines;

  /// 최대 길이
  final int? maxLength;

  /// 입력 포맷터
  final List<TextInputFormatter>? inputFormatters;

  /// 텍스트 변경 콜백
  final ValueChanged<String>? onChanged;

  /// 제출 콜백
  /// (Web) Enter 키를 눌렀을 때 호출안됨
  final ValueChanged<String>? onSubmitted;

  /// 텍스트 입력 완료 콜백
  /// (Web) Enter 키를 눌렀을 때 호출
  /// (Mobile) 텍스트 입력 완료 버튼을 눌렀을 때 호출
  final VoidCallback? onEditingComplete;

  /// 포커스 노드
  final FocusNode? focusNode;

  /// 자동 포커스
  final bool autofocus;

  const AppTextField({
    super.key,
    this.variant = TextFieldVariant.outline,
    this.color = TextFieldColor.primary,
    this.size = TextFieldSize.medium,
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onPrefixIconPressed,
    this.onSuffixIconPressed,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _hasError = widget.errorText != null;
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.errorText != widget.errorText) {
      _hasError = widget.errorText != null;
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = widget.color.getColorScheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [_buildTextField(colorScheme)],
    );
  }

  Widget _buildTextField(TextFieldColorScheme colorScheme) {
    final currentBorderColor = _getCurrentBorderColor(colorScheme);
    final currentBackgroundColor = _getCurrentBackgroundColor(colorScheme);
    final currentTextColor = _getCurrentTextColor(colorScheme);
    final currentLabelColor = _getCurrentLabelColor(colorScheme);
    final currentIconColor = _getCurrentIconColor(colorScheme);

    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      autofocus: widget.autofocus,
      style: TextStyle(fontSize: widget.size.fontSize, color: currentTextColor),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.errorText,
        prefixIcon: _buildPrefixIcon(currentIconColor),
        suffixIcon: _buildSuffixIcon(currentIconColor),
        filled: widget.variant.needsBackgroundColor,
        fillColor: currentBackgroundColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.size.horizontalPadding,
          vertical: widget.size.verticalPadding,
        ),
        isDense: true,
        border: widget.variant.getBorder(
          borderColor: currentBorderColor,
          borderWidth: widget.size.borderWidth,
          borderRadius: widget.size.borderRadius,
        ),
        enabledBorder: widget.variant.getBorder(
          borderColor: currentBorderColor,
          borderWidth: widget.size.borderWidth,
          borderRadius: widget.size.borderRadius,
        ),
        focusedBorder: widget.variant.getBorder(
          borderColor: colorScheme.focusedBorderColor,
          borderWidth: widget.size.borderWidth,
          borderRadius: widget.size.borderRadius,
        ),
        errorBorder: widget.variant.getBorder(
          borderColor: colorScheme.errorBorderColor,
          borderWidth: widget.size.borderWidth,
          borderRadius: widget.size.borderRadius,
        ),
        focusedErrorBorder: widget.variant.getBorder(
          borderColor: colorScheme.errorBorderColor,
          borderWidth: widget.size.borderWidth,
          borderRadius: widget.size.borderRadius,
        ),
        disabledBorder: widget.variant.getBorder(
          borderColor: colorScheme.disabledBorderColor,
          borderWidth: widget.size.borderWidth,
          borderRadius: widget.size.borderRadius,
        ),
        labelStyle: TextStyle(
          fontSize: widget.size.fontSize * 0.85,
          color: currentLabelColor,
        ),
        hintStyle: TextStyle(
          fontSize: widget.size.fontSize,
          color: colorScheme.hintColor,
        ),
        errorStyle: TextStyle(
          fontSize: widget.size.fontSize * 0.75,
          color: colorScheme.errorTextColor,
        ),
        errorMaxLines: 1,
        floatingLabelBehavior: widget.variant.isFloatingLabel
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
      ),
    );
  }

  Widget? _buildPrefixIcon(Color iconColor) {
    if (widget.prefixIcon == null) return null;

    if (widget.onPrefixIconPressed != null) {
      return IconButton(
        icon: widget.prefixIcon!,
        onPressed: widget.enabled ? widget.onPrefixIconPressed : null,
        iconSize: widget.size.iconSize,
        color: iconColor,
        splashRadius: widget.size.iconSize * 0.75,
      );
    }

    return IconTheme(
      data: IconThemeData(color: iconColor, size: widget.size.iconSize),
      child: widget.prefixIcon!,
    );
  }

  Widget? _buildSuffixIcon(Color iconColor) {
    if (widget.suffixIcon == null) return null;

    if (widget.onSuffixIconPressed != null) {
      return IconButton(
        icon: widget.suffixIcon!,
        onPressed: widget.enabled ? widget.onSuffixIconPressed : null,
        iconSize: widget.size.iconSize,
        color: iconColor,
        splashRadius: widget.size.iconSize * 0.75,
      );
    }

    return IconTheme(
      data: IconThemeData(color: iconColor, size: widget.size.iconSize),
      child: widget.suffixIcon!,
    );
  }

  Color _getCurrentBorderColor(TextFieldColorScheme colorScheme) {
    if (!widget.enabled) return colorScheme.disabledBorderColor;
    if (_hasError) return colorScheme.errorBorderColor;
    if (_isFocused) return colorScheme.focusedBorderColor;
    return colorScheme.borderColor;
  }

  Color _getCurrentBackgroundColor(TextFieldColorScheme colorScheme) {
    if (!widget.enabled) return colorScheme.disabledBackgroundColor;
    if (_hasError) return colorScheme.errorBackgroundColor;
    if (_isFocused) return colorScheme.focusedBackgroundColor;
    return colorScheme.backgroundColor;
  }

  Color _getCurrentTextColor(TextFieldColorScheme colorScheme) {
    if (!widget.enabled) return colorScheme.disabledTextColor;
    if (_hasError) return colorScheme.errorTextColor;
    if (_isFocused) return colorScheme.focusedTextColor;
    return colorScheme.textColor;
  }

  Color _getCurrentLabelColor(TextFieldColorScheme colorScheme) {
    if (!widget.enabled) return colorScheme.disabledLabelColor;
    if (_hasError) return colorScheme.errorLabelColor;
    if (_isFocused) return colorScheme.focusedLabelColor;
    return colorScheme.labelColor;
  }

  Color _getCurrentIconColor(TextFieldColorScheme colorScheme) {
    if (!widget.enabled) return colorScheme.disabledIconColor;
    if (_hasError) return colorScheme.errorIconColor;
    if (_isFocused) return colorScheme.focusedIconColor;
    return colorScheme.iconColor;
  }
}
