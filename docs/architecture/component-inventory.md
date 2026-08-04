# Shared component inventory

기존 `lib/shared/components`에는 65개의 Dart 파일이 있었지만, 대부분 실제 제품 호출부가 없는 옵션 조합 또는 특정 화면 후보였다. Hybrid Reset에서는 다음 네 개의 중립 primitive만 새 API로 배치했다.

| 컴포넌트 | 위치 | 책임 |
|---|---|---|
| `AppButton` | `shared/ui/components/app_button.dart` | 기본 action과 loading disable |
| `AppTextField` | `shared/ui/components/app_text_field.dart` | form field, autofill, validation 연결 |
| `AppLoadingIndicator` | `shared/ui/components/app_loading_indicator.dart` | 크기만 제어하는 progress 표시 |
| `AppScaffold` | `shared/ui/components/app_scaffold.dart` | app bar, padding, bottom navigation 배치 |

badge, chip, dropdown, dialog, bottom sheet, toast, image viewer, bottom navigation 등은 실제 두 번째 호출부와 접근성/디자인 요구가 생길 때 feature 안에서 먼저 만든다. 두 feature에서 동일한 의미로 쓰이는 것이 확인된 뒤에만 shared로 올린다.
