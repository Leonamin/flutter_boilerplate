import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/atoms/radio_buttons/app_radio_button.dart';
import 'package:flutter_boilerplate/shared/components/atoms/radio_buttons/radio_button_size.dart';
import 'package:flutter_boilerplate/shared/components/atoms/radio_buttons/radio_button_color.dart';

/// RadioButton 사용 예제 페이지
class RadioButtonUsageExamples extends StatefulWidget {
  const RadioButtonUsageExamples({super.key});

  @override
  State<RadioButtonUsageExamples> createState() => _RadioButtonUsageExamplesState();
}

class _RadioButtonUsageExamplesState extends State<RadioButtonUsageExamples> {
  // 크기별 라디오 버튼 상태들
  String? _sizeSelection = 'medium';
  
  // 색상별 라디오 버튼 상태들
  String? _colorSelection = 'brand';
  
  // 리스트 타일 상태들
  String? _paymentMethod = 'card';
  String? _deliveryMethod = 'standard';
  
  // 설정 옵션들
  String? _theme = 'system';
  String? _language = 'ko';
  String? _notification = 'all';
  
  // 그룹 예제
  String? _difficulty = 'medium';
  String? _category = 'technology';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioButton Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Sizes'),
            _buildSizeExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Colors'),
            _buildColorExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('With Labels'),
            _buildLabelExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Disabled State'),
            _buildDisabledExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('List Tiles'),
            _buildListTileExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Radio Button Groups'),
            _buildGroupExamples(),
            
            const SizedBox(height: 32),
            _buildSectionTitle('Settings Example'),
            _buildSettingsExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSizeExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Small',
          AppRadioButton<String>(
            size: RadioButtonSize.small,
            value: 'small',
            groupValue: _sizeSelection,
            onChanged: (value) => setState(() => _sizeSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Medium',
          AppRadioButton<String>(
            size: RadioButtonSize.medium,
            value: 'medium',
            groupValue: _sizeSelection,
            onChanged: (value) => setState(() => _sizeSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Large',
          AppRadioButton<String>(
            size: RadioButtonSize.large,
            value: 'large',
            groupValue: _sizeSelection,
            onChanged: (value) => setState(() => _sizeSelection = value),
          ),
        ),
      ],
    );
  }

  Widget _buildColorExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Primary',
          AppRadioButton<String>(
            color: RadioButtonColor.primary,
            value: 'primary',
            groupValue: _colorSelection,
            onChanged: (value) => setState(() => _colorSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Brand',
          AppRadioButton<String>(
            color: RadioButtonColor.brand,
            value: 'brand',
            groupValue: _colorSelection,
            onChanged: (value) => setState(() => _colorSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Success',
          AppRadioButton<String>(
            color: RadioButtonColor.success,
            value: 'success',
            groupValue: _colorSelection,
            onChanged: (value) => setState(() => _colorSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Error',
          AppRadioButton<String>(
            color: RadioButtonColor.error,
            value: 'error',
            groupValue: _colorSelection,
            onChanged: (value) => setState(() => _colorSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Warning',
          AppRadioButton<String>(
            color: RadioButtonColor.warning,
            value: 'warning',
            groupValue: _colorSelection,
            onChanged: (value) => setState(() => _colorSelection = value),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Info',
          AppRadioButton<String>(
            color: RadioButtonColor.info,
            value: 'info',
            groupValue: _colorSelection,
            onChanged: (value) => setState(() => _colorSelection = value),
          ),
        ),
      ],
    );
  }

  Widget _buildLabelExamples() {
    return Column(
      children: [
        AppRadioButton<String>(
          value: 'option1',
          groupValue: _sizeSelection,
          onChanged: (value) => setState(() => _sizeSelection = value),
          label: 'Option 1 with label',
        ),
        const SizedBox(height: 16),
        AppRadioButton<String>(
          color: RadioButtonColor.brand,
          value: 'option2',
          groupValue: _sizeSelection,
          onChanged: (value) => setState(() => _sizeSelection = value),
          label: 'Brand color option',
        ),
        const SizedBox(height: 16),
        AppRadioButton<String>(
          size: RadioButtonSize.large,
          color: RadioButtonColor.success,
          value: 'option3',
          groupValue: _sizeSelection,
          onChanged: (value) => setState(() => _sizeSelection = value),
          label: 'Large success option',
        ),
      ],
    );
  }

  Widget _buildDisabledExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Disabled Unselected',
          AppRadioButton<String>(
            value: 'disabled1',
            groupValue: null,
            onChanged: null,
            enabled: false,
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Disabled Selected',
          AppRadioButton<String>(
            value: 'disabled2',
            groupValue: 'disabled2',
            onChanged: null,
            enabled: false,
          ),
        ),
        const SizedBox(height: 16),
        AppRadioButton<String>(
          value: 'disabled3',
          groupValue: 'disabled3',
          onChanged: null,
          enabled: false,
          label: 'Disabled with label',
        ),
      ],
    );
  }

  Widget _buildListTileExamples() {
    return Column(
      children: [
        AppRadioButtonListTile<String>(
          title: 'Credit Card',
          subtitle: 'Pay with your credit or debit card',
          value: 'card',
          groupValue: _paymentMethod,
          onChanged: (value) => setState(() => _paymentMethod = value),
        ),
        const Divider(),
        AppRadioButtonListTile<String>(
          title: 'PayPal',
          subtitle: 'Pay with your PayPal account',
          color: RadioButtonColor.brand,
          value: 'paypal',
          groupValue: _paymentMethod,
          onChanged: (value) => setState(() => _paymentMethod = value),
        ),
        const Divider(),
        AppRadioButtonListTile<String>(
          title: 'Bank Transfer',
          subtitle: 'Direct bank transfer',
          controlAffinity: true,
          value: 'bank',
          groupValue: _paymentMethod,
          onChanged: (value) => setState(() => _paymentMethod = value),
        ),
        const Divider(),
        AppRadioButtonListTile<String>(
          title: 'Cash on Delivery',
          subtitle: 'Pay when you receive the item',
          size: RadioButtonSize.large,
          color: RadioButtonColor.success,
          value: 'cod',
          groupValue: _paymentMethod,
          onChanged: (value) => setState(() => _paymentMethod = value),
        ),
      ],
    );
  }

  Widget _buildGroupExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Difficulty Level (Vertical)',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        AppRadioButtonGroup<String>(
          color: RadioButtonColor.brand,
          options: const [
            RadioButtonOption(value: 'easy', label: 'Easy'),
            RadioButtonOption(value: 'medium', label: 'Medium'),
            RadioButtonOption(value: 'hard', label: 'Hard'),
            RadioButtonOption(value: 'expert', label: 'Expert', enabled: false),
          ],
          groupValue: _difficulty,
          onChanged: (value) => setState(() => _difficulty = value),
          direction: Axis.vertical,
        ),
        
        const SizedBox(height: 24),
        const Text(
          'Category (Horizontal)',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        AppRadioButtonGroup<String>(
          size: RadioButtonSize.small,
          color: RadioButtonColor.info,
          options: const [
            RadioButtonOption(value: 'technology', label: 'Tech'),
            RadioButtonOption(value: 'design', label: 'Design'),
            RadioButtonOption(value: 'business', label: 'Business'),
          ],
          groupValue: _category,
          onChanged: (value) => setState(() => _category = value),
          direction: Axis.horizontal,
          spacing: 16.0,
        ),
      ],
    );
  }

  Widget _buildSettingsExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            const Text(
              'Theme',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            AppRadioButtonGroup<String>(
              color: RadioButtonColor.primary,
              options: const [
                RadioButtonOption(value: 'light', label: 'Light'),
                RadioButtonOption(value: 'dark', label: 'Dark'),
                RadioButtonOption(value: 'system', label: 'System'),
              ],
              groupValue: _theme,
              onChanged: (value) => setState(() => _theme = value),
              direction: Axis.horizontal,
              spacing: 16.0,
            ),
            
            const SizedBox(height: 24),
            const Text(
              'Language',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            AppRadioButtonListTile<String>(
              title: '한국어',
              value: 'ko',
              groupValue: _language,
              onChanged: (value) => setState(() => _language = value),
              contentPadding: EdgeInsets.zero,
            ),
            AppRadioButtonListTile<String>(
              title: 'English',
              value: 'en',
              groupValue: _language,
              onChanged: (value) => setState(() => _language = value),
              contentPadding: EdgeInsets.zero,
            ),
            AppRadioButtonListTile<String>(
              title: '日本語',
              value: 'ja',
              groupValue: _language,
              onChanged: (value) => setState(() => _language = value),
              contentPadding: EdgeInsets.zero,
            ),
            
            const SizedBox(height: 24),
            const Text(
              'Notifications',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            AppRadioButtonListTile<String>(
              title: 'All Notifications',
              subtitle: 'Receive all types of notifications',
              color: RadioButtonColor.success,
              value: 'all',
              groupValue: _notification,
              onChanged: (value) => setState(() => _notification = value),
              contentPadding: EdgeInsets.zero,
            ),
            AppRadioButtonListTile<String>(
              title: 'Important Only',
              subtitle: 'Only critical notifications',
              color: RadioButtonColor.warning,
              value: 'important',
              groupValue: _notification,
              onChanged: (value) => setState(() => _notification = value),
              contentPadding: EdgeInsets.zero,
            ),
            AppRadioButtonListTile<String>(
              title: 'None',
              subtitle: 'Turn off all notifications',
              color: RadioButtonColor.error,
              value: 'none',
              groupValue: _notification,
              onChanged: (value) => setState(() => _notification = value),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleRow(String title, Widget radioButton) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(child: radioButton),
      ],
    );
  }
}
