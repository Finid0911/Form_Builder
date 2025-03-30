import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  final double height;
  final Color color;
  final double width;
  final double? opacity;

  const CustomLine({
    super.key,
    this.height = 1.0,
    this.color = Colors.grey,
    this.width = double.infinity,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1,
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}