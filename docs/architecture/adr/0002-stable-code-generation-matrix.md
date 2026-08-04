# ADR 0002: Stable code-generation matrix

- 상태: Accepted
- 일자: 2026-08-04

## 배경

2026년 7월 말 기준 Riverpod runtime 3.4.2는 안정판이지만 `riverpod_generator` 4.0.8과 `riverpod_lint` 3.1.8은 analyzer 13을 요구한다. Freezed 안정판 3.2.5는 analyzer 9 이상 11 미만을 요구한다. Dart dependency graph에는 analyzer 한 버전만 존재할 수 있어 이 조합은 해석되지 않는다.

## 결정

- `flutter_riverpod` 3.4.2 최신 안정 runtime을 사용한다.
- Riverpod provider는 명시적인 수동 선언을 사용한다.
- Freezed 3.2.5와 go_router_builder 4.4.0만 build_runner로 생성한다.
- build_runner는 analyzer 10 해석을 유지하는 2.15.1로 고정한다.
- Freezed 4 prerelease를 production boilerplate에 넣지 않는다.
- 호환되지 않는 riverpod_generator와 riverpod_lint는 설치하지 않는다.
- architecture test와 strict analyzer rules로 경계를 자동 검증한다.

## 재검토 조건

Freezed 안정판이 analyzer 13 이상을 지원하면 Riverpod generator/lint를 같은 PR에서 함께 평가한다. 이때 runtime 동작을 바꾸지 않고 provider 선언만 기계적으로 전환할 수 있어야 한다.
