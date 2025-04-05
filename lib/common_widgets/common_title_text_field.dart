import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/common_widgets/custom_line.dart';
import 'package:form_builder_example/constants/app_padding.dart';
import 'package:form_builder_example/constants/app_text_size.dart';

class CommonTitleTextField extends StatefulWidget {
  final String? textLabel;
  final double? textSize;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final void Function(String newValue)? onValueChange;
  final bool isEditMode;

  const CommonTitleTextField({
    super.key,
    this.textLabel,
    this.textSize,
    this.textColor,
    this.fontFamily,
    this.fontWeight,
    this.backgroundColor,
    this.onValueChange,
    required this.isEditMode,
  });

  @override
  _CommonTitleTextFieldState createState() => _CommonTitleTextFieldState();
}

class _CommonTitleTextFieldState extends State<CommonTitleTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall?.copyWith(
      color: widget.textColor ?? Colors.black,
      fontSize: widget.textSize ?? AppTextSize.textSizeMedium,
      fontFamily: widget.fontFamily,
      fontWeight: widget.fontWeight ?? FontWeight.normal,
      fontStyle: FontStyle.normal,
    );

    return Container(
      width: double.infinity,
      color: widget.backgroundColor,
      child: widget.isEditMode
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.paddingMedium),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: widget.textLabel,
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      widget.onValueChange?.call(value);
                    },
                    style: textStyle,
                  ),
                ),
                const CustomLine(
                  color: Colors.black,
                ),
              ],
            )
          : CommonText(
              textTitle: _controller.text.trim() == ""
                  ? widget.textLabel
                  : _controller.text,
              textSize: widget.textSize,
            ),
    );
  }
}
