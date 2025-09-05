import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';
import 'package:flutter_boilerplate/features/auth/view_models/auth_view_model.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/app_text_field.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/text_field_variant.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/text_field_size.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/app_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/buttons/button_variant.dart';

/// 인증 화면 (로그인/회원가입)
class AuthView extends GetView<AuthViewModel> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 60),
                      _buildHeader(context),
                      const SizedBox(height: 48),
                      _buildForm(context),
                      const SizedBox(height: 24),
                      _buildSubmitButton(context),
                      const SizedBox(height: 16),
                      _buildModeToggle(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 헤더 섹션
  Widget _buildHeader(BuildContext context) {
    return Obx(() => Column(
      children: [
        Text(
          controller.isLoginMode.value ? '로그인' : '회원가입',
          style: context.textStyles.header1.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          controller.isLoginMode.value 
            ? '환영합니다' 
            : '새로운 계정을 만들어보세요',
          style: context.textStyles.body.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    ));
  }

  /// 폼 섹션
  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        // 이름 필드 (회원가입 시에만)
        Obx(() => controller.isLoginMode.value 
          ? const SizedBox.shrink()
          : Column(
              children: [
                AppTextField(
                  controller: controller.nameController,
                  labelText: '이름',
                  hintText: '이름을 입력하세요',
                  variant: TextFieldVariant.outline,
                  size: TextFieldSize.large,
                  errorText: controller.nameError.value.isEmpty 
                    ? null 
                    : controller.nameError.value,
                ),
                const SizedBox(height: 16),
              ],
            ),
        ),
        
        // 이메일 필드
        Obx(() => AppTextField(
          controller: controller.emailController,
          labelText: '이메일',
          hintText: '이메일을 입력하세요',
          variant: TextFieldVariant.outline,
          size: TextFieldSize.large,
          keyboardType: TextInputType.emailAddress,
          errorText: controller.emailError.value.isEmpty 
            ? null 
            : controller.emailError.value,
        )),
        
        const SizedBox(height: 16),
        
        // 비밀번호 필드
        Obx(() => AppTextField(
          controller: controller.passwordController,
          labelText: '비밀번호',
          hintText: '비밀번호를 입력하세요',
          variant: TextFieldVariant.outline,
          size: TextFieldSize.large,
          obscureText: controller.obscurePassword.value,
          suffixIcon: IconButton(
            icon: Icon(
              controller.obscurePassword.value 
                ? Icons.visibility_off 
                : Icons.visibility,
              color: context.colors.textSecondary,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
          errorText: controller.passwordError.value.isEmpty 
            ? null 
            : controller.passwordError.value,
        )),
      ],
    );
  }

  /// 제출 버튼
  Widget _buildSubmitButton(BuildContext context) {
    return Obx(() => AppButton.primary(
      controller.isLoginMode.value ? '로그인' : '회원가입',
      onTap: controller.isOnProgress.value 
        ? null 
        : () {
            if (controller.isLoginMode.value) {
              controller.login(context);
            } else {
              controller.register(context);
            }
          },
      size: ButtonSize.large,
      fullWidth: true,
      enabled: !controller.isOnProgress.value,
    ));
  }

  /// 모드 전환 버튼
  Widget _buildModeToggle(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          controller.isLoginMode.value 
            ? '계정이 없으신가요? ' 
            : '이미 계정이 있으신가요? ',
          style: context.textStyles.body.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: controller.toggleMode,
          child: Text(
            controller.isLoginMode.value ? '회원가입' : '로그인',
            style: context.textStyles.body.copyWith(
              color: context.colors.textBrand,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ));
  }
}
