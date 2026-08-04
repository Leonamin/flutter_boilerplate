# ADR 0001: Hybrid Reset

- 상태: Accepted
- 일자: 2026-08-04

## 배경

기존 프로젝트는 GetX 상태/DI, 자체 navigator, base ViewModel, 전역 data/domain 폴더와 65개의 선제적 Atomic Design 컴포넌트가 얽혀 있었다. 실제 기능은 auth 하나뿐이어서 점진적 호환 계층을 유지할수록 새 구조와 레거시 구조가 오래 공존할 가능성이 컸다.

## 결정

실제 가치가 있는 auth 흐름과 다국어 기반만 새 feature-first 경계로 다시 작성하고 나머지 placeholder를 제거한다.

- 상태/DI: Riverpod 3 provider override와 AsyncNotifier
- 모델: Freezed 3 union/value
- 라우팅: go_router typed route와 순수 redirect policy
- 앱 조립: `lib/app` 단일 composition root
- 공용 UI: 호출부가 확인된 4개 primitive만 유지
- SDK: FVM으로 Flutter 3.44.7 고정
- 생성물: CI에서 재생성 검증하고 저장소에도 포함

## 결과

GetX 호환 계층과 service locator는 존재하지 않는다. feature 작업자는 하나의 feature 폴더와 테스트만 소유할 수 있고, 통합 작업자는 app/generated/dependency 파일만 직렬화하면 된다. 과거 컴포넌트 API 호환성은 의도적으로 보장하지 않는다.
