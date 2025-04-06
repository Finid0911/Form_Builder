import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_icon.dart';
import 'package:form_builder_example/common_widgets/common_input_field.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/common_widgets/common_title_text_field.dart';
import 'package:form_builder_example/constants/app_padding.dart';
import 'package:form_builder_example/constants/app_text_size.dart';
import 'package:form_builder_example/features/state/questions_state.dart';
import 'package:form_builder_example/providers/questions_provider.dart';
import 'package:form_builder_example/utilities/constants.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  final VoidCallback onSubmit;

  const QuestionsScreen({super.key, required this.onSubmit});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionsProvider>(context);
    final questionsState = provider.questionsState;

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
                  isEditMode: questionsState.isEditModeOnTitleSection,
                ),
                _QuestionListField(
                  questionsProvider: provider,
                  questionState: questionsState,
                ),
                if (!questionsState.isEditModeOnTitleSection)
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.paddingStandard),
                    child: ElevatedButton(
                      onPressed: () => {widget.onSubmit()},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent),
                      child: const CommonText(
                        textTitle: submit,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: questionsState.isEditModeOnTitleSection
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: provider.addQuestion,
                  icon: const CommonIcon(iconData: Icons.add_circle_rounded),
                ),
                IconButton(
                  onPressed: provider.onSubmitAnswer,
                  icon: const CommonIcon(iconData: Icons.done),
                ),
              ],
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
                textLabel: untitledForm,
                isEditMode: isEditMode,
                textSize: AppTextSize.textSizeExtraLarge,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.paddingLarge,
                horizontal: AppPadding.paddingMedium,
              ),
              child: CommonTitleTextField(
                textLabel: formDescription,
                isEditMode: isEditMode,
              ))
        ],
      ),
    );
  }
}

class _QuestionListField extends StatelessWidget {
  final QuestionsProvider questionsProvider;
  final QuestionsState questionState;

  const _QuestionListField({
    required this.questionsProvider,
    required this.questionState,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questionState.questionListState.length,
      itemBuilder: (context, index) {
        final currentItem = questionState.questionListState[index];
        return GestureDetector(
          onTap: () {
            if (questionState.isEditModeOnTitleSection == true) {
              questionsProvider.onChangeQuestionToEditMode(index);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.paddingMedium,
            ),
            child: CommonInputField(
              inputType: currentItem.selectedInputType,
              dropDownList: currentItem.dropDownList,
              multipleChoices: currentItem.multipleChoices,
              questionTitle: currentItem.questionTitle,
              onInputTypeChanged: (newValue) =>
                  questionsProvider.onSelectInputType(index, newValue),
              selectedMultipleChoice: currentItem.selectedMultipleChoice,
              onSelectMultipleChoice: (newValue) =>
                  questionsProvider.onSelectMultipleChoice(index, newValue),
              onQuestionTitleChange: (newValue) =>
                  questionsProvider.onQuestionTitleChange(index, newValue),
              onParagraphAnswerChange: (newValue) =>
                  questionsProvider.onParagraphAnswerChange(index, newValue),
              onDeleteQuestion: () => questionsProvider.removeQuestion(index),
              isEditMode: currentItem.isEditMode,
              onAddOption: () => questionsProvider.addOption(index),
              onAddOther: () => questionsProvider.addOptionOther(index),
              onChangeOptionValue: (optionIndex, newValue) => questionsProvider
                  .onChangeOptionValue(index, optionIndex, newValue),
            ),
          ),
        );
      },
    );
  }
}
