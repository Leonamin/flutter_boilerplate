import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'toast_type.dart';

/// 토스트 메시지를 표시하는 유틸리티 클래스
class ToastUtil {
  static FToast? _fToast;

  /// FToast 초기화
  static void init(BuildContext context) {
    _fToast = FToast();
    _fToast!.init(context);
  }

  /// 정보 토스트 표시
  static void showInfo(
    BuildContext context,
    String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration? duration,
  }) {
    _showToast(
      context,
      message,
      ToastType.info,
      gravity: gravity,
      duration: duration,
    );
  }

  /// 경고 토스트 표시
  static void showWarning(
    BuildContext context,
    String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration? duration,
  }) {
    _showToast(
      context,
      message,
      ToastType.warning,
      gravity: gravity,
      duration: duration,
    );
  }

  /// 에러 토스트 표시
  static void showError(
    BuildContext context,
    String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration? duration,
  }) {
    _showToast(
      context,
      message,
      ToastType.error,
      gravity: gravity,
      duration: duration,
    );
  }

  /// 커스텀 토스트 표시
  static void showCustom(
    BuildContext context,
    String message,
    ToastType type, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration? duration,
  }) {
    _showToast(context, message, type, gravity: gravity, duration: duration);
  }

  /// 내부 토스트 표시 메서드
  static void _showToast(
    BuildContext context,
    String message,
    ToastType type, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration? duration,
  }) {
    if (_fToast == null) {
      // FToast가 초기화되지 않은 경우 기본 토스트 사용
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        backgroundColor: type.backgroundColor(context),
        textColor: type.textColor(context),
      );
      return;
    }

    final toast = _buildToastWidget(context, message, type);

    _fToast!.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: duration ?? const Duration(seconds: 3),
    );
  }

  /// 토스트 위젯 생성
  static Widget _buildToastWidget(
    BuildContext context,
    String message,
    ToastType type,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: type.backgroundColor(context),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: type.color(context), width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(type.icon, color: type.color(context), size: 20.0),
          const SizedBox(width: 12.0),
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: type.textColor(context),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 모든 토스트 제거
  static void removeAll() {
    _fToast?.removeCustomToast();
  }

  /// 간단한 토스트 표시 (기본 fluttertoast 사용)
  static void showSimple(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
