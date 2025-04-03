import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_icon.dart';
import 'package:form_builder_example/common_widgets/common_input_field.dart';
import 'package:form_builder_example/common_widgets/common_text_field.dart';
import 'package:form_builder_example/constants/app_padding.dart';
import 'package:form_builder_example/constants/app_text_size.dart';
import 'package:form_builder_example/features/submit_screen.dart/bloc/submit_screen_state.dart';

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
      print("questionId: $questionId");
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
    });
  }

  void backToEditMode() {
    setState(() {
      QuestionBuilderState.setToEditMode(formState.questionListState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 248, 212, 241),
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.paddingCustomSmall, vertical: 3.0),
                child: _FormTitleSection(isEditMode: true,),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.paddingCustomSmall),
                  child: ListView.builder(
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
                          ),
                        );
                      }),
                ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: addQuestion,
                icon: const CommonIcon(iconData: Icons.add_circle_rounded),
              ),
              IconButton(
                onPressed: submitAction,
                icon: const CommonIcon(iconData: Icons.done),
              ),
              IconButton(
                onPressed: backToEditMode,
                icon: const CommonIcon(iconData: Icons.arrow_back_ios_sharp),
              ),
            ],
          ),
        ),
      ),
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
          const Padding(
            padding: EdgeInsets.only(
                top: AppPadding.paddingLarge,
                left: AppPadding.paddingMedium,
                right: AppPadding.paddingMedium,
              ),
              child: CommonTextField(
                textLabel: "Untitled form",
                isEditMode: true,
                textSize: AppTextSize.textSizeExtraLarge,
              )),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.paddingLarge,
              horizontal: AppPadding.paddingMedium,
            ),
            child: CommonTextField(
                textLabel: "Form description",
                isEditMode: true,
              )
          )
        ],
      ),
    );
  }
}
