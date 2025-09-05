import 'package:flutter/material.dart';
import 'toast_util.dart';

class ToastUsageExamples extends StatefulWidget {
  const ToastUsageExamples({super.key});

  @override
  State<ToastUsageExamples> createState() => _ToastUsageExamplesState();
}

class _ToastUsageExamplesState extends State<ToastUsageExamples> {
  @override
  void initState() {
    super.initState();
    // ToastUtil 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ToastUtil.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Examples'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBasicExamples(),
            const SizedBox(height: 32),
            _buildCustomDurationExamples(),
            const SizedBox(height: 32),
            _buildSimpleToastExample(),
            const SizedBox(height: 32),
            _buildUtilityButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Toast Types',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildToastButton(
          'Show Info Toast',
          Colors.blue,
          () => ToastUtil.showInfo(context, '정보 메시지입니다. 작업이 성공적으로 완료되었습니다.'),
        ),
        const SizedBox(height: 12),
        _buildToastButton(
          'Show Warning Toast',
          Colors.orange,
          () => ToastUtil.showWarning(context, '경고 메시지입니다. 주의가 필요합니다.'),
        ),
        const SizedBox(height: 12),
        _buildToastButton(
          'Show Error Toast',
          Colors.red,
          () => ToastUtil.showError(context, '오류가 발생했습니다. 다시 시도해주세요.'),
        ),
      ],
    );
  }

  Widget _buildCustomDurationExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Duration Toasts',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildToastButton(
          'Short Duration (1s)',
          Colors.blue,
          () => ToastUtil.showInfo(
            context,
            '짧은 토스트 메시지',
            duration: const Duration(seconds: 1),
          ),
        ),
        const SizedBox(height: 12),
        _buildToastButton(
          'Long Duration (5s)',
          Colors.orange,
          () => ToastUtil.showWarning(
            context,
            '긴 토스트 메시지입니다. 5초 동안 표시됩니다.',
            duration: const Duration(seconds: 5),
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleToastExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Simple Toast (Default Style)',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildToastButton(
          'Show Simple Toast',
          Colors.grey,
          () => ToastUtil.showSimple('간단한 토스트 메시지'),
        ),
      ],
    );
  }

  Widget _buildUtilityButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Utility Functions',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildToastButton(
          'Remove All Toasts',
          Colors.grey[600]!,
          () => ToastUtil.removeAll(),
        ),
        const SizedBox(height: 12),
        _buildToastButton(
          'Show Multiple Toasts',
          Colors.purple,
          () => _showMultipleToasts(),
        ),
      ],
    );
  }

  Widget _buildToastButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void _showMultipleToasts() {
    ToastUtil.showInfo(context, '첫 번째 정보 메시지');

    Future.delayed(const Duration(milliseconds: 500), () {
      ToastUtil.showWarning(context, '두 번째 경고 메시지');
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      ToastUtil.showError(context, '세 번째 오류 메시지');
    });
  }
}
