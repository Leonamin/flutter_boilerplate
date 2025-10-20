/// ISO 639-1 언어 코드 모델
class Language {
  final String code; // ISO 639-1 코드 (예: ko, en, ja)
  final String name; // 영어 언어명 (예: Korean, English, Japanese)
  final String nativeName; // 현지 언어명 (예: 한국어, English, 日本語)

  const Language({
    required this.code,
    required this.name,
    required this.nativeName,
  });

  @override
  String toString() => '$nativeName ($name)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}

/// ISO 639-1 표준 언어 목록
class Languages {
  static const List<Language> all = [
    // 주요 언어들
    Language(code: 'ko', name: 'Korean', nativeName: '한국어'),
    Language(code: 'en', name: 'English', nativeName: 'English'),
    Language(code: 'ja', name: 'Japanese', nativeName: '日本語'),
    Language(code: 'zh', name: 'Chinese', nativeName: '中文'),
    Language(code: 'es', name: 'Spanish', nativeName: 'Español'),
    Language(code: 'fr', name: 'French', nativeName: 'Français'),
    Language(code: 'de', name: 'German', nativeName: 'Deutsch'),
    Language(code: 'it', name: 'Italian', nativeName: 'Italiano'),
    Language(code: 'pt', name: 'Portuguese', nativeName: 'Português'),
    Language(code: 'ru', name: 'Russian', nativeName: 'Русский'),
    Language(code: 'ar', name: 'Arabic', nativeName: 'العربية'),
    Language(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी'),
    Language(code: 'th', name: 'Thai', nativeName: 'ไทย'),
    Language(code: 'vi', name: 'Vietnamese', nativeName: 'Tiếng Việt'),
    Language(code: 'id', name: 'Indonesian', nativeName: 'Bahasa Indonesia'),
    Language(code: 'ms', name: 'Malay', nativeName: 'Bahasa Melayu'),
    Language(code: 'tl', name: 'Filipino', nativeName: 'Filipino'),
    Language(code: 'tr', name: 'Turkish', nativeName: 'Türkçe'),
    Language(code: 'nl', name: 'Dutch', nativeName: 'Nederlands'),
    Language(code: 'sv', name: 'Swedish', nativeName: 'Svenska'),
    Language(code: 'no', name: 'Norwegian', nativeName: 'Norsk'),
    Language(code: 'da', name: 'Danish', nativeName: 'Dansk'),
    Language(code: 'fi', name: 'Finnish', nativeName: 'Suomi'),
    Language(code: 'pl', name: 'Polish', nativeName: 'Polski'),
    Language(code: 'cs', name: 'Czech', nativeName: 'Čeština'),
    Language(code: 'hu', name: 'Hungarian', nativeName: 'Magyar'),
    Language(code: 'ro', name: 'Romanian', nativeName: 'Română'),
    Language(code: 'bg', name: 'Bulgarian', nativeName: 'Български'),
    Language(code: 'hr', name: 'Croatian', nativeName: 'Hrvatski'),
    Language(code: 'sr', name: 'Serbian', nativeName: 'Српски'),
    Language(code: 'sk', name: 'Slovak', nativeName: 'Slovenčina'),
    Language(code: 'sl', name: 'Slovenian', nativeName: 'Slovenščina'),
    Language(code: 'et', name: 'Estonian', nativeName: 'Eesti'),
    Language(code: 'lv', name: 'Latvian', nativeName: 'Latviešu'),
    Language(code: 'lt', name: 'Lithuanian', nativeName: 'Lietuvių'),
    Language(code: 'el', name: 'Greek', nativeName: 'Ελληνικά'),
    Language(code: 'he', name: 'Hebrew', nativeName: 'עברית'),
    Language(code: 'fa', name: 'Persian', nativeName: 'فارسی'),
    Language(code: 'ur', name: 'Urdu', nativeName: 'اردو'),
    Language(code: 'bn', name: 'Bengali', nativeName: 'বাংলা'),
    Language(code: 'ta', name: 'Tamil', nativeName: 'தமிழ்'),
    Language(code: 'te', name: 'Telugu', nativeName: 'తెలుగు'),
    Language(code: 'ml', name: 'Malayalam', nativeName: 'മലയാളം'),
    Language(code: 'kn', name: 'Kannada', nativeName: 'ಕನ್ನಡ'),
    Language(code: 'gu', name: 'Gujarati', nativeName: 'ગુજરાતી'),
    Language(code: 'pa', name: 'Punjabi', nativeName: 'ਪੰਜਾਬੀ'),
    Language(code: 'mr', name: 'Marathi', nativeName: 'मराठी'),
    Language(code: 'ne', name: 'Nepali', nativeName: 'नेपाली'),
    Language(code: 'si', name: 'Sinhala', nativeName: 'සිංහල'),
    Language(code: 'my', name: 'Myanmar', nativeName: 'မြန်မာ'),
    Language(code: 'km', name: 'Khmer', nativeName: 'ខ្មែរ'),
    Language(code: 'lo', name: 'Lao', nativeName: 'ລາວ'),
    Language(code: 'ka', name: 'Georgian', nativeName: 'ქართული'),
    Language(code: 'hy', name: 'Armenian', nativeName: 'Հայերեն'),
    Language(code: 'az', name: 'Azerbaijani', nativeName: 'Azərbaycan'),
    Language(code: 'kk', name: 'Kazakh', nativeName: 'Қазақ'),
    Language(code: 'ky', name: 'Kyrgyz', nativeName: 'Кыргыз'),
    Language(code: 'uz', name: 'Uzbek', nativeName: 'Oʻzbek'),
    Language(code: 'tg', name: 'Tajik', nativeName: 'Тоҷикӣ'),
    Language(code: 'mn', name: 'Mongolian', nativeName: 'Монгол'),
    Language(code: 'bo', name: 'Tibetan', nativeName: 'བོད་ཡིག'),
    Language(code: 'ug', name: 'Uyghur', nativeName: 'ئۇيغۇر'),
    Language(code: 'sw', name: 'Swahili', nativeName: 'Kiswahili'),
    Language(code: 'am', name: 'Amharic', nativeName: 'አማርኛ'),
    Language(code: 'ha', name: 'Hausa', nativeName: 'Hausa'),
    Language(code: 'yo', name: 'Yoruba', nativeName: 'Yorùbá'),
    Language(code: 'ig', name: 'Igbo', nativeName: 'Igbo'),
    Language(code: 'zu', name: 'Zulu', nativeName: 'isiZulu'),
    Language(code: 'af', name: 'Afrikaans', nativeName: 'Afrikaans'),
    Language(code: 'xh', name: 'Xhosa', nativeName: 'isiXhosa'),
    Language(code: 'st', name: 'Sotho', nativeName: 'Sesotho'),
    Language(code: 'tn', name: 'Tswana', nativeName: 'Setswana'),
    Language(code: 've', name: 'Venda', nativeName: 'Tshivenḓa'),
    Language(code: 'ts', name: 'Tsonga', nativeName: 'Xitsonga'),
    Language(code: 'ss', name: 'Swati', nativeName: 'siSwati'),
    Language(code: 'nr', name: 'Ndebele', nativeName: 'isiNdebele'),
  ];

  /// 언어 코드로 언어 찾기
  static Language? findByCode(String code) {
    try {
      return all.firstWhere((language) => language.code == code.toLowerCase());
    } catch (e) {
      return null;
    }
  }

  /// 인기 있는 언어들 (상위에 표시용)
  static const List<Language> popular = [
    Language(code: 'ko', name: 'Korean', nativeName: '한국어'),
    Language(code: 'en', name: 'English', nativeName: 'English'),
    Language(code: 'ja', name: 'Japanese', nativeName: '日本語'),
    Language(code: 'zh', name: 'Chinese', nativeName: '中文'),
    Language(code: 'es', name: 'Spanish', nativeName: 'Español'),
    Language(code: 'fr', name: 'French', nativeName: 'Français'),
    Language(code: 'de', name: 'German', nativeName: 'Deutsch'),
    Language(code: 'it', name: 'Italian', nativeName: 'Italiano'),
    Language(code: 'pt', name: 'Portuguese', nativeName: 'Português'),
    Language(code: 'ru', name: 'Russian', nativeName: 'Русский'),
  ];

  /// 아시아 언어들
  static const List<Language> asian = [
    Language(code: 'ko', name: 'Korean', nativeName: '한국어'),
    Language(code: 'ja', name: 'Japanese', nativeName: '日本語'),
    Language(code: 'zh', name: 'Chinese', nativeName: '中文'),
    Language(code: 'th', name: 'Thai', nativeName: 'ไทย'),
    Language(code: 'vi', name: 'Vietnamese', nativeName: 'Tiếng Việt'),
    Language(code: 'id', name: 'Indonesian', nativeName: 'Bahasa Indonesia'),
    Language(code: 'ms', name: 'Malay', nativeName: 'Bahasa Melayu'),
    Language(code: 'tl', name: 'Filipino', nativeName: 'Filipino'),
    Language(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी'),
    Language(code: 'bn', name: 'Bengali', nativeName: 'বাংলা'),
    Language(code: 'ta', name: 'Tamil', nativeName: 'தமிழ்'),
    Language(code: 'my', name: 'Myanmar', nativeName: 'မြန်မာ'),
    Language(code: 'km', name: 'Khmer', nativeName: 'ខ្មែរ'),
    Language(code: 'lo', name: 'Lao', nativeName: 'ລາວ'),
  ];

  /// 유럽 언어들
  static const List<Language> european = [
    Language(code: 'en', name: 'English', nativeName: 'English'),
    Language(code: 'es', name: 'Spanish', nativeName: 'Español'),
    Language(code: 'fr', name: 'French', nativeName: 'Français'),
    Language(code: 'de', name: 'German', nativeName: 'Deutsch'),
    Language(code: 'it', name: 'Italian', nativeName: 'Italiano'),
    Language(code: 'pt', name: 'Portuguese', nativeName: 'Português'),
    Language(code: 'ru', name: 'Russian', nativeName: 'Русский'),
    Language(code: 'nl', name: 'Dutch', nativeName: 'Nederlands'),
    Language(code: 'sv', name: 'Swedish', nativeName: 'Svenska'),
    Language(code: 'no', name: 'Norwegian', nativeName: 'Norsk'),
    Language(code: 'da', name: 'Danish', nativeName: 'Dansk'),
    Language(code: 'fi', name: 'Finnish', nativeName: 'Suomi'),
    Language(code: 'pl', name: 'Polish', nativeName: 'Polski'),
    Language(code: 'cs', name: 'Czech', nativeName: 'Čeština'),
    Language(code: 'hu', name: 'Hungarian', nativeName: 'Magyar'),
    Language(code: 'el', name: 'Greek', nativeName: 'Ελληνικά'),
  ];
}
