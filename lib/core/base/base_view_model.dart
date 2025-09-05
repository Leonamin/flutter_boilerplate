import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/shared/components/atoms/toast/toast_util.dart';
import 'package:flutter_boilerplate/shared/components/atoms/toast/toast_type.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';

/// 모든 ViewModel의 기본 클래스
/// GetX의 FullLifeCycleController를 상속받아 생명주기 관리
abstract class BaseViewModel extends FullLifeCycleController
    with FullLifeCycleMixin {
  final BuildContext context;

  BaseViewModel(this.context);

  /// 진행 상태 관리
  final RxBool isOnProgress = false.obs;

  /// 초기화 완료 상태
  final RxBool completedInit = false.obs;

  @override
  void onInit() {
    Logger.info('onInit', tag: '$runtimeType');
    super.onInit();
  }

  @override
  void onClose() {
    Logger.info('onClose', tag: '$runtimeType');
    super.onClose();
  }

  @override
  void onDetached() {
    Logger.info('onDetached', tag: '$runtimeType');
  }

  @override
  void onInactive() {
    Logger.info('onInactive', tag: '$runtimeType');
  }

  @override
  void onPaused() {
    Logger.info('onPaused', tag: '$runtimeType');
  }

  @override
  void onResumed() async {
    Logger.info('onResumed', tag: '$runtimeType');
  }

  @override
  void onHidden() async {
    Logger.info('onHidden', tag: '$runtimeType');
  }

  /// 진행 상태 표시
  void showProgress() {
    isOnProgress.value = true;
  }

  /// 진행 상태 해제
  void dismissProgress() {
    isOnProgress.value = false;
  }

  /// 초기화 완료 표시
  void completeInit() {
    completedInit.value = true;
  }

  /// 키보드 포커스 해제
  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// 성공 토스트 표시
  void showSuccessToast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ToastUtil.showCustom(
      context,
      message,
      ToastType.success,
      duration: duration,
    );
  }

  /// 정보 토스트 표시
  void showInfoToast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ToastUtil.showInfo(context, message, duration: duration);
  }

  /// 경고 토스트 표시
  void showWarningToast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ToastUtil.showWarning(context, message, duration: duration);
  }

  /// 에러 토스트 표시
  void showErrorToast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ToastUtil.showError(context, message, duration: duration);
  }

  /// API 에러 처리
  void handleApiError(
    BuildContext context,
    dynamic error, {
    String? customMessage,
  }) {
    Logger.error('API Error: $error', tag: '$runtimeType');

    final message = customMessage ?? '오류가 발생했습니다. 다시 시도해주세요.';
    showErrorToast(context, message);

    dismissProgress();
  }

  /// 비동기 작업 실행 (진행 상태 자동 관리)
  Future<T?> executeWithProgress<T>(
    BuildContext context,
    Future<T> Function() operation, {
    String? errorMessage,
    bool showProgressIndicator = true,
  }) async {
    try {
      if (showProgressIndicator) showProgress();

      final result = await operation();

      if (showProgressIndicator) dismissProgress();
      return result;
    } catch (error) {
      if (showProgressIndicator) dismissProgress();
      if (!context.mounted) return null;
      handleApiError(context, error, customMessage: errorMessage);
      return null;
    }
  }
}
