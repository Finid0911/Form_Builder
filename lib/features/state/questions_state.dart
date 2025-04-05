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
}

class QuestionItemState {
  int questionId;
  List<DropDownItem> dropDownList;
  String selectedInputType;
  List<String> multipleChoices;
  String selectedMultipleChoice;
  String questiontitle;
  String paragraphAnswer;
  bool isEditMode;

  static int _nextId = 1;

  static final List<DropDownItem> _defaultDropDownList = [
    DropDownItem(itemIcon: Icons.article_outlined, itemTitle: "Paragraph"),
    DropDownItem(
        itemIcon: Icons.radio_button_checked, itemTitle: "Multiple choice"),
  ];

  QuestionItemState({
    List<DropDownItem>? dropDownList,
    List<String>? multipleChoices,
    this.selectedMultipleChoice = "",
    this.selectedInputType = paragraph,
    this.questiontitle = "",
    this.paragraphAnswer = "",
    this.isEditMode = true,
  })  : dropDownList = dropDownList ?? _defaultDropDownList,
        multipleChoices = multipleChoices ?? ["Option 1", moreOptions],
        questionId = _nextId++;

  static void setQuestionsToSubmitMode(List<QuestionItemState> questionList) {
    for (var question in questionList) {
      question.isEditMode = false;
    }
  }

  static void setQuestionsToSubmitModeExceptLastItem(
      List<QuestionItemState> questionList) {
    for (var question in questionList) {
      question.isEditMode = false;
    }
    questionList.last.isEditMode = true;
  }
}
