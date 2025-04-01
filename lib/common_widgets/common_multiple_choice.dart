import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';

class CommonMultipleChoice extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelectionChanged;
  final bool? isEditMode;

  const CommonMultipleChoice({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelectionChanged,
    this.isEditMode,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: options.map((option) {
        return RadioListTile<String>(
          title: CommonText(textTitle: option,),
          value: option,
          groupValue: selectedOption,
          onChanged: isEditMode == false
              ? (String? value) {
                  if (value != null) {
                    onSelectionChanged(value);
                  }
                }
              : null,
        );
      }).toList(),
    );
  }
}
