import 'package:flutter/material.dart';
import 'app_dropdown.dart';
import 'dropdown_size.dart';
import 'dropdown_color.dart';

/// 드롭다운 사용 예제 페이지
class DropdownUsageExamples extends StatefulWidget {
  const DropdownUsageExamples({super.key});

  @override
  State<DropdownUsageExamples> createState() => _DropdownUsageExamplesState();
}

class _DropdownUsageExamplesState extends State<DropdownUsageExamples> {
  // 기본 드롭다운 상태
  String? selectedCountry;
  
  // 크기별 드롭다운 상태
  String? smallCity;
  String? mediumCity;
  String? largeCity;
  
  // 색상별 드롭다운 상태
  String? primaryLanguage;
  String? brandCategory;
  String? successStatus;
  String? errorPriority;
  String? warningLevel;
  String? infoType;
  
  // 검색 가능한 드롭다운 상태
  String? searchableCountry;
  
  // 아이콘이 있는 드롭다운 상태
  String? iconCategory;
  
  // 폼 예제 상태
  String? formCountry;
  String? formCity;
  String? formLanguage;

  // 국가 목록
  final List<DropdownItem<String>> countries = [
    const DropdownItem(value: 'kr', label: '대한민국'),
    const DropdownItem(value: 'jp', label: '일본'),
    const DropdownItem(value: 'cn', label: '중국'),
    const DropdownItem(value: 'us', label: '미국'),
    const DropdownItem(value: 'uk', label: '영국'),
    const DropdownItem(value: 'fr', label: '프랑스'),
    const DropdownItem(value: 'de', label: '독일'),
    const DropdownItem(value: 'it', label: '이탈리아'),
    const DropdownItem(value: 'es', label: '스페인'),
    const DropdownItem(value: 'au', label: '호주'),
  ];

  // 도시 목록
  final List<DropdownItem<String>> cities = [
    const DropdownItem(value: 'seoul', label: '서울'),
    const DropdownItem(value: 'busan', label: '부산'),
    const DropdownItem(value: 'incheon', label: '인천'),
    const DropdownItem(value: 'daegu', label: '대구'),
    const DropdownItem(value: 'daejeon', label: '대전'),
    const DropdownItem(value: 'gwangju', label: '광주'),
    const DropdownItem(value: 'ulsan', label: '울산'),
  ];

  // 언어 목록
  final List<DropdownItem<String>> languages = [
    const DropdownItem(value: 'ko', label: '한국어'),
    const DropdownItem(value: 'en', label: 'English'),
    const DropdownItem(value: 'ja', label: '日本語'),
    const DropdownItem(value: 'zh', label: '中文'),
    const DropdownItem(value: 'es', label: 'Español'),
  ];

  // 카테고리 목록 (아이콘 포함)
  final List<DropdownItem<String>> categories = [
    DropdownItem(
      value: 'food',
      label: '음식',
      icon: Icon(Icons.restaurant, size: 20),
    ),
    DropdownItem(
      value: 'travel',
      label: '여행',
      icon: Icon(Icons.flight, size: 20),
    ),
    DropdownItem(
      value: 'shopping',
      label: '쇼핑',
      icon: Icon(Icons.shopping_cart, size: 20),
    ),
    DropdownItem(
      value: 'entertainment',
      label: '엔터테인먼트',
      icon: Icon(Icons.movie, size: 20),
    ),
    DropdownItem(
      value: 'sports',
      label: '스포츠',
      icon: Icon(Icons.sports_soccer, size: 20),
    ),
  ];

  // 상태 목록
  final List<DropdownItem<String>> statusList = [
    const DropdownItem(value: 'active', label: '활성'),
    const DropdownItem(value: 'inactive', label: '비활성'),
    const DropdownItem(value: 'pending', label: '대기중'),
    const DropdownItem(value: 'completed', label: '완료'),
  ];

  // 우선순위 목록
  final List<DropdownItem<String>> priorities = [
    const DropdownItem(value: 'low', label: '낮음'),
    const DropdownItem(value: 'medium', label: '보통'),
    const DropdownItem(value: 'high', label: '높음'),
    const DropdownItem(value: 'urgent', label: '긴급'),
  ];

  // 레벨 목록
  final List<DropdownItem<String>> levels = [
    const DropdownItem(value: 'beginner', label: '초급'),
    const DropdownItem(value: 'intermediate', label: '중급'),
    const DropdownItem(value: 'advanced', label: '고급'),
    const DropdownItem(value: 'expert', label: '전문가'),
  ];

  // 타입 목록
  final List<DropdownItem<String>> types = [
    const DropdownItem(value: 'info', label: '정보'),
    const DropdownItem(value: 'warning', label: '경고'),
    const DropdownItem(value: 'error', label: '오류'),
    const DropdownItem(value: 'success', label: '성공'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasicExample(),
            const SizedBox(height: 32),
            _buildSizeExamples(),
            const SizedBox(height: 32),
            _buildColorExamples(),
            const SizedBox(height: 32),
            _buildSearchableExample(),
            const SizedBox(height: 32),
            _buildIconExample(),
            const SizedBox(height: 32),
            _buildDisabledExample(),
            const SizedBox(height: 32),
            _buildFormExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Dropdown',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        AppDropdown<String>(
          items: countries,
          value: selectedCountry,
          hint: '국가를 선택하세요',
          onChanged: (value) {
            setState(() {
              selectedCountry = value;
            });
          },
        ),
        const SizedBox(height: 8),
        Text('Selected: ${selectedCountry ?? 'None'}'),
      ],
    );
  }

  Widget _buildSizeExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size Variants',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            AppDropdown<String>(
              items: cities,
              value: smallCity,
              hint: 'Small dropdown',
              size: DropdownSize.small,
              onChanged: (value) {
                setState(() {
                  smallCity = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: cities,
              value: mediumCity,
              hint: 'Medium dropdown',
              size: DropdownSize.medium,
              onChanged: (value) {
                setState(() {
                  mediumCity = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: cities,
              value: largeCity,
              hint: 'Large dropdown',
              size: DropdownSize.large,
              onChanged: (value) {
                setState(() {
                  largeCity = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Variants',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            AppDropdown<String>(
              items: languages,
              value: primaryLanguage,
              hint: 'Primary color',
              color: DropdownColor.primary,
              onChanged: (value) {
                setState(() {
                  primaryLanguage = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: categories.map((item) => DropdownItem(
                value: item.value,
                label: item.label,
              )).toList(),
              value: brandCategory,
              hint: 'Brand color',
              color: DropdownColor.brand,
              onChanged: (value) {
                setState(() {
                  brandCategory = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: statusList,
              value: successStatus,
              hint: 'Success color',
              color: DropdownColor.success,
              onChanged: (value) {
                setState(() {
                  successStatus = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: priorities,
              value: errorPriority,
              hint: 'Error color',
              color: DropdownColor.error,
              onChanged: (value) {
                setState(() {
                  errorPriority = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: levels,
              value: warningLevel,
              hint: 'Warning color',
              color: DropdownColor.warning,
              onChanged: (value) {
                setState(() {
                  warningLevel = value;
                });
              },
            ),
            const SizedBox(height: 12),
            AppDropdown<String>(
              items: types,
              value: infoType,
              hint: 'Info color',
              color: DropdownColor.info,
              onChanged: (value) {
                setState(() {
                  infoType = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchableExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Height Limited Dropdown',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        AppDropdown<String>(
          items: countries,
          value: searchableCountry,
          hint: '국가를 선택하세요',
          color: DropdownColor.brand,
          maxHeight: 150.0,
          onChanged: (value) {
            setState(() {
              searchableCountry = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildIconExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dropdown with Icons',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        AppDropdown<String>(
          items: categories,
          value: iconCategory,
          hint: '카테고리를 선택하세요',
          prefixIcon: const Icon(Icons.category),
          onChanged: (value) {
            setState(() {
              iconCategory = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDisabledExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Disabled State',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        AppDropdown<String>(
          items: countries,
          value: 'kr',
          hint: '비활성화된 드롭다운',
          enabled: false,
          onChanged: null,
        ),
      ],
    );
  }

  Widget _buildFormExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Form Example',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사용자 정보',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                AppDropdown<String>(
                  items: countries,
                  value: formCountry,
                  label: '국가',
                  hint: '국가를 선택하세요',
                  helperText: '거주 중인 국가를 선택해주세요',
                  onChanged: (value) {
                    setState(() {
                      formCountry = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                AppDropdown<String>(
                  items: cities,
                  value: formCity,
                  label: '도시',
                  hint: '도시를 선택하세요',
                  errorText: formCity == null ? '도시를 선택해주세요' : null,
                  color: formCity == null ? DropdownColor.error : DropdownColor.primary,
                  onChanged: (value) {
                    setState(() {
                      formCity = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                AppDropdown<String>(
                  items: languages,
                  value: formLanguage,
                  label: '언어',
                  hint: '선호 언어를 선택하세요',
                  color: DropdownColor.brand,
                  maxHeight: 120.0,
                  onChanged: (value) {
                    setState(() {
                      formLanguage = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: formCountry != null && formCity != null && formLanguage != null
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '선택됨: $formCountry, $formCity, $formLanguage',
                                ),
                              ),
                            );
                          }
                        : null,
                    child: const Text('제출'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
