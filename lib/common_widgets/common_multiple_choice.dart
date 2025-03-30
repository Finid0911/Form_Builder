import 'package:flutter/material.dart';

class CommonMultipleChoice extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelectionChanged;

  const CommonMultipleChoice({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: options.map((option) {
        return RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: selectedOption,
          onChanged: (String? value) {
            if (value != null) {
              onSelectionChanged(value);
            }
          },
        );
      }).toList(),
    );
  }
}
