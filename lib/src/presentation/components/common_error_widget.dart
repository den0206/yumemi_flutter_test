import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yumemi_flutter_test/src/_generated/gen/assets.gen.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';

// 共通エラーコンポーネント
final class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 画面の横幅の30%を指定
          LottieBuilder.asset(
            Assets.lottie.error,
            width: context.widthPct(.3),
            height: context.widthPct(.3),
          ),

          Text(
            // 多言語: エラーが発生しました
            L10n.of(context).error_occurred,
            style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
          ),

          // 多言語: 再読み込みをお試しください
          Text(L10n.of(context).loading_error, style: context.bodySmall),
        ],
      ),
    );
  }
}
