import 'package:flutter/material.dart';
import 'package:form_builder_example/features/response_screen/view/response_screen.dart';
import 'package:form_builder_example/features/submit_screen/view/submit_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Questions"),
                Tab(text: "Responses"),
              ],
            ),
          ),
          body: TabBarView(children: [
            SubmitScreen(),
            ResponseScreen(),
          ]),
        ),
      ),
    );
  }
}
