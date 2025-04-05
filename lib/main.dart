import 'package:flutter/material.dart';
import 'package:form_builder_example/features/screens/response_screen.dart';
import 'package:form_builder_example/features/screens/questions_screen.dart';
import 'package:form_builder_example/providers/submit_screen_provider.dart';
import 'package:form_builder_example/utilities/constants.dart';
import 'package:form_builder_example/utilities/tab_enum.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => QuestionsProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void goToResponseTab() {
    _tabController.animateTo(AppTab.responses.index);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: AppTab.values.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: questions),
                Tab(text: responses),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              QuestionsScreen(onSubmit: goToResponseTab),
              ResponseScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
