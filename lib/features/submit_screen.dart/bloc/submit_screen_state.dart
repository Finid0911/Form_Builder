import 'package:flutter/material.dart';
import 'package:form_builder_example/core/objects/drop_down_item.dart';
import 'package:form_builder_example/utilities/constants.dart';

class SubmitScreenState {
  String formTitle;
  String formDescription;
  List<QuestionBuilderState> questionListState;

  SubmitScreenState({
    this.formTitle = "",
    this.formDescription = "",
    List<QuestionBuilderState>? questionListState,
  }) : questionListState = questionListState ?? [QuestionBuilderState()];
}

class QuestionBuilderState {
  List<DropDownItem> dropDownList;
  String selectedInputType;
  List<String> multipleChoices;
  String selectedMultipleChoice;
  String questiontitle;
  String paragraphAnswer;

  static final List<DropDownItem> _defaultDropDownList = [
    DropDownItem(itemIcon: Icons.article_outlined, itemTitle: "Paragraph"),
    DropDownItem(
        itemIcon: Icons.radio_button_checked, itemTitle: "Multiple choice"),
  ];

  QuestionBuilderState({
    List<DropDownItem>? dropDownList,
    List<String>? multipleChoices,
    this.selectedMultipleChoice = "",
    this.selectedInputType = paragraph,
    this.questiontitle = "",
    this.paragraphAnswer = "",
  })  : dropDownList = dropDownList ?? _defaultDropDownList,
        multipleChoices = multipleChoices ?? ["option1", "option2"];
}
