# Flutter MVVM 보일러플레이트 가이드

## 🎯 개요

이 프로젝트는 Flutter 앱 개발을 위한 완성도 높은 MVVM 아키텍처 보일러플레이트입니다.

### 1. 프로젝트 생성

```bash
./create_project.sh <패키지_ID> <목적지_경로> [앱_이름]
```

### 2. 인자 설명

- **패키지\_ID** (필수): Flutter 프로젝트의 패키지 ID (도메인 형식)

  - 도메인 역순 형식 사용 (예: `com.example.app`, `kr.company.myapp`)
  - 각 세그먼트는 소문자로 시작
  - 소문자, 숫자, 언더스코어(\_)만 사용 가능
  - Dart 예약어 사용 불가
  - 예: `com.example.myapp`, `kr.zestcorp.seoulution`, `io.github.username.app`

- **목적지\_경로** (필수): 프로젝트를 복사할 경로

  - 절대경로 또는 상대경로 모두 가능
  - 예: `~/projects/my_app`, `./my_app`, `/Users/username/dev/my_app`

- **앱\_이름** (선택): 앱의 표시 이름
  - 생략 시 패키지 ID의 마지막 세그먼트에서 자동 생성 (snake_case → PascalCase)
  - 예: `kr.zestcorp.my_app` → `MyApp`

### 3. 사용 예시

#### 기본 사용 (앱 이름 자동 생성)

```bash
./create_project.sh com.example.myapp ~/projects/my_app
```

결과:

- 패키지 ID: `com.example.myapp`
- 패키지명: `myapp`
- 앱 이름: `Myapp` (자동 생성)

#### 앱 이름 직접 지정

```bash
./create_project.sh kr.zestcorp.seoulution ./seoulution "Seoulution"
```

결과:

- 패키지 ID: `kr.zestcorp.seoulution`
- 패키지명: `seoulution`
- 앱 이름: `Seoulution`

#### 절대경로 사용

```bash
./create_project.sh io.github.username.shopping_cart /Users/username/dev/shopping_cart
```

### 4. 생성 후 다음 단계

프로젝트 생성이 완료되면:

```bash
# 1. 프로젝트 디렉토리로 이동
cd <목적지_경로>

# 2. 의존성 설치
flutter pub get

# 3. 프로젝트 실행
flutter run
```

### 5. 주의사항

- 목적지 경로가 이미 존재하면 에러가 발생합니다
- 패키지 ID는 도메인 역순 형식을 따라야 합니다 (예: `com.company.app`)
- 각 세그먼트는 Dart 명명 규칙을 따라야 합니다
- 스크립트 실행 전 Flutter SDK가 설치되어 있어야 합니다
- macOS, zsh 환경에서 테스트되었습니다

### 6. 제외되는 파일/디렉토리

다음 파일과 디렉토리는 복사되지 않습니다:

- `.git`
- `.dart_tool`
- `build`
- `.flutter-plugins`
- `.flutter-plugins-dependencies`
- `.packages`
- `pubspec.lock`
- `.vscode`
- `.idea`
- `*.iml`
- `create_project.sh` (스크립트 자체)

### 7. 문제 해결

#### "permission denied" 에러

```bash
chmod +x create_project.sh
```

#### 패키지 ID 유효성 에러

- 도메인 역순 형식인지 확인 (예: `com.example.app`)
- 각 세그먼트가 소문자로 시작하는지 확인
- 특수문자 대신 언더스코어(\_) 사용
- Dart 예약어가 아닌지 확인

#### 목적지 경로 에러

- 부모 디렉토리가 존재하는지 확인
- 쓰기 권한이 있는지 확인

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

## 🚀 커스터마이징

### ViewModel 생성

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

### View 생성

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

### 라우트 추가

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

### 5. 색상 변경

`lib/core/theme/seoulution_theme_extension.dart`에서 색상 팔레트 수정

### 6. 컴포넌트 추가

`lib/shared/components/`에 새 컴포넌트 추가

### 7. 서비스 추가

`lib/domain/services/`에 새 서비스 추가 후 DI에 등록
