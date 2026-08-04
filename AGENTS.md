# Agent Working Agreement

이 저장소는 1~2명의 개발자가 여러 AI 에이전트와 동시에 작업하는 상황을 기준으로 한다.

## 작업 경계

- 기능 작업자는 `lib/features/<feature>/**`와 `test/features/<feature>/**`만 소유한다.
- 통합 작업자 한 명만 `pubspec.*`, `lib/app/**`, `lib/generated/**`, 라우터, bootstrap을 수정한다.
- 공용 UI 변경은 먼저 호출부를 확인하고 `lib/shared/ui/**` 소유권을 명시한 뒤 진행한다.
- 서로 다른 feature를 직접 import하지 않는다. 공유가 필요하면 작고 중립적인 계약만 `core` 또는 `shared`로 승격한다.
- 사용자 변경이 있는 파일은 덮어쓰지 않고 통합 작업자에게 충돌을 보고한다.

## 구조 규칙

- 의존성 방향은 `presentation -> application -> domain` 및 `data -> domain`이다.
- `domain`은 Flutter, Riverpod, router를 import하지 않는다.
- repository interface는 domain, 구현은 같은 feature의 data, binding은 app bootstrap에 둔다.
- 화면 이동과 SnackBar 같은 UI effect는 presentation에서만 수행한다.
- `core`와 `shared`는 feature를 import하지 않는다.
- GetX, service locator, base ViewModel을 다시 추가하지 않는다.

## 생성 코드

- `lib` 내부 라이브러리 간 import는 현재 패키지의 `package:` URI를 사용한다.
- 상대 경로는 `part`와 `part of` 지시문에만 사용한다.
- `*.freezed.dart`, `*.g.dart`, `lib/generated/l10n/**`는 직접 수정하지 않는다.
- 통합 작업자만 `fvm dart run build_runner build`와 `fvm flutter gen-l10n`을 실행한다.
- 생성 코드는 저장소에 커밋해 checkout 직후에도 분석 가능한 상태를 유지한다.

## 검증

```bash
fvm flutter pub get
fvm flutter gen-l10n
fvm dart run build_runner build
fvm dart format --output=none --set-exit-if-changed lib test
fvm flutter analyze --fatal-infos
fvm flutter test
```

Boolean 이름은 `is`, `has`, `can`, `should`, `needs` 접두사를 사용하고 커밋은 Conventional Commits 형식을 따른다.
