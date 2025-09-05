import 'package:flutter/material.dart';
import 'app_button.dart';
import 'icon_button.dart';
import 'button_variant.dart';
import 'button_color.dart';

/// 새로운 버튼 시스템 사용 예시
///
/// 기존 SolidButton의 복잡한 체이닝 대신
/// 새로운 버튼 시스템 사용 예시
class ButtonUsageExamples extends StatelessWidget {
  const ButtonUsageExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Examples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 기본 사용법 - 새로운 API
              const Text('기본 AppButton (새로운 API):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton(
                '기본 버튼',
                onTap: () => debugPrint('기본 버튼 클릭'),
                variant: ButtonVariant.filled,
                color: ButtonColor.brand,
                size: ButtonSize.medium,
              ),
              const SizedBox(height: 16),
          
              // 색상 변형 예시
              const Text('색상 변형:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton(
                'Brand 버튼',
                onTap: () => debugPrint('Brand 버튼 클릭'),
                variant: ButtonVariant.filled,
                color: ButtonColor.brand,
              ),
              const SizedBox(height: 8),
              AppButton(
                'Error 버튼',
                onTap: () => debugPrint('Error 버튼 클릭'),
                variant: ButtonVariant.filled,
                color: ButtonColor.error,
              ),
              const SizedBox(height: 8),
              AppButton(
                'Success 버튼',
                onTap: () => debugPrint('Success 버튼 클릭'),
                variant: ButtonVariant.filled,
                color: ButtonColor.success,
              ),
              const SizedBox(height: 16),
          
              // 변형과 색상 조합
              const Text('변형과 색상 조합:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton(
                'Outlined Warning',
                onTap: () => debugPrint('Outlined Warning 클릭'),
                variant: ButtonVariant.outlined,
                color: ButtonColor.warning,
              ),
              const SizedBox(height: 8),
              AppButton(
                'Text Info',
                onTap: () => debugPrint('Text Info 클릭'),
                variant: ButtonVariant.text,
                color: ButtonColor.info,
              ),
              const SizedBox(height: 16),
          
              // 편의 생성자 (호환성 유지)
              const Text('편의 생성자 (호환성):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton.primary(
                'Primary 버튼',
                onTap: () => debugPrint('Primary 버튼 클릭'),
              ),
              const SizedBox(height: 8),
              AppButton.secondary(
                'Secondary 버튼',
                onTap: () => debugPrint('Secondary 버튼 클릭'),
              ),
              const SizedBox(height: 8),
              AppButton.text(
                'Text 버튼',
                onTap: () => debugPrint('Text 버튼 클릭'),
              ),
              const SizedBox(height: 16),
          
              // 아이콘 포함
              const Text('아이콘 포함:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton(
                '저장',
                onTap: () => debugPrint('저장 클릭'),
                variant: ButtonVariant.filled,
                color: ButtonColor.success,
                leadingIcon: Icons.save,
              ),
              const SizedBox(height: 8),
              AppButton(
                '삭제',
                onTap: () => debugPrint('삭제 클릭'),
                variant: ButtonVariant.outlined,
                color: ButtonColor.error,
                trailingIcon: Icons.delete,
              ),
              const SizedBox(height: 16),
          
              // 크기 변형
              const Text('크기 변형:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton(
                '작은 버튼',
                onTap: () => debugPrint('작은 버튼 클릭'),
                size: ButtonSize.small,
                color: ButtonColor.secondary,
              ),
              const SizedBox(height: 8),
              AppButton(
                '큰 버튼',
                onTap: () => debugPrint('큰 버튼 클릭'),
                size: ButtonSize.large,
                color: ButtonColor.tertiary,
              ),
              const SizedBox(height: 16),
          
              // 전체 너비
              const Text('전체 너비:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppButton(
                '전체 너비 버튼',
                onTap: () => debugPrint('전체 너비 버튼 클릭'),
                fullWidth: true,
                color: ButtonColor.brand,
              ),
              const SizedBox(height: 16),
          
              // 비활성화
              const Text('비활성화:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const AppButton(
                '비활성화 버튼',
                enabled: false,
                color: ButtonColor.brand,
              ),
              const SizedBox(height: 16),
          
              // 아이콘 전용 버튼
              const Text('아이콘 전용:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  AppIconButton(
                    Icons.favorite,
                    onTap: () => debugPrint('좋아요 클릭'),
                  ),
                  const SizedBox(width: 8),
                  AppIconButton(
                    Icons.share,
                    onTap: () => debugPrint('공유 클릭'),
                    variant: ButtonVariant.outlined,
                  ),
                  const SizedBox(width: 8),
                  AppIconButton(
                    Icons.more_vert,
                    onTap: () => debugPrint('더보기 클릭'),
                    variant: ButtonVariant.text,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 기존 SolidButton 사용법과 새로운 방식 비교
/// 
/// 기존 방식 (복잡함):
/// ```dart
/// SolidButton(text: '저장')
///   .primary(context)
///   .large
///   .expand
///   .copyWith(
///     leadingIcon: Icons.save,
///     onTap: () => save(),
///   )
/// ```
/// 
/// 새로운 방식 (단순함):
/// ```dart
/// AppButton.primary(
///   '저장',
///   onTap: () => save(),
///   leadingIcon: Icons.save,
///   size: ButtonSize.large,
///   fullWidth: true,
/// )
/// ```
