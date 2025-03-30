import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_drop_down.dart';
import 'package:form_builder_example/common_widgets/common_multiple_choice.dart';
import 'package:form_builder_example/common_widgets/common_text_field.dart';
import 'package:form_builder_example/common_widgets/custom_line.dart';
import 'package:form_builder_example/core/objects/drop_down_item.dart';

class CommonInputField extends StatelessWidget {
  final String inputType;
  final List<DropDownItem> dropDownList;
  final List<String> multipleChoices;
  final Function(String) onInputTypeChanged;
  final String selectedMultipleChoice;
  final Function(String) onSelectMultipleChoice;
  final Function(String) onQuestionTitleChange;
  final Function(String) onParagraphAnswerChange;
  final Function() onDeleteQuestion;

  const CommonInputField({
    super.key,
    required this.inputType,
    required this.dropDownList,
    required this.multipleChoices,
    required this.onInputTypeChanged,
    required this.selectedMultipleChoice,
    required this.onSelectMultipleChoice,
    required this.onQuestionTitleChange,
    required this.onParagraphAnswerChange,
    required this.onDeleteQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CommonTextField(
                  textLabel: "Question",
                  backgroundColor: const Color.fromARGB(255, 239, 241, 239),
                  onValueChange: onQuestionTitleChange,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                      flex: 2,
                      child: Icon(Icons.image_outlined,
                          size: 30, color: Colors.grey)),
                  Flexible(
                    flex: 8,
                    child: CommonDropDown(
                      itemList: dropDownList,
                      selectedValue: inputType,
                      onChanged: (newValue) => onInputTypeChanged(newValue),
                    ),
                  ),
                ],
              ),
              switch (inputType) {
                "Paragraph" => CommonTextField(
                    textLabel: "Long answer text",
                    onValueChange: onParagraphAnswerChange,
                  ),
                "Multiple choice" => Flexible(
                    child: CommonMultipleChoice(
                      options: multipleChoices,
                      selectedOption: selectedMultipleChoice,
                      onSelectionChanged: onSelectMultipleChoice,
                    ),
                  ),
                String() => throw UnimplementedError(),
              },
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: CustomLine(
                  opacity: 0.3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      onPressed: onDeleteQuestion,
                      icon: const Icon(Icons.delete_rounded))
                ],
              )
            ],
          ),
        ));
  }
}
