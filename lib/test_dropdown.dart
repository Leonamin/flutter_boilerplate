import 'package:flutter/material.dart';
import 'shared/components/index.dart';

class TestDropdownPage extends StatefulWidget {
  const TestDropdownPage({super.key});

  @override
  State<TestDropdownPage> createState() => _TestDropdownPageState();
}

class _TestDropdownPageState extends State<TestDropdownPage> {
  String? selectedCountry;
  String? selectedCity;

  final List<DropdownItem<String>> countries = [
    const DropdownItem(value: 'kr', label: '대한민국'),
    const DropdownItem(value: 'jp', label: '일본'),
    const DropdownItem(value: 'us', label: '미국'),
    const DropdownItem(value: 'cn', label: '중국'),
    const DropdownItem(value: 'fr', label: '프랑스'),
  ];

  final List<DropdownItem<String>> cities = [
    const DropdownItem(value: 'seoul', label: '서울'),
    const DropdownItem(value: 'busan', label: '부산'),
    const DropdownItem(value: 'incheon', label: '인천'),
    const DropdownItem(value: 'daegu', label: '대구'),
    const DropdownItem(value: 'daejeon', label: '대전'),
    const DropdownItem(value: 'gwangju', label: '광주'),
    const DropdownItem(value: 'ulsan', label: '울산'),
    const DropdownItem(value: 'sejong', label: '세종'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Dropdown Test',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AppDropdown<String>(
              items: countries,
              value: selectedCountry,
              hint: '국가를 선택하세요',
              label: '국가',
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),
            const SizedBox(height: 24),
            AppDropdown<String>(
              items: cities,
              value: selectedCity,
              hint: '도시를 선택하세요',
              label: '도시',
              color: DropdownColor.brand,
              maxHeight: 150.0,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            const SizedBox(height: 24),
            if (selectedCountry != null || selectedCity != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selected Values:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    if (selectedCountry != null)
                      Text('Country: $selectedCountry'),
                    if (selectedCity != null)
                      Text('City: $selectedCity'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
