import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String? textTitle;
  final double? textSize;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CommonText(
      {super.key,
      this.textTitle,
      this.textSize,
      this.textColor,
      this.fontFamily,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall?.copyWith(
      color: textColor ?? Colors.black,
      fontSize: textSize ?? 16.0,
      fontFamily: fontFamily,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: FontStyle.normal,
    );

    return Text(
      textTitle ?? "",
      style: textStyle,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
