import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extensions/build_context_extension.dart';

enum ImagePlaceholderSize {
  small(24.0),
  medium(40.0),
  large(56.0),
  xlarge(80.0),
  xxlarge(120.0);

  const ImagePlaceholderSize(this.value);
  final double value;
}

class ImagePlaceholder extends StatelessWidget {
  final double width;
  final double height;

  final Color? backgroundColor;

  final Color? borderColor;

  final double borderWidth;

  final double borderRadius;

  final bool showBorder;

  final String? thumbnailUrl;

  final VoidCallback? onTap;

  const ImagePlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.showBorder = false,
    this.onTap,
    this.borderRadius = 8.0,
    this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: backgroundColor ?? context.colors.backgroundTertiary,
          border: showBorder
              ? Border.all(
                  color: borderColor ?? context.colors.borderSecondary,
                  width: borderWidth,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: thumbnailUrl != null
              ? Image.network(
                  thumbnailUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: context.colors.backgroundTertiary,
                      child: Icon(
                        Icons.image_not_supported,
                        color: context.colors.textSecondary,
                      ),
                    );
                  },
                )
              : Container(
                  color: context.colors.backgroundTertiary,
                  child: Icon(Icons.image, color: context.colors.textSecondary),
                ),
        ),
      ),
    );
  }
}
