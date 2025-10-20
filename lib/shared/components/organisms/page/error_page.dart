import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/components/organisms/layout/safe_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/core/extensions/index.dart';
import 'package:flutter_boilerplate/core/localization/index.dart';
import 'package:flutter_boilerplate/shared/components/index.dart';

class ErrorPage extends StatelessWidget {
  final GoRouterState state;

  const ErrorPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SafeScaffold(
      backgroundColor: context.backgroundPrimary,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 에러 일러스트레이션
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: context.backgroundErrorSubtle,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sentiment_dissatisfied_rounded,
                  size: 100,
                  color: context.iconError,
                ),
              ),

              const SizedBox(height: 32),

              // 에러 코드
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: context.backgroundSecondary,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: context.borderSecondary, width: 1),
                ),
                child: Text(
                  '404',
                  style: context.textStyles.display.bold.error(context),
                ),
              ),

              const SizedBox(height: 24),

              // 에러 메시지
              Text(
                S.of(context).commonErrorPageNotFound,
                style: context.textStyles.header1.bold.primary(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                S.of(context).commonErrorPageDescription,
                style: context.textStyles.bodyLg.secondary(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // 요청 경로 표시
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.backgroundSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.borderSecondary, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.link_off_rounded,
                      size: 16,
                      color: context.iconTertiary,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        state.uri.path,
                        style: context.textStyles.caption.tertiary(context),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 액션 버튼들
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AppButton.primary(
                      S.of(context).commonButtonGoHome,
                      onTap: _handleGoHome,
                      size: ButtonSize.large,
                      leadingIcon: Icons.home_rounded,
                      fullWidth: true,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: AppButton.secondary(
                      S.of(context).commonButtonGoBack,
                      onTap: _handleGoBack,
                      size: ButtonSize.large,
                      leadingIcon: Icons.arrow_back_rounded,
                      fullWidth: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 도움말 텍스트
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                    size: 16,
                    color: context.iconTertiary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    S.of(context).commonErrorPageHelp,
                    style: context.textStyles.caption.tertiary(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleGoHome() {
    // context.go(AppRouteType.home.path);
  }

  void _handleGoBack() {
    // if (context.canPop()) {
    //   context.pop();
    // } else {
    //   context.go(AppRouteType.home.path);
    // }
  }
}
