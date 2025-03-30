import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/custom_line.dart';

class CommonTextField extends StatelessWidget {
  final String? textTitle;
  final String? textLabel;
  final double? textSize;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final void Function(String newValue)? onValueChange;

  const CommonTextField(
      {super.key,
      this.textTitle,
      this.textLabel,
      this.textSize,
      this.textColor,
      this.fontFamily,
      this.fontWeight,
      this.backgroundColor,
      this.onValueChange});

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

    return Container(
        width: double.infinity,
        color: backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                  textInputAction: TextInputAction.unspecified,
                  decoration: InputDecoration(
                    hintText: textLabel,
                    border: InputBorder.none,
                  ),
                  onChanged: onValueChange,
                  style: textStyle),
            ),
            const CustomLine(
              color: Colors.black,
            ),
          ],
        ));
  }
}
