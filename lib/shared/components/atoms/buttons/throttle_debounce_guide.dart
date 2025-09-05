import 'dart:async';
import 'package:flutter/material.dart';

/// Throttle/Debounce 적용 방식 가이드
/// 
/// 1. 버튼 레벨 적용 vs 로직 레벨 적용
/// 2. 각 방식의 장단점 및 적절한 사용 시나리오
/// 3. 실제 구현 예시

// =============================================================================
// 1. 로직 레벨 적용 (권장)
// =============================================================================

/// 로직 레벨에서 throttle/debounce를 처리하는 유틸리티
class ThrottleDebounceUtil {
  Timer? _throttleTimer;
  Timer? _debounceTimer;
  bool _isThrottled = false;

  /// Throttle: 지정된 시간 간격 내에서는 첫 번째 호출만 실행
  void throttle(Duration duration, VoidCallback callback) {
    if (_isThrottled) return;
    
    callback();
    _isThrottled = true;
    
    _throttleTimer?.cancel();
    _throttleTimer = Timer(duration, () {
      _isThrottled = false;
    });
  }

  /// Debounce: 연속 호출에서 마지막 호출만 실행
  void debounce(Duration duration, VoidCallback callback) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(duration, callback);
  }

  void dispose() {
    _throttleTimer?.cancel();
    _debounceTimer?.cancel();
  }
}

// =============================================================================
// 2. 실제 사용 예시들
// =============================================================================

/// 예시 1: API 호출이 있는 비즈니스 로직 (로직 레벨 적용 권장)
class BookingService {
  final ThrottleDebounceUtil _throttleUtil = ThrottleDebounceUtil();

  void saveBooking() {
    // ✅ 로직 레벨에서 throttle 적용
    _throttleUtil.throttle(
      const Duration(seconds: 2),
      () async {
        debugPrint('예약 저장 API 호출');
        await _callSaveBookingAPI();
      },
    );
  }

  Future<void> _callSaveBookingAPI() async {
    // 실제 API 호출 로직
    await Future.delayed(const Duration(seconds: 1));
  }

  void dispose() {
    _throttleUtil.dispose();
  }
}

/// 예시 2: 검색 기능 (로직 레벨 debounce 권장)
class SearchService {
  final ThrottleDebounceUtil _debounceUtil = ThrottleDebounceUtil();

  void search(String query) {
    // ✅ 로직 레벨에서 debounce 적용
    _debounceUtil.debounce(
      const Duration(milliseconds: 300),
      () async {
        debugPrint('검색 실행: $query');
        await _performSearch(query);
      },
    );
  }

  Future<void> _performSearch(String query) async {
    // 실제 검색 로직
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void dispose() {
    _debounceUtil.dispose();
  }
}

/// 예시 3: 단순한 UI 상호작용 (버튼 레벨 적용 가능)
class SimpleCounterWidget extends StatefulWidget {
  const SimpleCounterWidget({super.key});

  @override
  State<SimpleCounterWidget> createState() => _SimpleCounterWidgetState();
}

class _SimpleCounterWidgetState extends State<SimpleCounterWidget> {
  int _counter = 0;
  final ThrottleDebounceUtil _throttleUtil = ThrottleDebounceUtil();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('카운터: $_counter'),
        
        // ✅ 단순한 로직은 버튼 레벨도 OK
        ElevatedButton(
          onPressed: () {
            _throttleUtil.throttle(
              const Duration(milliseconds: 500),
              () => setState(() => _counter++),
            );
          },
          child: const Text('증가 (Throttle)'),
        ),
        
        // 또는 일반 버튼 + 로직 레벨 처리
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('증가 (로직 레벨)'),
        ),
      ],
    );
  }

  void _incrementCounter() {
    _throttleUtil.throttle(
      const Duration(milliseconds: 500),
      () => setState(() => _counter++),
    );
  }

  @override
  void dispose() {
    _throttleUtil.dispose();
    super.dispose();
  }
}

// =============================================================================
// 3. 상황별 적용 가이드
// =============================================================================

/// 상황별 적용 방식 결정 가이드
class ThrottleDebounceGuide {
  /// 로직 레벨 적용이 권장되는 경우
  static const List<String> logicLevelRecommended = [
    '🌐 API 호출이 포함된 경우',
    '🔍 검색, 자동완성 기능',
    '💾 데이터 저장/업데이트',
    '📊 복잡한 비즈니스 로직',
    '🔄 상태 관리가 복잡한 경우',
    '🧪 테스트가 중요한 로직',
    '♻️ 여러 곳에서 재사용되는 로직',
  ];

  /// 버튼 레벨 적용이 가능한 경우
  static const List<String> buttonLevelAcceptable = [
    '🎯 단순한 UI 상호작용',
    '🔢 카운터, 토글 등 간단한 상태 변경',
    '🎨 애니메이션 트리거',
    '📱 햅틱 피드백',
    '🔊 사운드 재생',
    '📋 단순한 로깅',
  ];
}

// =============================================================================
// 4. 권장 패턴
// =============================================================================

/// 권장 패턴: 비즈니스 로직과 UI 분리
class RecommendedPatternExample extends StatefulWidget {
  const RecommendedPatternExample({super.key});

  @override
  State<RecommendedPatternExample> createState() => _RecommendedPatternExampleState();
}

class _RecommendedPatternExampleState extends State<RecommendedPatternExample> {
  final BookingService _bookingService = BookingService();
  final SearchService _searchService = SearchService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ 권장: 일반 버튼 + 로직 레벨 처리
        ElevatedButton(
          onPressed: _bookingService.saveBooking, // 로직에서 throttle 처리
          child: const Text('예약 저장'),
        ),
        
        TextField(
          onChanged: _searchService.search, // 로직에서 debounce 처리
          decoration: const InputDecoration(hintText: '검색어 입력'),
        ),
        
        // ❌ 비권장: 버튼에서 직접 처리 (복잡한 로직의 경우)
        // ThrottledButton(
        //   '예약 저장',
        //   onTap: () async {
        //     // 복잡한 비즈니스 로직이 버튼에 섞임
        //     await _callAPI();
        //     _updateState();
        //     _showSnackBar();
        //   },
        // ),
      ],
    );
  }

  @override
  void dispose() {
    _bookingService.dispose();
    _searchService.dispose();
    super.dispose();
  }
}
