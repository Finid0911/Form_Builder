import 'package:flutter/material.dart';
import 'package:form_builder_example/common_widgets/common_answer_field.dart';
import 'package:form_builder_example/providers/submit_screen_provider.dart';
import 'package:provider/provider.dart';

class ResponseScreen extends StatelessWidget {
  const ResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionsProvider>(context);
    final questionsState = provider.questionsState;

    return ListView.builder(
      itemCount: questionsState.questionListState.length,
      itemBuilder: (context, index) {
        final currentItem = questionsState.questionListState[index];
        return CommonAnswerField(
          question: currentItem.questiontitle,
          answer: currentItem.paragraphAnswer,
        );
      },
    );
  }
}
