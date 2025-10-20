import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// 임시 문자열 관리자
/// 개발 중에는 임시 문자열을 허용하고, 나중에 일괄 다국어화할 수 있도록 지원
class TempTextManager {
  static final TempTextManager _instance = TempTextManager._internal();
  factory TempTextManager() => _instance;
  TempTextManager._internal();

  // 임시 문자열 저장소
  static final Set<TempTextEntry> _tempTexts = <TempTextEntry>{};
  
  /// 임시 텍스트 등록 및 반환
  /// 개발 모드에서는 경고 로그를 출력하고, 릴리즈 모드에서는 조용히 처리
  static String temp(String text, {
    String? key,
    String? description,
    String? category,
    Map<String, dynamic>? args,
  }) {
    final entry = TempTextEntry(
      text: text,
      key: key ?? _generateKeyFromText(text),
      description: description,
      category: category ?? 'general',
      args: args,
      stackTrace: StackTrace.current.toString(),
      timestamp: DateTime.now(),
    );
    
    _tempTexts.add(entry);
    
    // 개발 모드에서만 경고 출력
    if (kDebugMode) {
      developer.log(
        '🚨 임시 문자열 사용됨: "$text"',
        name: 'TempText',
        level: 900, // Warning level
      );
    }
    
    return text;
  }
  
  /// 키 기반 임시 텍스트 (나중에 intl로 쉽게 변환 가능)
  static String tempKey(String key, String fallbackText, {
    String? description,
    String? category,
    Map<String, dynamic>? args,
  }) {
    return temp(
      fallbackText,
      key: key,
      description: description,
      category: category,
      args: args,
    );
  }
  
  /// 카테고리별 임시 텍스트
  static String tempButton(String text, {String? key, String? description}) {
    return temp(text, key: key, description: description, category: 'button');
  }
  
  static String tempError(String text, {String? key, String? description}) {
    return temp(text, key: key, description: description, category: 'error');
  }
  
  static String tempLabel(String text, {String? key, String? description}) {
    return temp(text, key: key, description: description, category: 'label');
  }
  
  static String tempMessage(String text, {String? key, String? description}) {
    return temp(text, key: key, description: description, category: 'message');
  }
  
  /// 모든 임시 텍스트 목록 반환
  static List<TempTextEntry> getAllTempTexts() {
    return _tempTexts.toList()..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
  
  /// 카테고리별 임시 텍스트 반환
  static List<TempTextEntry> getTempTextsByCategory(String category) {
    return _tempTexts.where((entry) => entry.category == category).toList();
  }
  
  /// ARB 파일 형식으로 출력 (다국어화 작업용)
  static String generateArbContent({String locale = 'ko'}) {
    final buffer = StringBuffer();
    buffer.writeln('{');
    buffer.writeln('  "@@locale": "$locale",');
    buffer.writeln('  "@@last_modified": "${DateTime.now().toIso8601String()}",');
    
    final sortedEntries = getAllTempTexts();
    for (int i = 0; i < sortedEntries.length; i++) {
      final entry = sortedEntries[i];
      buffer.writeln('  "${entry.key}": "${entry.text}",');
      buffer.writeln('  "@${entry.key}": {');
      buffer.writeln('    "description": "${entry.description ?? entry.text}",');
      buffer.writeln('    "category": "${entry.category}"');
      buffer.write('  }');
      if (i < sortedEntries.length - 1) buffer.write(',');
      buffer.writeln();
    }
    
    buffer.writeln('}');
    return buffer.toString();
  }
  
  /// 임시 텍스트 통계
  static Map<String, int> getStatistics() {
    final stats = <String, int>{};
    for (final entry in _tempTexts) {
      stats[entry.category] = (stats[entry.category] ?? 0) + 1;
    }
    return stats;
  }
  
  /// 임시 텍스트 초기화 (테스트용)
  static void clear() {
    _tempTexts.clear();
  }
  
  /// 텍스트에서 키 자동 생성
  static String _generateKeyFromText(String text) {
    final processed = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9가-힣]'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    
    // 처리된 문자열의 길이를 기준으로 substring 적용
    final maxLength = processed.length > 30 ? 30 : processed.length;
    return processed.substring(0, maxLength);
  }
}

/// 임시 텍스트 엔트리
class TempTextEntry {
  final String text;
  final String key;
  final String? description;
  final String category;
  final Map<String, dynamic>? args;
  final String stackTrace;
  final DateTime timestamp;
  
  const TempTextEntry({
    required this.text,
    required this.key,
    this.description,
    required this.category,
    this.args,
    required this.stackTrace,
    required this.timestamp,
  });
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TempTextEntry && other.key == key;
  }
  
  @override
  int get hashCode => key.hashCode;
  
  @override
  String toString() {
    return 'TempTextEntry(key: $key, text: $text, category: $category)';
  }
}
