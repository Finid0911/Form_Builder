import 'package:flutter/material.dart';
import 'package:form_builder_example/constants/app_text_size.dart';

class CommonText extends StatelessWidget {
  final String? textTitle;
  final double? textSize;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Function()? onTap;
  final double? padding;

  const CommonText({
    super.key,
    this.textTitle,
    this.textSize,
    this.textColor,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall?.copyWith(
      color: textColor ?? Colors.black,
      fontSize: textSize ?? AppTextSize.textSizeMedium,
      fontFamily: fontFamily,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: FontStyle.normal,
    );

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 0.0),
        child: Text(
          textTitle ?? "",
          style: textStyle,
          textAlign: textAlign ?? TextAlign.start,
        ),
      ),
    );
  }
}
