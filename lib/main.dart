import 'package:flutter/material.dart';
import 'package:form_builder_example/features/view/my_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Builder Demo Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: Scaffold(
          body: MyFormPage(),
        ),
      ),
    );
  }
}
