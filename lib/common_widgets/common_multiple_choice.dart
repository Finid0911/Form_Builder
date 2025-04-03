import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/common_widgets/common_text_field.dart';
import 'package:form_builder_example/utilities/constants.dart';

class CommonMultipleChoice extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelectionChanged;
  final bool isEditMode;
  final Function() onAddOption;
  final Function() onAddOther;
  final Function(int, String) onChangeOptionValue;

  const CommonMultipleChoice({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelectionChanged,
    required this.isEditMode,
    required this.onAddOption,
    required this.onAddOther,
    required this.onChangeOptionValue,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: options.asMap().entries.map((entry) {
        int index = entry.key;
        String option = entry.value;

        if (option == moreOptions && !isEditMode) {
          return const SizedBox.shrink();
        }

        return RadioListTile<String>(
          title: option != moreOptions
              ? isEditMode
                  ? CommonTextField(
                      textLabel: option,
                      isEditMode: isEditMode,
                      onValueChange: (newValue) => onChangeOptionValue(
                        index,
                        newValue,
                      ),
                    )
                  : CommonText(
                      textTitle: option,
                    )
              : _MoreOptionsText(
                  onAddOption: onAddOption,
                  onAddOther: onAddOther,
                ),
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

class _MoreOptionsText extends StatelessWidget {
  final Function() onAddOption;
  final Function() onAddOther;

  const _MoreOptionsText({
    required this.onAddOption,
    required this.onAddOther,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonText(
          textTitle: addOptions,
          textColor: Colors.grey,
          onTap: onAddOption,
        ),
        const CommonText(
          textTitle: " or ",
        ),
        CommonText(
          textTitle: addOthers,
          textColor: Colors.blue,
          onTap: onAddOther,
        )
      ],
    );
  }
}
