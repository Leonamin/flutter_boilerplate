import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/core/extensions/index.dart';
import 'package:flutter_boilerplate/core/localization/index.dart';
import 'package:flutter_boilerplate/shared/components/atoms/indicators/animated_page_indicator.dart';

/// 전체화면 이미지 뷰어
/// Hero 애니메이션을 지원하며 여러 이미지를 스와이프로 탐색할 수 있습니다.
class FullscreenImageViewer extends StatefulWidget {
  /// 표시할 이미지 URL 목록
  final List<String> images;

  /// 초기 표시할 이미지 인덱스
  final int initialIndex;

  /// Hero 애니메이션용 태그 접두사
  final String heroTagPrefix;

  /// 이미지 변경 콜백
  final ValueChanged<int>? onImageChanged;

  const FullscreenImageViewer({
    super.key,
    required this.images,
    this.initialIndex = 0,
    this.heroTagPrefix = 'image',
    this.onImageChanged,
  });

  @override
  State<FullscreenImageViewer> createState() => _FullscreenImageViewerState();
}

class _FullscreenImageViewerState extends State<FullscreenImageViewer>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late int _currentIndex;
  late AnimationController _overlayController;
  late Animation<double> _overlayAnimation;
  bool _isOverlayVisible = true;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);

    _overlayController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _overlayAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _overlayController, curve: Curves.easeInOut),
    );

    _overlayController.forward();

    // 상태바를 투명하게 설정
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _overlayController.dispose();

    // 상태바 원래대로 복원
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.dispose();
  }

  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });

    if (_isOverlayVisible) {
      _overlayController.forward();
    } else {
      _overlayController.reverse();
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onImageChanged?.call(index);
  }

  void _closeViewer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.textPrimary,
      body: Stack(
        children: [
          // 이미지 페이지뷰
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: _toggleOverlay,
                child: Center(
                  child: Hero(
                    tag: '${widget.heroTagPrefix}_$index',
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 3.0,
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                              color: context.colors.textInverse,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: context.colors.backgroundSecondary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.broken_image,
                                  color: context.colors.textSecondary,
                                  size: 48,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  S.of(context).imageGalleryLoadFailed,
                                  style: context.textStyles.body.secondary(
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // 상단 오버레이 (닫기 버튼, 카운터)
          AnimatedBuilder(
            animation: _overlayAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _overlayAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.colors.textSecondary.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 닫기 버튼
                          GestureDetector(
                            onTap: _closeViewer,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: context.colors.textPrimary.withValues(
                                  alpha: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.close,
                                color: context.colors.textInverse,
                                size: 24,
                              ),
                            ),
                          ),

                          // 이미지 카운터
                          if (widget.images.length > 1)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.textPrimary.withValues(
                                  alpha: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                '${_currentIndex + 1} / ${widget.images.length}',
                                style: context.textStyles.body.medium.inverse(
                                  context,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // 하단 오버레이 (페이지 인디케이터)
          if (widget.images.length > 1)
            AnimatedBuilder(
              animation: _overlayAnimation,
              builder: (context, child) {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: _overlayAnimation.value,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            context.colors.textSecondary.withValues(alpha: 0.3),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 1.0],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: AnimatedPageIndicator(
                            totalPages: widget.images.length,
                            currentIndex: _currentIndex,
                            maxVisibleDots: 13,
                            dotSize: 8.0,
                            spacing: 8.0,
                            activeColor: context.colors.textInverse,
                            inactiveColor: context.colors.textInverse
                                .withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
