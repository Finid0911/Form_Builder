import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_input_field.dart';
import 'package:form_builder_example/common_widgets/common_text.dart';
import 'package:form_builder_example/features/bloc/my_form_state.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  late String selectedInputType;
  late String selectedMultipleChoice;
  late String questiontitle;
  late String paragraphAnswer;
  late MyFormState item;

  @override
  void initState() {
    super.initState();
    item = MyFormState();
    selectedInputType = item.selectedDropDownItem;
    selectedMultipleChoice = item.selectedMultipleChoice;
    questiontitle = item.questiontitle;
    paragraphAnswer = item.paragraphAnswer;
  }

  void updateSelectedInputType(String newType) {
    setState(() {
      selectedInputType = newType;
    });
  }

  void updateSelectedMultipleChoice(String newValue) {
    setState(() {
      selectedMultipleChoice = newValue;
    });
  }

  void onQuestionTitleChange(String newValue) {
    setState(() {
      selectedMultipleChoice = newValue;
    });
  }

  void onParagraphAnswerChange(String newValue) {
    setState(() {
      selectedMultipleChoice = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 248, 212, 241),
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
            child: _FormTitleSection(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CommonInputField(
                    inputType: selectedInputType,
                    dropDownList: item.dropDownList,
                    multipleChoices: item.multipleChoices,
                    onInputTypeChanged: updateSelectedInputType,
                    selectedMultipleChoice: selectedMultipleChoice,
                    onSelectMultipleChoice: updateSelectedMultipleChoice,
                    onQuestionTitleChange: onQuestionTitleChange,
                    onParagraphAnswerChange: onQuestionTitleChange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
