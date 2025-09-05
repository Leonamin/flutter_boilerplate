import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/app_text_field.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/text_field_variant.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/text_field_color.dart';
import 'package:flutter_boilerplate/shared/components/atoms/text_fields/text_field_size.dart';

/// TextField 사용 예제 페이지
class TextFieldUsageExamples extends StatefulWidget {
  const TextFieldUsageExamples({super.key});

  @override
  State<TextFieldUsageExamples> createState() => _TextFieldUsageExamplesState();
}

class _TextFieldUsageExamplesState extends State<TextFieldUsageExamples> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  
  bool _isPasswordVisible = false;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = '이메일을 입력해주세요';
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        _emailError = '올바른 이메일 형식이 아닙니다';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordError = '비밀번호를 입력해주세요';
      } else if (value.length < 6) {
        _passwordError = '비밀번호는 6자 이상이어야 합니다';
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Variants'),
            _buildVariantExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Sizes'),
            _buildSizeExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Colors & States'),
            _buildColorStateExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('With Icons'),
            _buildIconExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Interactive Examples'),
            _buildInteractiveExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Multiline'),
            _buildMultilineExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildVariantExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Outline',
          AppTextField(
            variant: TextFieldVariant.outline,
            labelText: 'Outline TextField',
            hintText: '텍스트를 입력하세요',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Underline',
          AppTextField(
            variant: TextFieldVariant.underline,
            labelText: 'Underline TextField',
            hintText: '텍스트를 입력하세요',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Filled',
          AppTextField(
            variant: TextFieldVariant.filled,
            labelText: 'Filled TextField',
            hintText: '텍스트를 입력하세요',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Labeled Box',
          AppTextField(
            variant: TextFieldVariant.labeledBox,
            labelText: 'Labeled Box TextField',
            hintText: '텍스트를 입력하세요',
          ),
        ),
      ],
    );
  }

  Widget _buildSizeExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Small',
          AppTextField(
            size: TextFieldSize.small,
            labelText: 'Small Size',
            hintText: '작은 크기',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Medium',
          AppTextField(
            size: TextFieldSize.medium,
            labelText: 'Medium Size',
            hintText: '중간 크기',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Large',
          AppTextField(
            size: TextFieldSize.large,
            labelText: 'Large Size',
            hintText: '큰 크기',
          ),
        ),
      ],
    );
  }

  Widget _buildColorStateExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Primary',
          AppTextField(
            color: TextFieldColor.primary,
            labelText: 'Primary Color',
            hintText: '기본 색상',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Error',
          AppTextField(
            color: TextFieldColor.error,
            labelText: 'Error Color',
            hintText: '에러 색상',
            errorText: '에러가 발생했습니다',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Disabled',
          AppTextField(
            enabled: false,
            labelText: 'Disabled',
            hintText: '비활성화 상태',
          ),
        ),
      ],
    );
  }

  Widget _buildIconExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Prefix Icon',
          AppTextField(
            labelText: 'Search',
            hintText: '검색어를 입력하세요',
            prefixIcon: const Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Suffix Icon',
          AppTextField(
            labelText: 'Email',
            hintText: 'example@email.com',
            suffixIcon: const Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Both Icons',
          AppTextField(
            labelText: 'Username',
            hintText: '사용자명을 입력하세요',
            prefixIcon: const Icon(Icons.person),
            suffixIcon: const Icon(Icons.check_circle),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Email Validation',
          AppTextField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'example@email.com',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
            errorText: _emailError,
            onChanged: _validateEmail,
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Password Toggle',
          AppTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: '비밀번호를 입력하세요',
            obscureText: !_isPasswordVisible,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onSuffixIconPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            errorText: _passwordError,
            onChanged: _validatePassword,
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Search with Clear',
          AppTextField(
            controller: _searchController,
            labelText: 'Search',
            hintText: '검색어를 입력하세요',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _searchController.text.isNotEmpty 
                ? const Icon(Icons.clear) 
                : null,
            onSuffixIconPressed: _searchController.text.isNotEmpty 
                ? () {
                    setState(() {
                      _searchController.clear();
                    });
                  }
                : null,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMultilineExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Multiline Outline',
          AppTextField(
            variant: TextFieldVariant.outline,
            controller: _messageController,
            labelText: 'Message',
            hintText: '메시지를 입력하세요',
            maxLines: 4,
            minLines: 2,
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Multiline Filled',
          AppTextField(
            variant: TextFieldVariant.filled,
            labelText: 'Description',
            hintText: '설명을 입력하세요',
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  Widget _buildExampleRow(String title, Widget textField) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: textField),
      ],
    );
  }
}
