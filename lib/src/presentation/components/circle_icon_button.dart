import 'package:flutter/material.dart';

// 共通コンポーネント
// 円形のボタン
final class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.bacgroundColor,
  });

  final Widget icon;
  final Color? bacgroundColor;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: bacgroundColor,
      ),
      onPressed: onPressed,
      child: icon,
    );
  }
}
