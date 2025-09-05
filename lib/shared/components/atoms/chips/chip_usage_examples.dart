import 'package:flutter/material.dart';
import 'app_chip.dart';
import 'chip_color.dart';
import 'chip_size.dart';

/// 칩 컴포넌트 사용 예제
class ChipUsageExamples extends StatefulWidget {
  const ChipUsageExamples({super.key});

  @override
  State<ChipUsageExamples> createState() => _ChipUsageExamplesState();
}

class _ChipUsageExamplesState extends State<ChipUsageExamples> {
  // Filter states
  Set<String> selectedCategories = {'Technology'};
  Set<String> selectedTags = {'Popular'};
  String selectedSort = 'Recent';
  
  // Tab states
  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip Examples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Basic Chips', _buildBasicChips()),
              const SizedBox(height: 32),
              _buildSection('Size Variations', _buildSizeChips()),
              const SizedBox(height: 32),
              _buildSection('Color Variations', _buildColorChips()),
              const SizedBox(height: 32),
              _buildSection('Icon Chips', _buildIconChips()),
              const SizedBox(height: 32),
              _buildSection('Interactive Filter Example', _buildFilterExample()),
              const SizedBox(height: 32),
              _buildSection('Tab Selection Example', _buildTabExample()),
              const SizedBox(height: 32),
              _buildSection('Sort Options Example', _buildSortExample()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildBasicChips() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppChip(text: 'Inactive Chip', isActive: false),
        AppChip(text: 'Active Chip', isActive: true),
        AppChip(text: 'Primary', color: ChipColor.primary, isActive: true),
        AppChip(text: 'Brand', color: ChipColor.brand, isActive: true),
      ],
    );
  }

  Widget _buildSizeChips() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Small Size:'),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            AppChip(text: 'Small Inactive', size: ChipSize.small, isActive: false),
            AppChip(text: 'Small Active', size: ChipSize.small, isActive: true),
          ],
        ),
        SizedBox(height: 16),
        Text('Medium Size:'),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            AppChip(text: 'Medium Inactive', size: ChipSize.medium, isActive: false),
            AppChip(text: 'Medium Active', size: ChipSize.medium, isActive: true),
          ],
        ),
      ],
    );
  }

  Widget _buildColorChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppChip(text: 'Primary', color: ChipColor.primary, isActive: true),
        AppChip(text: 'Brand', color: ChipColor.brand, isActive: true),
        AppChip(text: 'Secondary', color: ChipColor.secondary, isActive: true),
        AppChip(text: 'Tertiary', color: ChipColor.tertiary, isActive: true),
        AppChip(text: 'Error', color: ChipColor.error, isActive: true),
        AppChip(text: 'Warning', color: ChipColor.warning, isActive: true),
        AppChip(text: 'Info', color: ChipColor.info, isActive: true),
        AppChip(text: 'Success', color: ChipColor.success, isActive: true),
      ],
    );
  }

  Widget _buildIconChips() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppChip(
          text: 'Filter',
          icon: Icons.filter_list,
          color: ChipColor.primary,
          isActive: false,
        ),
        AppChip(
          text: 'Search',
          icon: Icons.search,
          color: ChipColor.brand,
          isActive: true,
        ),
        AppChip(
          text: 'Favorite',
          icon: Icons.favorite,
          color: ChipColor.error,
          isActive: true,
          size: ChipSize.small,
        ),
        AppChip(
          text: 'Settings',
          icon: Icons.settings,
          color: ChipColor.secondary,
          isActive: false,
          size: ChipSize.small,
        ),
      ],
    );
  }

  Widget _buildFilterExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Categories:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            'Technology',
            'Design',
            'Business',
            'Marketing',
            'Development'
          ].map((category) {
            final isSelected = selectedCategories.contains(category);
            return AppChip(
              text: category,
              isActive: isSelected,
              color: ChipColor.primary,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedCategories.remove(category);
                  } else {
                    selectedCategories.add(category);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        const Text('Tags:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            'Popular',
            'Trending',
            'New',
            'Featured',
            'Premium'
          ].map((tag) {
            final isSelected = selectedTags.contains(tag);
            return AppChip(
              text: tag,
              isActive: isSelected,
              color: ChipColor.brand,
              size: ChipSize.small,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedTags.remove(tag);
                  } else {
                    selectedTags.add(tag);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTabExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Navigation Tabs:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            'All',
            'Articles',
            'Videos',
            'Podcasts',
            'Courses'
          ].map((tab) {
            final isSelected = selectedTab == tab;
            return AppChip(
              text: tab,
              isActive: isSelected,
              color: ChipColor.secondary,
              onTap: () {
                setState(() {
                  selectedTab = tab;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSortExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sort Options:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ('Recent', Icons.schedule),
            ('Popular', Icons.trending_up),
            ('Rating', Icons.star),
            ('Price', Icons.attach_money),
          ].map((option) {
            final (text, icon) = option;
            final isSelected = selectedSort == text;
            return AppChip(
              text: text,
              icon: icon,
              isActive: isSelected,
              color: ChipColor.tertiary,
              size: ChipSize.small,
              onTap: () {
                setState(() {
                  selectedSort = text;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
