import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/core/base/base_view_model.dart';
import 'package:flutter_boilerplate/core/di/service_locator.dart';
import 'package:flutter_boilerplate/domain/services/auth/auth_service.dart';

/// 인증 관련 ViewModel
class AuthViewModel extends BaseViewModel {
  late final AuthService _authService;

  // 폼 컨트롤러들
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  // 상태 관리
  final RxBool isLoginMode = true.obs;
  final RxBool obscurePassword = true.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString nameError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _authService = service<AuthService>();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }

  /// 로그인/회원가입 모드 전환
  void toggleMode() {
    isLoginMode.value = !isLoginMode.value;
    _clearErrors();
  }

  /// 비밀번호 표시/숨김 토글
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// 로그인 처리
  Future<void> login(BuildContext context) async {
    if (!_validateLoginForm()) return;

    final result = await executeWithProgress(
      context,
      () => _authService.login(
        emailController.text.trim(),
        passwordController.text,
      ),
      errorMessage: '로그인에 실패했습니다.',
    );

    if (result != null && result.isSuccess) {
      showSuccessToast(context, '로그인되었습니다.');
      // TODO: 메인 화면으로 이동
      // Get.offAllNamed('/home');
    } else if (result != null && result.message != null) {
      showErrorToast(context, result.message!);
    }
  }

  /// 회원가입 처리
  Future<void> register(BuildContext context) async {
    if (!_validateRegisterForm()) return;

    final result = await executeWithProgress(
      context,
      () => _authService.register(
        emailController.text.trim(),
        passwordController.text,
        nameController.text.trim(),
      ),
      errorMessage: '회원가입에 실패했습니다.',
    );

    if (result != null && result.isSuccess) {
      showSuccessToast(context, '회원가입이 완료되었습니다.');
      // 로그인 모드로 전환
      isLoginMode.value = true;
      _clearForm();
    } else if (result != null && result.message != null) {
      showErrorToast(context, result.message!);
    }
  }

  /// 로그아웃 처리
  Future<void> logout(BuildContext context) async {
    final success = await executeWithProgress(
      context,
      () => _authService.logout(),
      errorMessage: '로그아웃에 실패했습니다.',
    );

    if (success == true) {
      showSuccessToast(context, '로그아웃되었습니다.');
      // TODO: 로그인 화면으로 이동
      // Get.offAllNamed('/login');
    }
  }

  /// 로그인 폼 유효성 검사
  bool _validateLoginForm() {
    bool isValid = true;
    _clearErrors();

    if (emailController.text.trim().isEmpty) {
      emailError.value = '이메일을 입력해주세요.';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = '올바른 이메일 형식이 아닙니다.';
      isValid = false;
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = '비밀번호를 입력해주세요.';
      isValid = false;
    }

    return isValid;
  }

  /// 회원가입 폼 유효성 검사
  bool _validateRegisterForm() {
    bool isValid = true;
    _clearErrors();

    if (emailController.text.trim().isEmpty) {
      emailError.value = '이메일을 입력해주세요.';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = '올바른 이메일 형식이 아닙니다.';
      isValid = false;
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = '비밀번호를 입력해주세요.';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = '비밀번호는 6자 이상이어야 합니다.';
      isValid = false;
    }

    if (nameController.text.trim().isEmpty) {
      nameError.value = '이름을 입력해주세요.';
      isValid = false;
    }

    return isValid;
  }

  /// 에러 메시지 초기화
  void _clearErrors() {
    emailError.value = '';
    passwordError.value = '';
    nameError.value = '';
  }

  /// 폼 초기화
  void _clearForm() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    _clearErrors();
  }
}
