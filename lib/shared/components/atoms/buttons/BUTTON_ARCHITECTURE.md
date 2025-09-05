# 버튼 아키텍처 가이드라인

## 🎯 핵심 원칙

**AppButton과 IconButton에는 throttle/debounce를 넣지 않습니다.**

### 이유
1. **Atomic Design 원칙**: Atoms는 단순하고 명확한 책임만 가져야 함
2. **재사용성**: throttle/debounce가 내장되면 유연성 저하
3. **테스트 용이성**: 버튼과 로직이 분리되어야 테스트 쉬움
4. **관심사 분리**: UI 컴포넌트와 비즈니스 로직 분리

## 🏗️ 권장 아키텍처

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   UI Layer      │───▶│  Service Layer   │───▶│   API Layer     │
│  (AppButton)    │    │ (Throttle/       │    │                 │
│  - 단순한 UI    │    │  Debounce)       │    │                 │
│  - 이벤트 전달  │    │ - 비즈니스 로직 │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

## 📋 버튼 컴포넌트 책임 범위

### ✅ AppButton/IconButton이 해야 할 일
- **시각적 표현**: 색상, 크기, 아이콘 등
- **기본 상호작용**: 탭, 호버, 비활성화
- **접근성**: 스크린 리더, 키보드 네비게이션
- **일관된 디자인**: 앱 전체 디자인 시스템 적용

### ❌ AppButton/IconButton이 하지 말아야 할 일
- **비즈니스 로직**: API 호출, 데이터 처리
- **복잡한 상태 관리**: 로딩, 에러 처리
- **성능 최적화**: throttle, debounce
- **도메인 특화 로직**: 예약, 결제 등

## 💡 올바른 사용 패턴

### ✅ 권장 방식
```dart
// Service Layer
class BookingService {
  final ThrottleDebounceUtil _throttle = ThrottleDebounceUtil();
  
  void saveBooking() {
    _throttle.throttle(Duration(seconds: 2), () async {
      await _performSave();
    });
  }
}

// UI Layer
AppButton.primary(
  '예약 저장',
  onTap: bookingService.saveBooking, // 로직에서 throttle 처리
)
```

### ❌ 비권장 방식
```dart
// 버튼에 모든 로직이 섞임
AppButton.primary(
  '예약 저장',
  onTap: () async {
    // 복잡한 로직이 UI에 섞임
    await validateData();
    await callAPI();
    showSuccessMessage();
  },
  throttleDuration: Duration(seconds: 2), // 버튼이 복잡해짐
)
```

## 🎨 버튼 사용 가이드

### 1. 기본 버튼
```dart
// Primary 액션
AppButton.primary('저장', onTap: () => save())

// Secondary 액션  
AppButton('취소', 
  variant: ButtonVariant.outlined, 
  onTap: () => cancel()
)

// Text 버튼
AppButton('건너뛰기', 
  variant: ButtonVariant.text,
  onTap: () => skip()
)
```

### 2. 아이콘 버튼
```dart
AppIconButton(
  Icons.favorite,
  onTap: () => toggleFavorite(),
  tooltip: '좋아요',
)
```

### 3. 특수 상황에서만 사용
```dart
// 단순한 UI 상호작용에만 사용
ThrottledButton(
  '카운터 증가',
  onTap: () => setState(() => counter++),
  throttleDuration: Duration(milliseconds: 500),
)
```

## 🔧 Service Layer 구현

### Throttle/Debounce 유틸리티
```dart
class ThrottleDebounceUtil {
  Timer? _throttleTimer;
  Timer? _debounceTimer;
  bool _isThrottled = false;

  void throttle(Duration duration, VoidCallback callback) {
    if (_isThrottled) return;
    callback();
    _isThrottled = true;
    _throttleTimer = Timer(duration, () => _isThrottled = false);
  }

  void debounce(Duration duration, VoidCallback callback) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(duration, callback);
  }

  void dispose() {
    _throttleTimer?.cancel();
    _debounceTimer?.cancel();
  }
}
```

### 실제 서비스 구현
```dart
class SearchService {
  final ThrottleDebounceUtil _debounce = ThrottleDebounceUtil();
  
  void search(String query) {
    _debounce.debounce(Duration(milliseconds: 300), () async {
      await _performSearch(query);
    });
  }
}

class BookingService {
  final ThrottleDebounceUtil _throttle = ThrottleDebounceUtil();
  
  void saveBooking() {
    _throttle.throttle(Duration(seconds: 2), () async {
      await _performSave();
    });
  }
}
```

## 📊 상황별 적용 가이드

### 로직 레벨 적용 (권장)
- 🌐 API 호출
- 🔍 검색 기능
- 💾 데이터 저장
- 📊 복잡한 계산
- 🧪 테스트가 중요한 로직

### 버튼 레벨 적용 (제한적)
- 🎯 단순한 카운터
- 🎨 애니메이션 트리거
- 📱 햅틱 피드백
- 🔊 사운드 재생

## 🎯 결론

1. **AppButton/IconButton**: 단순하게 유지
2. **복잡한 로직**: Service Layer에서 처리
3. **Throttle/Debounce**: 비즈니스 로직에서 적용
4. **관심사 분리**: UI와 로직을 명확히 분리

이렇게 하면 **테스트 가능하고, 재사용 가능하며, 유지보수하기 쉬운** 코드를 작성할 수 있습니다.
