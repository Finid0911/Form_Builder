import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/constants/app_padding.dart';

class CommonResponseField extends StatelessWidget {
  const CommonResponseField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.paddingExtraMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(),
            CommonText(),
          ],
        ),
      ),
    );
  }
}
