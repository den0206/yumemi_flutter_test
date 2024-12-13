import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yumemi_flutter_test/src/_generated/gen/assets.gen.dart';

// 共通ローディングコンポーネント  
final class CommonLoadingWidget extends StatelessWidget {
  const CommonLoadingWidget({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Assets.lottie.loading, width: size, height: size),
    );
  }
}
