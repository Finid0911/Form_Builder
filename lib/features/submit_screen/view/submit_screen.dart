import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_icon.dart';
import 'package:form_builder_example/common_widgets/common_input_field.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/common_widgets/common_title_text_field.dart';
import 'package:form_builder_example/constants/app_padding.dart';
import 'package:form_builder_example/constants/app_text_size.dart';
import 'package:form_builder_example/features/submit_screen/state/submit_screen_state.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  late SubmitScreenState formState;

  @override
  void initState() {
    super.initState();
    formState = SubmitScreenState();
  }

  void updateSelectedInputType(int index, String newType) {
    setState(() {
      formState.questionListState[index].selectedInputType = newType;
    });
  }

  void updateSelectedMultipleChoice(int index, String newValue) {
    setState(() {
      formState.questionListState[index].selectedMultipleChoice = newValue;
    });
  }

  void onQuestionTitleChange(int index, String newValue) {
    setState(() {
      formState.questionListState[index].questiontitle = newValue;
    });
  }

  void onParagraphAnswerChange(int index, String newValue) {
    setState(() {
      formState.questionListState[index].paragraphAnswer = newValue;
    });
  }

  void addQuestion() {
    setState(() {
      formState.questionListState.add(QuestionBuilderState());
    });
  }

  void removeQuestion(int questionId) {
    setState(() {
      if (formState.questionListState.length > 1) {
        formState.questionListState.removeWhere(
            (questionItem) => questionItem.questionId == questionId);
      } else {
        print("Cannot delete the last question!");
      }
    });
  }

  void submitAction() {
    setState(() {
      QuestionBuilderState.setToSubmitMode(formState.questionListState);
      formState.isEditModeOnTitleSection = false;
    });
  }

  void addOption(int index) {
    setState(() {
      var choices = formState.questionListState[index].multipleChoices;
      const option2 = "Option 2";

      if (choices.isNotEmpty) {
        choices.insert(choices.length - 1, option2);
      } else {
        choices.add(option2);
      }
    });
  }

  void addOther(int index) {
    setState(() {
      var choices = formState.questionListState[index].multipleChoices;
      const other = "Other";

      if (choices.isNotEmpty) {
        choices.insert(choices.length - 1, other);
      } else {
        choices.add(other);
      }
      formState.questionListState[index].multipleChoices.removeLast();
    });
  }

  void onChangeOptionValue(
      int questionIndex, int optionIndex, String newValue) {
    setState(() {
      formState.questionListState[questionIndex].multipleChoices[optionIndex] =
          newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 248, 212, 241),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.paddingCustomSmall,
              vertical: AppPadding.paddingSmall,
            ),
            child: Column(
              children: [
                _FormTitleSection(
                  isEditMode: formState.isEditModeOnTitleSection,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: formState.questionListState.length,
                  itemBuilder: (context, index) {
                    final currentItem = formState.questionListState[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.paddingMedium),
                      child: CommonInputField(
                        inputType: currentItem.selectedInputType,
                        dropDownList: currentItem.dropDownList,
                        multipleChoices: currentItem.multipleChoices,
                        questionTitle: currentItem.questiontitle,
                        onInputTypeChanged: (newValue) =>
                            updateSelectedInputType(index, newValue),
                        selectedMultipleChoice:
                            currentItem.selectedMultipleChoice,
                        onSelectMultipleChoice: (newValue) =>
                            updateSelectedMultipleChoice(index, newValue),
                        onQuestionTitleChange: (newValue) =>
                            onQuestionTitleChange(index, newValue),
                        onParagraphAnswerChange: (newValue) =>
                            onParagraphAnswerChange(index, newValue),
                        onDeleteQuestion: () =>
                            removeQuestion(currentItem.questionId),
                        isEditMode: currentItem.isEditMode,
                        onAddOption: () => addOption(index),
                        onAddOther: () => addOther(index),
                        onChangeOptionValue: (optionIndex, newValue) =>
                            onChangeOptionValue(index, optionIndex, newValue),
                      ),
                    );
                  },
                ),
                if (!formState.isEditModeOnTitleSection)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent),
                      child: const CommonText(
                        textTitle: "Submit",
                        textColor: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: formState.isEditModeOnTitleSection
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: addQuestion,
                      icon:
                          const CommonIcon(iconData: Icons.add_circle_rounded),
                    ),
                    IconButton(
                      onPressed: submitAction,
                      icon: const CommonIcon(iconData: Icons.done),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

class _FormTitleSection extends StatelessWidget {
  final bool isEditMode;

  const _FormTitleSection({required this.isEditMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10.0,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.paddingLarge,
                left: AppPadding.paddingMedium,
                right: AppPadding.paddingMedium,
              ),
              child: CommonTitleTextField(
                textLabel: "Untitled form",
                isEditMode: isEditMode,
                textSize: AppTextSize.textSizeExtraLarge,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.paddingLarge,
                horizontal: AppPadding.paddingMedium,
              ),
              child: CommonTitleTextField(
                textLabel: "Form description",
                isEditMode: isEditMode,
              ))
        ],
      ),
    );
  }
}
