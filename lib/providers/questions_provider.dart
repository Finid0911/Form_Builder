import 'package:flutter/material.dart';
import 'package:form_builder_example/features/state/questions_state.dart';

class QuestionsProvider with ChangeNotifier {
  QuestionsState questionsState = QuestionsState();

  void onSelectInputType(int index, String newType) {
    final updatedQuestion = questionsState.questionListState[index]
        .copyWith(selectedInputType: newType);

    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void onSelectMultipleChoice(int index, String newValue) {
    final updatedQuestion = questionsState.questionListState[index]
        .copyWith(selectedMultipleChoice: newValue);

    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void onQuestionTitleChange(int index, String newValue) {
    final updatedQuestion = questionsState.questionListState[index]
        .copyWith(questionTitle: newValue);

    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void onParagraphAnswerChange(int index, String newValue) {
    final updatedQuestion = questionsState.questionListState[index]
        .copyWith(paragraphAnswer: newValue);

    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void addQuestion() {
    final updatedQuestionList = [
      ...questionsState.questionListState,
      const QuestionItemState()
    ];
    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);

    _setQuestionsToSubmitMode(excludeLast: true);
    notifyListeners();
  }

  void removeQuestion(int index) {
    final currentList = [...questionsState.questionListState];

    if (currentList.length > 1) {
      currentList.removeAt(index);

      questionsState = questionsState.copyWith(questionListState: currentList);
      notifyListeners();
    } else {
      debugPrint("Cannot delete the last question!");
    }
  }

  void addOption(int index) {
    final question = questionsState.questionListState[index];
    final currentChoices = [...question.multipleChoices];
    const option2 = "Option 2";

    if (currentChoices.isNotEmpty) {
      currentChoices.insert(currentChoices.length - 1, option2);
    } else {
      currentChoices.add(option2);
    }

    final updatedQuestion = question.copyWith(multipleChoices: currentChoices);
    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void addOptionOther(int index) {
    final question = questionsState.questionListState[index];
    final currentChoices = [...question.multipleChoices];
    const other = "Other";

    if (currentChoices.isNotEmpty) {
      currentChoices.insert(currentChoices.length - 1, other);
    } else {
      currentChoices.add(other);
    }
    currentChoices.removeLast();

    final updatedQuestion = question.copyWith(multipleChoices: currentChoices);
    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void onChangeOptionValue(
    int questionIndex,
    int optionIndex,
    String newValue,
  ) {
    final question = questionsState.questionListState[questionIndex];
    final updatedChoices = [...question.multipleChoices];
    updatedChoices[optionIndex] = newValue;

    final updatedQuestion = question.copyWith(multipleChoices: updatedChoices);

    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[questionIndex] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
    notifyListeners();
  }

  void onSubmitAnswer() {
    _setQuestionsToSubmitMode();
    questionsState.isEditModeOnTitleSection = false;
    notifyListeners();
  }

  void onChangeQuestionToEditMode(int index) {
    _setQuestionsToSubmitMode();

    final updatedQuestion =
        questionsState.questionListState[index].copyWith(isEditMode: true);

    final updatedQuestionList = [...questionsState.questionListState];
    updatedQuestionList[index] = updatedQuestion;

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);

    notifyListeners();
  }

  void _setQuestionsToSubmitMode({bool excludeLast = false}) {
    final updatedQuestionList = questionsState.questionListState
        .map((q) => q.copyWith(isEditMode: false))
        .toList();

    if (excludeLast && updatedQuestionList.isNotEmpty) {
      updatedQuestionList.last =
          updatedQuestionList.last.copyWith(isEditMode: true);
    }

    questionsState =
        questionsState.copyWith(questionListState: updatedQuestionList);
  }
}
