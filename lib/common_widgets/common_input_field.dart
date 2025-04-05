import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_drop_down.dart';
import 'package:form_builder_example/common_widgets/common_icon.dart';
import 'package:form_builder_example/common_widgets/common_multiple_choice.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/common_widgets/common_text_field.dart';
import 'package:form_builder_example/common_widgets/custom_line.dart';
import 'package:form_builder_example/constants/app_padding.dart';
import 'package:form_builder_example/core/objects/drop_down_item.dart';

class CommonInputField extends StatelessWidget {
  final String inputType;
  final List<DropDownItem> dropDownList;
  final List<String> multipleChoices;
  final String questionTitle;
  final Function(String) onInputTypeChanged;
  final String selectedMultipleChoice;
  final Function(String) onSelectMultipleChoice;
  final Function(String) onQuestionTitleChange;
  final Function(String) onParagraphAnswerChange;
  final Function() onDeleteQuestion;
  final bool isEditMode;
  final Function() onAddOption;
  final Function() onAddOther;
  final Function(int, String) onChangeOptionValue;

  const CommonInputField({
    super.key,
    required this.inputType,
    required this.dropDownList,
    required this.questionTitle,
    required this.multipleChoices,
    required this.onInputTypeChanged,
    required this.selectedMultipleChoice,
    required this.onSelectMultipleChoice,
    required this.onQuestionTitleChange,
    required this.onParagraphAnswerChange,
    required this.onDeleteQuestion,
    required this.isEditMode,
    required this.onAddOption,
    required this.onAddOther,
    required this.onChangeOptionValue,
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
          padding: const EdgeInsets.all(AppPadding.paddingExtraMedium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _QuestionInputField(
                isEditMode: isEditMode,
                questionTitle: questionTitle,
                onQuestionTitleChange: onQuestionTitleChange,
              ),
              if (isEditMode)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.paddingCustomSmall,
                  ),
                  child: CommonDropDown(
                    itemList: dropDownList,
                    selectedValue: inputType,
                    onChanged: onInputTypeChanged,
                  ),
                ),
              _QuestionInputTypeField(
                inputType: inputType,
                isEditMode: isEditMode,
                selectedMultipleChoice: selectedMultipleChoice,
                multipleChoices: multipleChoices,
                onParagraphAnswerChange: onParagraphAnswerChange,
                onSelectMultipleChoice: onSelectMultipleChoice,
                onAddOption: onAddOption,
                onAddOther: onAddOther,
                onChangeOptionValue: onChangeOptionValue,
              ),
              if (isEditMode) ...[
                const Padding(
                  padding: EdgeInsets.only(top: 46.0),
                  child: CustomLine(
                    opacity: 0.3,
                  ),
                ),
                IconButton(
                    onPressed: onDeleteQuestion,
                    icon: const CommonIcon(iconData: Icons.delete_rounded))
              ]
            ],
          ),
        ));
  }
}

class _QuestionInputField extends StatelessWidget {
  final bool isEditMode;
  final String questionTitle;
  final Function(String) onQuestionTitleChange;

  const _QuestionInputField({
    required this.isEditMode,
    required this.questionTitle,
    required this.onQuestionTitleChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.paddingMedium,
      ),
      child: isEditMode
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 9,
                  child: CommonTextField(
                    textLabel: "Question",
                    backgroundColor: const Color.fromARGB(255, 239, 241, 239),
                    onValueChange: onQuestionTitleChange,
                    isEditMode: isEditMode,
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: CommonIcon(
                    iconData: Icons.image_outlined,
                    iconSize: 28.0,
                    iconColor: Colors.grey,
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.paddingMedium),
              child: Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: CommonText(
                    textTitle: questionTitle,
                  ),
                ),
              ),
            ),
    );
  }
}

class _QuestionInputTypeField extends StatelessWidget {
  final String inputType;
  final bool isEditMode;
  final String selectedMultipleChoice;
  final List<String> multipleChoices;
  final Function(String) onSelectMultipleChoice;
  final Function(String) onParagraphAnswerChange;
  final Function() onAddOption;
  final Function() onAddOther;
  final Function(int, String) onChangeOptionValue;

  const _QuestionInputTypeField({
    required this.inputType,
    required this.isEditMode,
    required this.selectedMultipleChoice,
    required this.multipleChoices,
    required this.onParagraphAnswerChange,
    required this.onSelectMultipleChoice,
    required this.onAddOption,
    required this.onAddOther,
    required this.onChangeOptionValue,
  });

  @override
  Widget build(BuildContext context) {
    return switch (inputType) {
      "Paragraph" => CommonTextField(
          textLabel: "Long answer text",
          onValueChange: onParagraphAnswerChange,
          isEditMode: isEditMode,
        ),
      "Multiple choice" => Flexible(
          child: CommonMultipleChoice(
            options: multipleChoices,
            selectedOption: selectedMultipleChoice,
            onSelectionChanged: onSelectMultipleChoice,
            isEditMode: isEditMode,
            onAddOption: onAddOption,
            onAddOther: onAddOther,
            onChangeOptionValue: onChangeOptionValue,
          ),
        ),
      String() => throw UnimplementedError(),
    };
  }
}
