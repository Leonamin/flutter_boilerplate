import 'package:flutter/material.dart';
import 'app_badge.dart';
import 'badge_color.dart';
import 'badge_variant.dart';

/// 뱃지 컴포넌트 사용 예제
class BadgeUsageExamples extends StatelessWidget {
  const BadgeUsageExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Examples')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Basic Text Badges', _buildBasicBadges()),
              const SizedBox(height: 32),
              _buildSection('Icon + Text Badges', _buildIconBadges()),
              const SizedBox(height: 32),
              _buildSection('Size Variations', _buildSizeBadges()),
              const SizedBox(height: 32),
              _buildSection('Color Variations', _buildColorBadges()),
              const SizedBox(height: 32),
              _buildSection('Outlined Badges', _buildOutlinedBadges()),
              const SizedBox(height: 32),
              _buildSection('Real-world Examples', _buildRealWorldExamples()),
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

  Widget _buildBasicBadges() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppBadge(text: 'New'),
        AppBadge(text: 'Hot', color: BadgeColor.error),
        AppBadge(text: 'Sale', color: BadgeColor.warning),
        AppBadge(text: 'Featured', color: BadgeColor.success),
      ],
    );
  }

  Widget _buildIconBadges() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppBadge(
          text: 'Premium',
          icon: Icons.star,
          color: BadgeColor.brand,
        ),
        AppBadge(
          text: 'Verified',
          icon: Icons.verified,
          color: BadgeColor.success,
        ),
        AppBadge(
          text: 'Alert',
          icon: Icons.warning,
          color: BadgeColor.warning,
        ),
        AppBadge(
          text: 'Info',
          icon: Icons.info,
          color: BadgeColor.info,
        ),
      ],
    );
  }

  Widget _buildSizeBadges() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBadge(text: 'Tiny', size: BadgeSize.tiny),
        SizedBox(height: 8),
        AppBadge(text: 'Small', size: BadgeSize.small),
        SizedBox(height: 8),
        AppBadge(text: 'Medium', size: BadgeSize.medium),
        SizedBox(height: 8),
        AppBadge(text: 'Large', size: BadgeSize.large),
        SizedBox(height: 8),
        AppBadge(text: 'Extra Large', size: BadgeSize.extraLarge),
      ],
    );
  }

  Widget _buildColorBadges() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppBadge(text: 'Brand', color: BadgeColor.brand),
        AppBadge(text: 'Secondary', color: BadgeColor.secondary),
        AppBadge(text: 'Tertiary', color: BadgeColor.tertiary),
        AppBadge(text: 'Error', color: BadgeColor.error),
        AppBadge(text: 'Warning', color: BadgeColor.warning),
        AppBadge(text: 'Info', color: BadgeColor.info),
        AppBadge(text: 'Success', color: BadgeColor.success),
      ],
    );
  }

  Widget _buildOutlinedBadges() {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AppBadge(
          text: 'Brand',
          color: BadgeColor.brand,
          variant: BadgeVariant.outlined,
        ),
        AppBadge(
          text: 'Secondary',
          color: BadgeColor.secondary,
          variant: BadgeVariant.outlined,
        ),
        AppBadge(
          text: 'Success',
          color: BadgeColor.success,
          variant: BadgeVariant.outlined,
        ),
        AppBadge(
          text: 'Error',
          color: BadgeColor.error,
          variant: BadgeVariant.outlined,
        ),
      ],
    );
  }

  Widget _buildRealWorldExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Product Status:'),
        const SizedBox(height: 8),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            AppBadge(
              text: 'Best Seller',
              icon: Icons.trending_up,
              color: BadgeColor.success,
            ),
            AppBadge(
              text: 'Limited',
              icon: Icons.access_time,
              color: BadgeColor.warning,
            ),
            AppBadge(
              text: 'Sold Out',
              color: BadgeColor.error,
              variant: BadgeVariant.outlined,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('User Status:'),
        const SizedBox(height: 8),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            AppBadge(
              text: 'VIP',
              icon: Icons.diamond,
              color: BadgeColor.brand,
              size: BadgeSize.small,
            ),
            AppBadge(
              text: 'Online',
              color: BadgeColor.success,
              size: BadgeSize.tiny,
            ),
            AppBadge(
              text: 'New Member',
              color: BadgeColor.info,
              variant: BadgeVariant.outlined,
              size: BadgeSize.small,
            ),
          ],
        ),
      ],
    );
  }
}
