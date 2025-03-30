import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_input_field.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/features/submit_screen.dart/bloc/submit_screen_state.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  late String selectedInputType;
  late String questiontitle;
  late String paragraphAnswer;
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

  void removeQuestion(int index) {
    setState(() {
      if (formState.questionListState.length > 1) {
        formState.questionListState.removeAt(index);
      }
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
                child: _FormTitleSection(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ListView.builder(
                      itemCount: formState.questionListState.length,
                      itemBuilder: (context, index) {
                        final currentItem = formState.questionListState[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CommonInputField(
                            inputType: currentItem.selectedInputType,
                            dropDownList: currentItem.dropDownList,
                            multipleChoices: currentItem.multipleChoices,
                            onInputTypeChanged: (newValue) =>
                                updateSelectedInputType(index, newValue),
                            selectedMultipleChoice:
                                currentItem.selectedMultipleChoice,
                            onSelectMultipleChoice: (newValue) =>
                                updateSelectedMultipleChoice(index, newValue),
                            onQuestionTitleChange: (newValue) =>
                                onQuestionTitleChange(index, newValue),
                            onParagraphAnswerChange: (newValue) =>
                                onQuestionTitleChange(index, newValue),
                            onDeleteQuestion: () => removeQuestion(index),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => {},
          child: SizedBox(
            width: double.infinity,
            child: IconButton(
              onPressed: addQuestion,
              icon: Icon(Icons.add_circle_rounded),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

class _FormTitleSection extends StatelessWidget {
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
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: CommonText(
              textTitle: "Untitled form",
              textSize: 26.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
            child: CommonText(
              textTitle: "Form description",
            ),
          )
        ],
      ),
    );
  }
}
