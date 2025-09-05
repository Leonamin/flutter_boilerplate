# Flutter MVVM 보일러플레이트 가이드

## 🎯 개요

이 프로젝트는 Flutter 앱 개발을 위한 완성도 높은 MVVM 아키텍처 보일러플레이트입니다.

## 🏗️ 아키텍처

### 핵심 기술 스택

- **상태 관리**: GetX
- **네비게이션**: go_router
- **아키텍처**: MVVM 패턴
- **의존성 주입**: GetX DI
- **테마**: Material 3 + 커스텀 테마

### 프로젝트 구조

```
lib/
├── core/                     # 핵심 기능
│   ├── base/                # BaseViewModel 등 기본 클래스
│   ├── constants/           # 상수 정의
│   ├── di/                  # 의존성 주입
│   ├── extensions/          # 확장 메서드
│   ├── routes/              # go_router 설정
│   ├── theme/               # 테마 설정
│   └── utils/               # 유틸리티
├── data/                    # 데이터 레이어
│   └── repositories/        # 리포지토리
├── domain/                  # 도메인 레이어
│   └── services/            # 서비스
├── features/                # 기능별 모듈
│   ├── auth/               # 인증 기능
│   └── splash/             # 스플래시 기능
└── shared/                  # 공통 컴포넌트
    └── components/
        └── atoms/           # 기본 위젯들
```

## 🔧 포함된 기능

### 1. 기본 컴포넌트

- **AppButton**: 다양한 스타일의 버튼
- **ToastUtil**: 간편한 토스트 메시지
- **DialogUtil**: 커스터마이징 가능한 다이얼로그
- **BottomSheetUtil**: 유연한 바텀시트
- **AppDropdown**: 드롭다운 컴포넌트

### 2. 네비게이션 시스템

- **AppRouteType**: 타입 안전한 라우트 정의
- **AppNavigator**: 편리한 네비게이션 메서드
- **AppRouterManager**: 라우터 상태 관리

### 3. MVVM 아키텍처

- **BaseViewModel**: 공통 기능을 제공하는 기본 ViewModel
- **의존성 주입**: GetX 기반 DI 시스템
- **상태 관리**: 반응형 상태 관리

### 4. 테마 시스템

- **라이트/다크 모드**: 자동 테마 전환
- **커스텀 색상**: 프로젝트별 색상 팔레트
- **타이포그래피**: 일관된 텍스트 스타일

## 🚀 새 프로젝트 시작하기

### 1. 프로젝트 설정

```bash
# 1. 보일러플레이트 클론
git clone <boilerplate-repo> my-new-project
cd my-new-project

# 2. 패키지명 변경
find . -name "*.dart" -exec sed -i '' 's/flutter_boilerplate/my_new_project/g' {} \;

# 3. pubspec.yaml 수정
# name: my_new_project
# description: "My New Flutter Project"

# 4. 의존성 설치
flutter pub get
```

### 2. 기본 사용법

#### ViewModel 생성

```dart
class HomeViewModel extends BaseViewModel {
  final RxString title = '홈'.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    await executeWithProgress(
      Get.context!,
      () async {
        // API 호출 등
      },
    );
  }
}
```

#### View 생성

```dart
class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text(controller.title.value)),
            body: Column(
            children: [
                    AppButton(
                      '버튼',
                      onTap: () => controller.someAction(),
                    ),
                ],
            ),
        );
  }
}
```

#### 라우트 추가

```dart
// 1. AppRouteType에 추가
enum AppRouteType {
  home,
  // ...
}

// 2. 경로 정의
class AppRoutePaths {
  static const String home = '/home';
  // ...
}

// 3. 라우터에 추가
GoRoute(
  path: AppRouteType.home.path,
  name: AppRouteType.home.name,
  builder: (context, state) {
    return const HomeView();
  },
),
```

## 💡 베스트 프랙티스

### 1. ViewModel 패턴

- 비즈니스 로직은 ViewModel에 구현
- View는 UI 렌더링에만 집중
- `executeWithProgress`로 로딩 상태 자동 관리

### 2. 네비게이션

- `AppNavigator`의 정적 메서드 사용
- 타입 안전한 라우트 네비게이션
- 결과가 필요한 경우 `Future<T>` 반환

### 3. 컴포넌트 사용

```dart
// 토스트
ToastUtil.showSuccess(context, '성공했습니다');

// 다이얼로그
DialogUtil.showConfirm(
  context: context,
  title: '확인',
  content: '정말 삭제하시겠습니까?',
  onConfirm: () => deleteItem(),
);

// 바텀시트
BottomSheetUtil.showSelection<String>(
  context: context,
  title: '옵션 선택',
  options: options,
);
```

### 4. 테마 사용

```dart
// 색상
context.colors.textPrimary
context.colors.backgroundPrimary

// 텍스트 스타일
context.textStyles.header1
context.textStyles.body
```

## 🔄 커스터마이징

### 1. 색상 변경

`lib/core/theme/seoulution_theme_extension.dart`에서 색상 팔레트 수정

### 2. 컴포넌트 추가

`lib/shared/components/atoms/`에 새 컴포넌트 추가

### 3. 서비스 추가

`lib/domain/services/`에 새 서비스 추가 후 DI에 등록
