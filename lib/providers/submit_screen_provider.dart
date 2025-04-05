import 'package:flutter/material.dart';
import 'package:form_builder_example/features/state/questions_state.dart';

class QuestionsProvider with ChangeNotifier {
  QuestionsState questionsState = QuestionsState();

  void updateSelectedInputType(int index, String newType) {
    questionsState.questionListState[index].selectedInputType = newType;
    notifyListeners();
  }

  void updateSelectedMultipleChoice(int index, String newValue) {
    questionsState.questionListState[index].selectedMultipleChoice = newValue;
    notifyListeners();
  }

  void onQuestionTitleChange(int index, String newValue) {
    questionsState.questionListState[index].questiontitle = newValue;
    notifyListeners();
  }

  void onParagraphAnswerChange(int index, String newValue) {
    questionsState.questionListState[index].paragraphAnswer = newValue;
    notifyListeners();
  }

  void addQuestion() {
    questionsState.questionListState.add(QuestionItemState());
    QuestionItemState.setQuestionsToSubmitModeExceptLastItem(
      questionsState.questionListState,
    );
    notifyListeners();
  }

  void removeQuestion(int questionId) {
    if (questionsState.questionListState.length > 1) {
      questionsState.questionListState
          .removeWhere((questionItem) => questionItem.questionId == questionId);
    } else {
      print("Cannot delete the last question!");
    }
    notifyListeners();
  }

  void addOption(int index) {
    var choices = questionsState.questionListState[index].multipleChoices;
    const option2 = "Option 2";

    if (choices.isNotEmpty) {
      choices.insert(choices.length - 1, option2);
    } else {
      choices.add(option2);
    }
    notifyListeners();
  }

  void addOther(int index) {
    var choices = questionsState.questionListState[index].multipleChoices;
    const other = "Other";

    if (choices.isNotEmpty) {
      choices.insert(choices.length - 1, other);
    } else {
      choices.add(other);
    }
    questionsState.questionListState[index].multipleChoices.removeLast();
    notifyListeners();
  }

  void onChangeOptionValue(
      int questionIndex, int optionIndex, String newValue) {
    questionsState.questionListState[questionIndex]
        .multipleChoices[optionIndex] = newValue;
    notifyListeners();
  }

  void submitAction() {
    QuestionItemState.setQuestionsToSubmitMode(
        questionsState.questionListState);
    questionsState.isEditModeOnTitleSection = false;
    notifyListeners();
  }

  void onChangeQuestionToEditMode(QuestionItemState questionItemState) {
    QuestionItemState.setQuestionsToSubmitMode(
        questionsState.questionListState);
    questionItemState.isEditMode = true;
    notifyListeners();
  }
}
