import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/atoms/checkboxes/app_checkbox.dart';
import 'package:flutter_boilerplate/shared/components/atoms/checkboxes/checkbox_size.dart';
import 'package:flutter_boilerplate/shared/components/atoms/checkboxes/checkbox_color.dart';

/// Checkbox 사용 예제 페이지
class CheckboxUsageExamples extends StatefulWidget {
  const CheckboxUsageExamples({super.key});

  @override
  State<CheckboxUsageExamples> createState() => _CheckboxUsageExamplesState();
}

class _CheckboxUsageExamplesState extends State<CheckboxUsageExamples> {
  // 기본 체크박스 상태들
  bool _smallChecked = false;
  bool _mediumChecked = true;
  bool _largeChecked = false;
  
  // 색상별 체크박스 상태들
  bool _primaryChecked = true;
  bool _brandChecked = false;
  bool _successChecked = true;
  bool _errorChecked = false;
  bool _warningChecked = true;
  bool _infoChecked = false;
  
  // 리스트 아이템 상태들
  bool _item1Checked = true;
  bool _item2Checked = false;
  bool _item3Checked = true;
  bool _item4Checked = false;
  
  // 설정 옵션들
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _soundEnabled = true;
  bool _autoSaveEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Examples'),
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
          AppCheckbox(
            size: CheckboxSize.small,
            value: _smallChecked,
            onChanged: (value) => setState(() => _smallChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Medium',
          AppCheckbox(
            size: CheckboxSize.medium,
            value: _mediumChecked,
            onChanged: (value) => setState(() => _mediumChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Large',
          AppCheckbox(
            size: CheckboxSize.large,
            value: _largeChecked,
            onChanged: (value) => setState(() => _largeChecked = value ?? false),
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
          AppCheckbox(
            color: CheckboxColor.primary,
            value: _primaryChecked,
            onChanged: (value) => setState(() => _primaryChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Brand',
          AppCheckbox(
            color: CheckboxColor.brand,
            value: _brandChecked,
            onChanged: (value) => setState(() => _brandChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Success',
          AppCheckbox(
            color: CheckboxColor.success,
            value: _successChecked,
            onChanged: (value) => setState(() => _successChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Error',
          AppCheckbox(
            color: CheckboxColor.error,
            value: _errorChecked,
            onChanged: (value) => setState(() => _errorChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Warning',
          AppCheckbox(
            color: CheckboxColor.warning,
            value: _warningChecked,
            onChanged: (value) => setState(() => _warningChecked = value ?? false),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Info',
          AppCheckbox(
            color: CheckboxColor.info,
            value: _infoChecked,
            onChanged: (value) => setState(() => _infoChecked = value ?? false),
          ),
        ),
      ],
    );
  }

  Widget _buildLabelExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'With Label',
          AppCheckbox(
            value: _smallChecked,
            onChanged: (value) => setState(() => _smallChecked = value ?? false),
            label: 'I agree to the terms and conditions',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Brand + Label',
          AppCheckbox(
            color: CheckboxColor.brand,
            value: _brandChecked,
            onChanged: (value) => setState(() => _brandChecked = value ?? false),
            label: 'Subscribe to newsletter',
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Large + Label',
          AppCheckbox(
            size: CheckboxSize.large,
            color: CheckboxColor.success,
            value: _successChecked,
            onChanged: (value) => setState(() => _successChecked = value ?? false),
            label: 'Enable notifications',
          ),
        ),
      ],
    );
  }

  Widget _buildDisabledExamples() {
    return Column(
      children: [
        _buildExampleRow(
          'Disabled Unchecked',
          AppCheckbox(
            value: false,
            onChanged: null,
            enabled: false,
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Disabled Checked',
          AppCheckbox(
            value: true,
            onChanged: null,
            enabled: false,
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleRow(
          'Disabled with Label',
          AppCheckbox(
            value: true,
            onChanged: null,
            enabled: false,
            label: 'This option is disabled',
          ),
        ),
      ],
    );
  }

  Widget _buildListTileExamples() {
    return Column(
      children: [
        AppCheckboxListTile(
          title: 'Basic List Item',
          subtitle: 'This is a subtitle',
          value: _item1Checked,
          onChanged: (value) => setState(() => _item1Checked = value ?? false),
        ),
        const Divider(),
        AppCheckboxListTile(
          title: 'Brand Color Item',
          subtitle: 'With brand color checkbox',
          color: CheckboxColor.brand,
          value: _item2Checked,
          onChanged: (value) => setState(() => _item2Checked = value ?? false),
        ),
        const Divider(),
        AppCheckboxListTile(
          title: 'Trailing Checkbox',
          subtitle: 'Checkbox on the right side',
          controlAffinity: true,
          value: _item3Checked,
          onChanged: (value) => setState(() => _item3Checked = value ?? false),
        ),
        const Divider(),
        AppCheckboxListTile(
          title: 'Large Success Checkbox',
          subtitle: 'Large size with success color',
          size: CheckboxSize.large,
          color: CheckboxColor.success,
          value: _item4Checked,
          onChanged: (value) => setState(() => _item4Checked = value ?? false),
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
              'App Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            AppCheckboxListTile(
              title: 'Push Notifications',
              subtitle: 'Receive notifications on your device',
              color: CheckboxColor.brand,
              value: _notificationsEnabled,
              onChanged: (value) => setState(() => _notificationsEnabled = value ?? false),
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(),
            AppCheckboxListTile(
              title: 'Dark Mode',
              subtitle: 'Use dark theme for the app',
              color: CheckboxColor.primary,
              value: _darkModeEnabled,
              onChanged: (value) => setState(() => _darkModeEnabled = value ?? false),
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(),
            AppCheckboxListTile(
              title: 'Sound Effects',
              subtitle: 'Play sounds for interactions',
              color: CheckboxColor.info,
              value: _soundEnabled,
              onChanged: (value) => setState(() => _soundEnabled = value ?? false),
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(),
            AppCheckboxListTile(
              title: 'Auto Save',
              subtitle: 'Automatically save your progress',
              color: CheckboxColor.success,
              value: _autoSaveEnabled,
              onChanged: (value) => setState(() => _autoSaveEnabled = value ?? false),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleRow(String title, Widget checkbox) {
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
        Flexible(child: checkbox),
      ],
    );
  }
}
