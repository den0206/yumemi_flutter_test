import 'package:flutter/material.dart';

final class CircleImageAvatar extends StatelessWidget {
  const CircleImageAvatar({required this.url, super.key, this.size = 50});

  final String url;

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        url,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
