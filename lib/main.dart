import 'package:flutter/material.dart';
import 'package:form_builder_example/features/submit_screen.dart/view/submit_screen.dart';

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
        child: SubmitScreen(),
      ),
    );
  }
}
