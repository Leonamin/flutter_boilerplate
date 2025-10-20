import 'package:flutter/foundation.dart';

class BuildConfig {
  /// [0]: Debug
  /// [1]: Profile
  /// [2]: Release
  static const List<String> _iamportKeys = [
    'your-iamport-key-for-debug',
    'your-iamport-key-for-profile',
    'your-iamport-key-for-release',
  ];

  static String get iamportKey => kDebugMode
      ? _iamportKeys[0]
      : kProfileMode
      ? _iamportKeys[1]
      : _iamportKeys[2];

  static const List<String> _channelKeys = [
    'your-channel-key-for-debug',
    'your-channel-key-for-profile',
    'your-channel-key-for-release',
  ];

  static String get channelKey => kDebugMode
      ? _channelKeys[0]
      : kProfileMode
      ? _channelKeys[1]
      : _channelKeys[2];

  static const List<String> _portoneStoreIDs = [
    'your-portone-store-id-for-debug',
    'your-portone-store-id-for-profile',
    'your-portone-store-id-for-release',
  ];

  static String get portoneStoreID => kDebugMode
      ? _portoneStoreIDs[0]
      : kProfileMode
      ? _portoneStoreIDs[1]
      : _portoneStoreIDs[2];

  // Supabase 관련 설정

  static const List<bool> _usingSupabase = [true, true, true];

  static bool get usingSupabase => kDebugMode
      ? _usingSupabase[0]
      : kProfileMode
      ? _usingSupabase[1]
      : _usingSupabase[2];

  static const List<String> _supabaseUrl = [
    'your-supabase-url-for-debug',
    'your-supabase-url-for-profile',
    'your-supabase-url-for-release',
  ];

  static String get supabaseUrl => kDebugMode
      ? _supabaseUrl[0]
      : kProfileMode
      ? _supabaseUrl[1]
      : _supabaseUrl[2];

  static const List<String> _supabaseAnonKey = [
    'your-supabase-anon-key-for-debug',
    'your-supabase-anon-key-for-profile',
    'your-supabase-anon-key-for-release',
  ];

  static String get supabaseAnonKey => kDebugMode
      ? _supabaseAnonKey[0]
      : kProfileMode
      ? _supabaseAnonKey[1]
      : _supabaseAnonKey[2];
}
