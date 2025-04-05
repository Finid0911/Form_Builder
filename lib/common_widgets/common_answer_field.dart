import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/constants/app_padding.dart';

class CommonAnswerField extends StatelessWidget {
  final String question;
  final String answer;

  const CommonAnswerField({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.paddingMedium,
        horizontal: AppPadding.paddingMedium,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.paddingExtraMedium),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.paddingExtraMedium,
                  vertical: AppPadding.paddingExtraMedium,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CommonText(
                    textTitle: question,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.paddingExtraMedium,
                  vertical: AppPadding.paddingExtraMedium,
                ),
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 245, 245, 245),
                  child: CommonText(
                    textTitle: answer,
                    padding: AppPadding.paddingExtraMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
