# 컴포넌트 구조 가이드

## 📁 디렉토리 구조

```
lib/
├── shared/                     # 공통 컴포넌트 (앱 전체에서 재사용)
│   ├── components/
│   │   ├── atoms/             # 원자 단위 컴포넌트 (가장 작은 단위)
│   │   │   ├── buttons/       # 버튼 관련
│   │   │   ├── inputs/        # 입력 필드 관련
│   │   │   ├── icons/         # 아이콘 관련
│   │   │   ├── badges/        # 배지, 태그 관련
│   │   │   └── indicators/    # 로딩, 프로그레스 등
│   │   ├── molecules/         # 분자 단위 컴포넌트 (atoms 조합)
│   │   │   ├── cards/         # 카드 컴포넌트들
│   │   │   ├── forms/         # 폼 관련 컴포넌트
│   │   │   ├── lists/         # 리스트 아이템들
│   │   │   ├── navigation/    # 네비게이션 관련
│   │   │   └── media/         # 이미지, 비디오 관련
│   │   ├── organisms/         # 유기체 단위 컴포넌트 (복합 기능)
│   │   │   ├── headers/       # 헤더, 앱바 관련
│   │   │   ├── footers/       # 푸터 관련
│   │   │   ├── sidebars/      # 사이드바, 드로어
│   │   │   ├── modals/        # 모달, 다이얼로그
│   │   │   └── sections/      # 섹션 단위 컴포넌트
│   │   └── templates/         # 템플릿 (페이지 레이아웃)
│   │       ├── layouts/       # 기본 레이아웃들
│   │       ├── pages/         # 페이지 템플릿
│   │       └── wrappers/      # 래퍼 컴포넌트들
│   └── widgets/               # 특수 목적 위젯
│       ├── animations/        # 애니메이션 위젯
│       ├── gestures/          # 제스처 관련
│       └── utilities/         # 유틸리티 위젯
├── features/                  # 기능별 컴포넌트 (특정 기능에서만 사용)
│   ├── auth/
│   │   └── components/        # 인증 관련 전용 컴포넌트
│   ├── booking/
│   │   └── components/        # 예약 관련 전용 컴포넌트
│   └── home/
│       └── components/        # 홈 관련 전용 컴포넌트
└── view/                      # 페이지 뷰 (기존 구조 유지)
    └── pages/
```

## 🎯 컴포넌트 분류 기준

### 1. **Atomic Design 기반 분류**

#### **Atoms (원자)**
- 가장 작은 단위의 UI 컴포넌트
- 더 이상 분해할 수 없는 기본 요소
- 예: Button, Input, Icon, Text, Image

#### **Molecules (분자)**
- 2개 이상의 Atoms를 조합한 컴포넌트
- 특정 기능을 수행하는 UI 그룹
- 예: SearchBar, FormField, ListItem, Card

#### **Organisms (유기체)**
- Molecules와 Atoms를 조합한 복합 컴포넌트
- 독립적인 기능 단위
- 예: Header, Navigation, Modal, Section

#### **Templates (템플릿)**
- 페이지의 레이아웃을 정의
- 컨텐츠 배치 구조만 제공
- 예: PageLayout, GridLayout, ListLayout

### 2. **재사용성 기반 분류**

#### **Shared Components**
- 앱 전체에서 재사용되는 컴포넌트
- 도메인에 독립적
- 높은 재사용성과 일관성 필요

#### **Feature Components**
- 특정 기능/도메인에서만 사용
- 해당 기능에 특화된 로직 포함
- 기능별 폴더에 위치

### 3. **복잡도 기반 분류**

#### **Simple Components**
- 단순한 UI 표시 역할
- 상태를 거의 가지지 않음
- Atoms, 일부 Molecules

#### **Complex Components**
- 복잡한 로직과 상태 관리
- 여러 하위 컴포넌트 조합
- Organisms, Templates

## 📝 네이밍 컨벤션

### 파일명
- **PascalCase** 사용
- 기능을 명확히 표현
- 접미사로 컴포넌트 타입 표시 (선택사항)

```dart
// Good
DefaultButton.dart
SearchInput.dart
BookingCard.dart
UserProfileHeader.dart

// Avoid
button.dart
search_input.dart
card1.dart
```

### 클래스명
- 파일명과 동일한 **PascalCase**
- 명확하고 설명적인 이름

```dart
class DefaultButton extends StatelessWidget { }
class BookingStatusCard extends StatelessWidget { }
class UserProfileHeader extends StatefulWidget { }
```

### 디렉토리명
- **snake_case** 또는 **kebab-case**
- 복수형 사용 (컴포넌트 그룹을 나타내므로)

```
buttons/
input_fields/
navigation_bars/
```

## 🔄 마이그레이션 가이드

현재 `view/component/appbar/default_app_bar.dart`를 새 구조로 이동:

**Before:**
```
lib/view/component/appbar/default_app_bar.dart
```

**After:**
```
lib/shared/components/organisms/headers/default_app_bar.dart
```

**이유:**
- AppBar는 복합 기능을 가진 Organism
- 앱 전체에서 재사용되므로 Shared
- Header 카테고리에 속함

## 📋 컴포넌트 작성 가이드

### 1. **Props 정의**
```dart
class MyComponent extends StatelessWidget {
  // Required props (positional)
  final String title;
  
  // Optional props (named with defaults)
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool isEnabled;
  
  const MyComponent(
    this.title, {
    super.key,
    this.onTap,
    this.backgroundColor,
    this.isEnabled = true,
  });
}
```

### 2. **Factory Constructors**
```dart
// 자주 사용되는 변형에 대한 팩토리
factory MyComponent.primary(String title) {
  return MyComponent(
    title,
    backgroundColor: Colors.blue,
    isEnabled: true,
  );
}
```

### 3. **문서화**
```dart
/// 기본 버튼 컴포넌트
/// 
/// 앱 전체에서 사용되는 표준 버튼입니다.
/// 
/// Example:
/// ```dart
/// DefaultButton(
///   '저장',
///   onTap: () => save(),
/// )
/// ```
class DefaultButton extends StatelessWidget {
  /// 버튼에 표시될 텍스트
  final String text;
  
  /// 버튼 클릭 시 실행될 콜백
  final VoidCallback? onTap;
}
```

## 🎨 스타일링 가이드

### Theme 활용
```dart
// Good - 테마 시스템 활용
Container(
  color: context.backgroundPrimary,
  child: Text(
    'Hello',
    style: context.textStyles.body.primary(context),
  ),
)

// Avoid - 하드코딩
Container(
  color: Colors.white,
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 16, color: Colors.black),
  ),
)
```

### 반응형 고려
```dart
// 화면 크기에 따른 조건부 렌더링
Widget build(BuildContext context) {
  final isTablet = MediaQuery.of(context).size.width > 768;
  
  return isTablet 
    ? TabletLayout(child: content)
    : MobileLayout(child: content);
}
```
