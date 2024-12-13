import 'package:flutter/material.dart';

// 共通コンポーネント
// 円形画像(ネットワーク経由)
final class CircleImageAvatar extends StatelessWidget {
  const CircleImageAvatar({required this.url, super.key, this.size = 50});

  final String url;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
