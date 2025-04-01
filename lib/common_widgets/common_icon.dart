import 'package:flutter/material.dart';

class CommonIcon extends StatelessWidget {
  final IconData iconData;
  final double? iconSize;
  final Color? iconColor;

  const CommonIcon({
    super.key,
    required this.iconData,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: iconSize ?? 24.0,
      color: iconColor ?? Colors.black,
    );
  }
}
