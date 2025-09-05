# 컴포넌트 의존성 관리 가이드라인

## 🎯 기본 원칙

**Atomic Design은 UI 구조의 분류이지, 의존성 제한이 아닙니다.**
각 레벨에서 적절한 의존성을 사용하되, **재사용성과 유지보수성**을 고려해야 합니다.

## 📊 컴포넌트 레벨별 의존성 가이드

### 🔹 Atoms (원자)

#### ✅ 권장되는 의존성
- **유틸리티 라이브러리**: lodash, date-fns, validator
- **성능 최적화**: throttle, debounce, memoization
- **접근성**: screen reader, focus management
- **애니메이션**: 기본적인 transition, spring
- **테마/스타일링**: 프로젝트 테마 시스템

#### ⚠️ 주의해서 사용할 의존성
- **상태 관리**: 가능한 한 stateless로 유지
- **네트워크**: 직접적인 API 호출 지양
- **복잡한 비즈니스 로직**: 상위 컴포넌트로 위임

#### ❌ 피해야 할 의존성
- **라우팅**: 직접적인 네비게이션 로직
- **전역 상태**: 특정 비즈니스 상태에 의존
- **복합 기능**: 여러 도메인을 아우르는 로직

### 🔹 Molecules (분자)

#### ✅ 권장되는 의존성
- **폼 관리**: react-hook-form, formik
- **데이터 검증**: yup, joi, zod
- **로컬 상태**: useState, useReducer
- **이벤트 처리**: 복합 이벤트 로직

### 🔹 Organisms (유기체)

#### ✅ 권장되는 의존성
- **상태 관리**: Redux, Zustand, Provider
- **데이터 페칭**: React Query, SWR
- **라우팅**: 조건부 네비게이션
- **비즈니스 로직**: 도메인 특화 로직

### 🔹 Templates (템플릿)

#### ✅ 권장되는 의존성
- **레이아웃 관리**: 반응형 로직
- **전역 상태**: 페이지 레벨 상태
- **라우팅**: 페이지 네비게이션
- **SEO/메타데이터**: 페이지 정보

## 💡 실용적인 예시

### 1. Throttle/Debounce 버튼 (Atom)

```dart
// ✅ 좋은 예: 성능 최적화를 위한 외부 라이브러리 사용
class ThrottledButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final Duration throttleDuration;
  
  const ThrottledButton({
    required this.text,
    this.onTap,
    this.throttleDuration = const Duration(milliseconds: 500),
  });
}

// 외부 라이브러리: throttle_debounce
import 'package:throttle_debounce/throttle_debounce.dart';
```

### 2. 날짜 선택 버튼 (Atom)

```dart
// ✅ 좋은 예: 유틸리티 라이브러리 사용
class DateButton extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateSelected;
  
  // 외부 라이브러리: intl (날짜 포맷팅)
  String get formattedDate => 
    selectedDate != null 
      ? DateFormat('yyyy.MM.dd').format(selectedDate!)
      : '날짜 선택';
}
```

### 3. 검색 입력 필드 (Molecule)

```dart
// ✅ 좋은 예: 복합 기능을 위한 라이브러리 사용
class SearchInput extends StatefulWidget {
  final Function(String)? onSearch;
  final Duration debounceTime;
  
  // 외부 라이브러리: 
  // - throttle_debounce (성능)
  // - validator (입력 검증)
}
```

## 🔧 의존성 선택 기준

### 1. **기능적 필요성**
- 컴포넌트의 핵심 기능 구현에 필수적인가?
- 직접 구현하기에는 복잡하거나 위험한가?

### 2. **재사용성 영향**
- 의존성이 컴포넌트의 재사용성을 해치지 않는가?
- 다른 프로젝트에서도 사용할 수 있는가?

### 3. **유지보수성**
- 라이브러리가 안정적이고 지속적으로 관리되는가?
- 프로젝트의 다른 부분과 충돌하지 않는가?

### 4. **성능 영향**
- 번들 크기에 미치는 영향이 적절한가?
- 런타임 성능을 개선하는가?

## 📋 의존성 관리 체크리스트

### Atoms 컴포넌트 작성 시

- [ ] 외부 의존성 없이 구현 가능한지 검토
- [ ] 필요한 의존성이 **유틸리티성**인지 확인
- [ ] 의존성이 컴포넌트의 **재사용성을 해치지 않는지** 확인
- [ ] **props를 통한 제어**가 가능한지 확인
- [ ] 의존성 **문서화** 및 **예시** 작성

### 예외 상황

#### 언제 Atoms에서 복잡한 의존성을 사용해도 되는가?

1. **접근성 (a11y)**: 스크린 리더, 키보드 네비게이션
2. **성능 최적화**: throttle, debounce, virtualization
3. **브라우저 호환성**: polyfill, feature detection
4. **보안**: 입력 sanitization, XSS 방지
5. **국제화**: 다국어, 날짜/숫자 포맷팅

```dart
// ✅ 예외적으로 허용되는 복잡한 의존성
class AccessibleButton extends StatelessWidget {
  // 접근성을 위한 복잡한 로직
  // 외부 라이브러리: flutter_accessibility
}

class SecureInput extends StatelessWidget {
  // 보안을 위한 입력 검증
  // 외부 라이브러리: validator, sanitizer
}
```

## 🎯 결론

**Atoms도 필요한 경우 외부 의존성을 사용해야 합니다.**

핵심은:
1. **기능적 필요성** 우선
2. **재사용성** 고려
3. **적절한 추상화** 레벨 유지
4. **명확한 인터페이스** 제공

Atomic Design은 **UI 구조 분류법**이지, **의존성 금지령**이 아닙니다.
각 컴포넌트가 자신의 책임을 잘 수행할 수 있도록 **적절한 도구**를 사용하는 것이 중요합니다.
