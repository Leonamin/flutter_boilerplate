import 'package:flutter/material.dart';
import 'app_toggle_button.dart';
import 'toggle_button_size.dart';
import 'toggle_button_color.dart';

/// 토글 버튼 사용 예제 페이지
class ToggleButtonUsageExamples extends StatefulWidget {
  const ToggleButtonUsageExamples({super.key});

  @override
  State<ToggleButtonUsageExamples> createState() => _ToggleButtonUsageExamplesState();
}

class _ToggleButtonUsageExamplesState extends State<ToggleButtonUsageExamples> {
  // 기본 토글 버튼 상태
  bool basicToggle = false;
  
  // 크기별 토글 버튼 상태
  bool smallToggle = false;
  bool mediumToggle = true;
  bool largeToggle = false;
  
  // 색상별 토글 버튼 상태
  bool primaryToggle = true;
  bool brandToggle = false;
  bool successToggle = true;
  bool errorToggle = false;
  bool warningToggle = true;
  bool infoToggle = false;
  
  // 라벨이 있는 토글 버튼 상태
  bool labeledToggle = true;
  
  // 리스트 타일 토글 버튼 상태
  bool notificationToggle = true;
  bool darkModeToggle = false;
  bool locationToggle = true;
  bool bluetoothToggle = false;
  bool wifiToggle = true;
  
  // 설정 화면 예제 상태
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool smsNotifications = true;
  bool autoSave = true;
  bool offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Button Examples'),
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
            _buildLabelExample(),
            const SizedBox(height: 32),
            _buildDisabledExample(),
            const SizedBox(height: 32),
            _buildListTileExamples(),
            const SizedBox(height: 32),
            _buildSettingsExample(),
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
          'Basic Toggle Button',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        AppToggleButton(
          value: basicToggle,
          onChanged: (value) {
            setState(() {
              basicToggle = value;
            });
          },
        ),
        const SizedBox(height: 8),
        Text('Current value: $basicToggle'),
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
        Row(
          children: [
            Column(
              children: [
                AppToggleButton(
                  value: smallToggle,
                  onChanged: (value) {
                    setState(() {
                      smallToggle = value;
                    });
                  },
                  size: ToggleButtonSize.small,
                ),
                const SizedBox(height: 8),
                const Text('Small'),
              ],
            ),
            const SizedBox(width: 24),
            Column(
              children: [
                AppToggleButton(
                  value: mediumToggle,
                  onChanged: (value) {
                    setState(() {
                      mediumToggle = value;
                    });
                  },
                  size: ToggleButtonSize.medium,
                ),
                const SizedBox(height: 8),
                const Text('Medium'),
              ],
            ),
            const SizedBox(width: 24),
            Column(
              children: [
                AppToggleButton(
                  value: largeToggle,
                  onChanged: (value) {
                    setState(() {
                      largeToggle = value;
                    });
                  },
                  size: ToggleButtonSize.large,
                ),
                const SizedBox(height: 8),
                const Text('Large'),
              ],
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
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Column(
              children: [
                AppToggleButton(
                  value: primaryToggle,
                  onChanged: (value) {
                    setState(() {
                      primaryToggle = value;
                    });
                  },
                  color: ToggleButtonColor.primary,
                ),
                const SizedBox(height: 8),
                const Text('Primary'),
              ],
            ),
            Column(
              children: [
                AppToggleButton(
                  value: brandToggle,
                  onChanged: (value) {
                    setState(() {
                      brandToggle = value;
                    });
                  },
                  color: ToggleButtonColor.brand,
                ),
                const SizedBox(height: 8),
                const Text('Brand'),
              ],
            ),
            Column(
              children: [
                AppToggleButton(
                  value: successToggle,
                  onChanged: (value) {
                    setState(() {
                      successToggle = value;
                    });
                  },
                  color: ToggleButtonColor.success,
                ),
                const SizedBox(height: 8),
                const Text('Success'),
              ],
            ),
            Column(
              children: [
                AppToggleButton(
                  value: errorToggle,
                  onChanged: (value) {
                    setState(() {
                      errorToggle = value;
                    });
                  },
                  color: ToggleButtonColor.error,
                ),
                const SizedBox(height: 8),
                const Text('Error'),
              ],
            ),
            Column(
              children: [
                AppToggleButton(
                  value: warningToggle,
                  onChanged: (value) {
                    setState(() {
                      warningToggle = value;
                    });
                  },
                  color: ToggleButtonColor.warning,
                ),
                const SizedBox(height: 8),
                const Text('Warning'),
              ],
            ),
            Column(
              children: [
                AppToggleButton(
                  value: infoToggle,
                  onChanged: (value) {
                    setState(() {
                      infoToggle = value;
                    });
                  },
                  color: ToggleButtonColor.info,
                ),
                const SizedBox(height: 8),
                const Text('Info'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLabelExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Toggle Button with Label',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        AppToggleButton(
          value: labeledToggle,
          onChanged: (value) {
            setState(() {
              labeledToggle = value;
            });
          },
          label: 'Enable notifications',
          color: ToggleButtonColor.brand,
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
        Row(
          children: [
            Column(
              children: [
                const AppToggleButton(
                  value: false,
                  onChanged: null,
                  enabled: false,
                ),
                const SizedBox(height: 8),
                const Text('Disabled OFF'),
              ],
            ),
            const SizedBox(width: 24),
            Column(
              children: [
                const AppToggleButton(
                  value: true,
                  onChanged: null,
                  enabled: false,
                ),
                const SizedBox(height: 8),
                const Text('Disabled ON'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListTileExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'List Tile Examples',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              AppToggleButtonListTile(
                title: const Text('Push Notifications'),
                subtitle: const Text('Receive notifications on your device'),
                value: notificationToggle,
                onChanged: (value) {
                  setState(() {
                    notificationToggle = value;
                  });
                },
                color: ToggleButtonColor.brand,
              ),
              const Divider(height: 1),
              AppToggleButtonListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Use dark theme'),
                value: darkModeToggle,
                onChanged: (value) {
                  setState(() {
                    darkModeToggle = value;
                  });
                },
                color: ToggleButtonColor.primary,
              ),
              const Divider(height: 1),
              AppToggleButtonListTile(
                title: const Text('Location Services'),
                subtitle: const Text('Allow app to access your location'),
                value: locationToggle,
                onChanged: (value) {
                  setState(() {
                    locationToggle = value;
                  });
                },
                color: ToggleButtonColor.info,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const Divider(height: 1),
              AppToggleButtonListTile(
                title: const Text('Bluetooth'),
                value: bluetoothToggle,
                onChanged: (value) {
                  setState(() {
                    bluetoothToggle = value;
                  });
                },
                color: ToggleButtonColor.info,
                size: ToggleButtonSize.small,
              ),
              const Divider(height: 1),
              AppToggleButtonListTile(
                title: const Text('Wi-Fi'),
                value: wifiToggle,
                onChanged: (value) {
                  setState(() {
                    wifiToggle = value;
                  });
                },
                color: ToggleButtonColor.success,
                size: ToggleButtonSize.large,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings Screen Example',
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
                  'Notifications',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                AppToggleButtonListTile(
                  title: const Text('Push Notifications'),
                  subtitle: const Text('Get notified about important updates'),
                  value: pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      pushNotifications = value;
                    });
                  },
                  color: ToggleButtonColor.brand,
                  contentPadding: EdgeInsets.zero,
                ),
                AppToggleButtonListTile(
                  title: const Text('Email Notifications'),
                  subtitle: const Text('Receive updates via email'),
                  value: emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      emailNotifications = value;
                    });
                  },
                  color: ToggleButtonColor.info,
                  contentPadding: EdgeInsets.zero,
                ),
                AppToggleButtonListTile(
                  title: const Text('SMS Notifications'),
                  subtitle: const Text('Get text message alerts'),
                  value: smsNotifications,
                  onChanged: (value) {
                    setState(() {
                      smsNotifications = value;
                    });
                  },
                  color: ToggleButtonColor.warning,
                  contentPadding: EdgeInsets.zero,
                ),
                const SizedBox(height: 24),
                Text(
                  'App Preferences',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                AppToggleButtonListTile(
                  title: const Text('Auto Save'),
                  subtitle: const Text('Automatically save your work'),
                  value: autoSave,
                  onChanged: (value) {
                    setState(() {
                      autoSave = value;
                    });
                  },
                  color: ToggleButtonColor.success,
                  contentPadding: EdgeInsets.zero,
                ),
                AppToggleButtonListTile(
                  title: const Text('Offline Mode'),
                  subtitle: const Text('Work without internet connection'),
                  value: offlineMode,
                  onChanged: (value) {
                    setState(() {
                      offlineMode = value;
                    });
                  },
                  color: ToggleButtonColor.primary,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
