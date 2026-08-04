# Flutter Boilerplate

1~2명의 개발자와 여러 AI 에이전트가 함께 작업하기 위한 작은 Flutter 기준선입니다. GetX와 범용 base class를 제거하고 Riverpod 3, typed go_router, Freezed 3, feature-first 경계만 남겼습니다.

## Stack

- Flutter 3.44.7 / Dart 3.12.2, FVM 고정
- flutter_riverpod 3.4.2
- go_router 17.3.0 + go_router_builder 4.4.0
- freezed 3.2.5
- Material 3, Flutter gen-l10n

Riverpod generator를 쓰지 않는 이유는 [stable code-generation ADR](docs/architecture/adr/0002-stable-code-generation-matrix.md)에 기록되어 있습니다.

## 시작

```bash
dart pub global activate fvm
fvm install
fvm flutter pub get
fvm flutter gen-l10n
fvm dart run build_runner build
fvm flutter run
```

샘플 인증은 backend가 없는 결정적 `InMemoryAuthRepository`입니다. development에서만 활성화되며 이메일 형식과 8자 이상 비밀번호로 로그인할 수 있습니다. staging/production은 실제 adapter가 연결될 때까지 fail-fast합니다. 실제 인증 SDK를 붙일 때는 `AuthRepository` port를 구현하고 `app/bootstrap_bindings.dart`의 binding을 교체합니다.

환경값은 compile-time define으로 전달합니다.

```bash
fvm flutter run \
  --dart-define=APP_ENV=staging \
  --dart-define=API_BASE_URL=https://api.example.com
```

## 새 프로젝트 생성

```bash
./create_project.sh com.example.my_app ../my_app "My App"
```

스크립트는 Flutter platform shell을 새 package ID로 생성하고, 보일러플레이트 source/config를 복사한 뒤 codegen, analyze, test까지 수행합니다. 목적지 경로는 존재하지 않아야 합니다.

## 검증

```bash
fvm dart format --output=none --set-exit-if-changed lib test
fvm flutter analyze --fatal-infos
fvm flutter test
fvm flutter build web --release
```

구조와 의존성 규칙은 [Architecture](docs/architecture/README.md), 에이전트 병렬 작업 규칙은 [AGENTS.md](AGENTS.md)를 기준으로 합니다. 생성 코드는 직접 수정하지 않고 integration owner가 한 번에 재생성합니다.
