import 'package:flutter/material.dart';
import 'package:form_builder_example/core/objects/drop_down_item.dart';
import 'package:form_builder_example/utilities/constants.dart';

class QuestionsState {
  String formTitle;
  String formDescription;
  bool isEditModeOnTitleSection;
  List<QuestionItemState> questionListState;

  QuestionsState({
    this.formTitle = "",
    this.formDescription = "",
    this.isEditModeOnTitleSection = true,
    List<QuestionItemState>? questionListState,
  }) : questionListState = questionListState ?? [QuestionItemState()];

  QuestionsState copyWith({
    String? formTitle,
    String? formDescription,
    bool? isEditModeOnTitleSection,
    List<QuestionItemState>? questionListState,
  }) {
    return QuestionsState(
      formTitle: formTitle ?? this.formTitle,
      formDescription: formDescription ?? this.formDescription,
      isEditModeOnTitleSection:
          isEditModeOnTitleSection ?? this.isEditModeOnTitleSection,
      questionListState: questionListState ?? this.questionListState,
    );
  }
}

class QuestionItemState {
  final List<DropDownItem> dropDownList;
  final String selectedInputType;
  final List<String> multipleChoices;
  final String selectedMultipleChoice;
  final String questionTitle;
  final String paragraphAnswer;
  final bool isEditMode;

  static const List<DropDownItem> defaultDropDownList = [
    DropDownItem(itemIcon: Icons.article_outlined, itemTitle: "Paragraph"),
    DropDownItem(
        itemIcon: Icons.radio_button_checked, itemTitle: "Multiple choice"),
  ];

  static const List<String> defaultMultipleChoices = ["Option 1", moreOptions];

  const QuestionItemState({
    this.dropDownList = defaultDropDownList,
    this.selectedInputType = paragraph,
    this.multipleChoices = defaultMultipleChoices,
    this.selectedMultipleChoice = "",
    this.questionTitle = "",
    this.paragraphAnswer = "",
    this.isEditMode = true,
  });

  QuestionItemState copyWith({
    List<DropDownItem>? dropDownList,
    String? selectedInputType,
    List<String>? multipleChoices,
    String? selectedMultipleChoice,
    String? questionTitle,
    String? paragraphAnswer,
    bool? isEditMode,
  }) {
    return QuestionItemState(
      dropDownList: dropDownList ?? this.dropDownList,
      selectedInputType: selectedInputType ?? this.selectedInputType,
      multipleChoices: multipleChoices ?? this.multipleChoices,
      selectedMultipleChoice:
          selectedMultipleChoice ?? this.selectedMultipleChoice,
      questionTitle: questionTitle ?? this.questionTitle,
      paragraphAnswer: paragraphAnswer ?? this.paragraphAnswer,
      isEditMode: isEditMode ?? this.isEditMode,
    );
  }
}
