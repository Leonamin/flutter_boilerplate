/// ISO 3166-1 alpha-2 국가 코드 모델
class Country {
  final String code; // ISO 3166-1 alpha-2 코드 (예: KR, US, JP)
  final String name; // 국가명 (예: South Korea, United States, Japan)
  final String nativeName; // 현지 언어 국가명 (예: 대한민국, United States, 日本)

  const Country({
    required this.code,
    required this.name,
    required this.nativeName,
  });

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}

/// ISO 3166-1 alpha-2 표준 국가 목록
class Countries {
  static const List<Country> all = [
    // 아시아-태평양
    Country(code: 'KR', name: 'South Korea', nativeName: '대한민국'),
    Country(code: 'JP', name: 'Japan', nativeName: '日本'),
    Country(code: 'CN', name: 'China', nativeName: '中华人民共和国'),
    Country(code: 'TW', name: 'Taiwan', nativeName: '中華民國'),
    Country(code: 'HK', name: 'Hong Kong', nativeName: '香港'),
    Country(code: 'SG', name: 'Singapore', nativeName: 'Singapore'),
    Country(code: 'TH', name: 'Thailand', nativeName: 'ประเทศไทย'),
    Country(code: 'VN', name: 'Vietnam', nativeName: 'Việt Nam'),
    Country(code: 'PH', name: 'Philippines', nativeName: 'Pilipinas'),
    Country(code: 'ID', name: 'Indonesia', nativeName: 'Indonesia'),
    Country(code: 'MY', name: 'Malaysia', nativeName: 'Malaysia'),
    Country(code: 'IN', name: 'India', nativeName: 'भारत'),
    Country(code: 'AU', name: 'Australia', nativeName: 'Australia'),
    Country(code: 'NZ', name: 'New Zealand', nativeName: 'New Zealand'),
    
    // 북미
    Country(code: 'US', name: 'United States', nativeName: 'United States'),
    Country(code: 'CA', name: 'Canada', nativeName: 'Canada'),
    Country(code: 'MX', name: 'Mexico', nativeName: 'México'),
    
    // 유럽
    Country(code: 'GB', name: 'United Kingdom', nativeName: 'United Kingdom'),
    Country(code: 'DE', name: 'Germany', nativeName: 'Deutschland'),
    Country(code: 'FR', name: 'France', nativeName: 'France'),
    Country(code: 'IT', name: 'Italy', nativeName: 'Italia'),
    Country(code: 'ES', name: 'Spain', nativeName: 'España'),
    Country(code: 'PT', name: 'Portugal', nativeName: 'Portugal'),
    Country(code: 'NL', name: 'Netherlands', nativeName: 'Nederland'),
    Country(code: 'BE', name: 'Belgium', nativeName: 'België'),
    Country(code: 'CH', name: 'Switzerland', nativeName: 'Schweiz'),
    Country(code: 'AT', name: 'Austria', nativeName: 'Österreich'),
    Country(code: 'SE', name: 'Sweden', nativeName: 'Sverige'),
    Country(code: 'NO', name: 'Norway', nativeName: 'Norge'),
    Country(code: 'DK', name: 'Denmark', nativeName: 'Danmark'),
    Country(code: 'FI', name: 'Finland', nativeName: 'Suomi'),
    Country(code: 'PL', name: 'Poland', nativeName: 'Polska'),
    Country(code: 'CZ', name: 'Czech Republic', nativeName: 'Česká republika'),
    Country(code: 'HU', name: 'Hungary', nativeName: 'Magyarország'),
    Country(code: 'RO', name: 'Romania', nativeName: 'România'),
    Country(code: 'BG', name: 'Bulgaria', nativeName: 'България'),
    Country(code: 'HR', name: 'Croatia', nativeName: 'Hrvatska'),
    Country(code: 'SI', name: 'Slovenia', nativeName: 'Slovenija'),
    Country(code: 'SK', name: 'Slovakia', nativeName: 'Slovensko'),
    Country(code: 'EE', name: 'Estonia', nativeName: 'Eesti'),
    Country(code: 'LV', name: 'Latvia', nativeName: 'Latvija'),
    Country(code: 'LT', name: 'Lithuania', nativeName: 'Lietuva'),
    Country(code: 'IE', name: 'Ireland', nativeName: 'Éire'),
    Country(code: 'IS', name: 'Iceland', nativeName: 'Ísland'),
    Country(code: 'GR', name: 'Greece', nativeName: 'Ελλάδα'),
    Country(code: 'TR', name: 'Turkey', nativeName: 'Türkiye'),
    Country(code: 'RU', name: 'Russia', nativeName: 'Россия'),
    Country(code: 'UA', name: 'Ukraine', nativeName: 'Україна'),
    
    // 중동
    Country(code: 'AE', name: 'United Arab Emirates', nativeName: 'الإمارات العربية المتحدة'),
    Country(code: 'SA', name: 'Saudi Arabia', nativeName: 'المملكة العربية السعودية'),
    Country(code: 'QA', name: 'Qatar', nativeName: 'قطر'),
    Country(code: 'KW', name: 'Kuwait', nativeName: 'الكويت'),
    Country(code: 'BH', name: 'Bahrain', nativeName: 'البحرين'),
    Country(code: 'OM', name: 'Oman', nativeName: 'عُمان'),
    Country(code: 'JO', name: 'Jordan', nativeName: 'الأردن'),
    Country(code: 'LB', name: 'Lebanon', nativeName: 'لبنان'),
    Country(code: 'IL', name: 'Israel', nativeName: 'ישראל'),
    Country(code: 'IR', name: 'Iran', nativeName: 'ایران'),
    
    // 아프리카
    Country(code: 'ZA', name: 'South Africa', nativeName: 'South Africa'),
    Country(code: 'EG', name: 'Egypt', nativeName: 'مصر'),
    Country(code: 'MA', name: 'Morocco', nativeName: 'المغرب'),
    Country(code: 'TN', name: 'Tunisia', nativeName: 'تونس'),
    Country(code: 'DZ', name: 'Algeria', nativeName: 'الجزائر'),
    Country(code: 'NG', name: 'Nigeria', nativeName: 'Nigeria'),
    Country(code: 'KE', name: 'Kenya', nativeName: 'Kenya'),
    Country(code: 'ET', name: 'Ethiopia', nativeName: 'ኢትዮጵያ'),
    Country(code: 'GH', name: 'Ghana', nativeName: 'Ghana'),
    
    // 남미
    Country(code: 'BR', name: 'Brazil', nativeName: 'Brasil'),
    Country(code: 'AR', name: 'Argentina', nativeName: 'Argentina'),
    Country(code: 'CL', name: 'Chile', nativeName: 'Chile'),
    Country(code: 'CO', name: 'Colombia', nativeName: 'Colombia'),
    Country(code: 'PE', name: 'Peru', nativeName: 'Perú'),
    Country(code: 'VE', name: 'Venezuela', nativeName: 'Venezuela'),
    Country(code: 'EC', name: 'Ecuador', nativeName: 'Ecuador'),
    Country(code: 'UY', name: 'Uruguay', nativeName: 'Uruguay'),
    Country(code: 'PY', name: 'Paraguay', nativeName: 'Paraguay'),
    Country(code: 'BO', name: 'Bolivia', nativeName: 'Bolivia'),
  ];

  /// 국가 코드로 국가 찾기
  static Country? findByCode(String code) {
    try {
      return all.firstWhere((country) => country.code == code);
    } catch (e) {
      return null;
    }
  }

  /// 인기 있는 국가들 (상위에 표시용)
  static const List<Country> popular = [
    Country(code: 'KR', name: 'South Korea', nativeName: '대한민국'),
    Country(code: 'US', name: 'United States', nativeName: 'United States'),
    Country(code: 'JP', name: 'Japan', nativeName: '日本'),
    Country(code: 'CN', name: 'China', nativeName: '中华人民共和国'),
    Country(code: 'GB', name: 'United Kingdom', nativeName: 'United Kingdom'),
    Country(code: 'DE', name: 'Germany', nativeName: 'Deutschland'),
    Country(code: 'FR', name: 'France', nativeName: 'France'),
    Country(code: 'CA', name: 'Canada', nativeName: 'Canada'),
    Country(code: 'AU', name: 'Australia', nativeName: 'Australia'),
    Country(code: 'SG', name: 'Singapore', nativeName: 'Singapore'),
  ];
}
