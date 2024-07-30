import '../data/question_data.dart';
import '../themes/theme.dart';
import 'package:flutter/material.dart';

import '../data/answer.dart';
import '../data/question.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void resetQuiz() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  void _selectedQuestion() {
    if (_selectedIndex < questions.length - 1) {
      setState(() {
        _selectedIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Quiz App"),
            actions: [
              TextButton(
                  onPressed: resetQuiz,
                  child: const Icon(
                    Icons.restore_rounded,
                    color: Colors.white,
                  )),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Question(
                      questionText:
                          questions[_selectedIndex]['questionText'] as String)),
              ...(questions[_selectedIndex]['answerText'] as List<String>).map(
                  (ans) =>
                      Answer(selectHandler: _selectedQuestion, answers: ans)),
            ],
          ),
        ));
  }
}
