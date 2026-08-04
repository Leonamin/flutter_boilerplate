# Architecture

이 보일러플레이트는 작은 팀이 기능 단위로 빠르게 움직이면서도 AI 에이전트의 병렬 변경을 안전하게 합칠 수 있도록 feature-first 구조를 사용한다. Flutter 공식 Architecture Guide의 UI/Data 분리와 repository pattern을 기본으로 삼되, use-case 계층은 복잡한 도메인 규칙이 실제로 생겼을 때만 추가한다.

```text
lib/
├── app/                         # composition root, router, bootstrap
├── core/                        # 제품 기능을 모르는 config/observability
├── features/
│   └── auth/
│       ├── domain/              # entity, failure, repository port
│       ├── data/                # repository adapter
│       ├── application/         # Riverpod provider/controller
│       └── presentation/        # page/widget, UI effect
├── shared/ui/                   # feature-neutral foundations/components
├── l10n/                        # ARB source
└── generated/                   # committed generated code
```

## 의존성 방향

```text
app ────────────────► features/*, core, shared
presentation ───────► application, domain, shared
application ────────► domain, core
data ───────────────► domain, core, external SDK
domain ─────────────► Dart/Freezed annotation only
shared/core ────────► feature를 알 수 없음
```

- feature 간 직접 import는 금지한다.
- repository port는 domain, 구현은 data, 실제 구현 선택은 app bootstrap에 둔다.
- Riverpod provider는 application에 두고 `BuildContext`, route, SnackBar를 알지 못하게 한다.
- 비동기 명령은 auto-dispose `AsyncNotifier`; 앱 수명 상태만 non-auto-dispose provider를 쓴다.
- loading/error를 별도 Freezed state로 복제하지 않고 `AsyncValue`를 사용한다.
- 새 네트워크·스토리지 SDK는 필요한 feature의 adapter가 생길 때 추가한다. 사용하지 않는 placeholder infra는 두지 않는다.
- `InMemoryAuthRepository`는 development 전용이며 staging/production은 실제 adapter가 없으면 시작 단계에서 실패한다.

## 라우팅과 인증

`go_router_builder`의 typed route가 경로를 정의한다. router는 세션 provider를 직접 watch해 재생성하지 않고 listenable만 refresh한다. redirect는 순수 함수로 테스트하며 외부 URL을 `from` 경로로 허용하지 않는다. 세션 복구 오류는 로그아웃으로 축소하지 않고 startup error에서 명시적으로 재시도한다.

## 참고 기준

- [Flutter Architecture Guide](https://docs.flutter.dev/app-architecture/guide)
- [Riverpod 3 documentation](https://riverpod.dev/)
- [go_router type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)
- [Freezed documentation](https://pub.dev/packages/freezed)

결정 배경은 [ADR 0001](adr/0001-hybrid-reset.md)과 [ADR 0002](adr/0002-stable-code-generation-matrix.md)를 확인한다.
