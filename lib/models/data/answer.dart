import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.selectHandler, required this.answers});
  final void Function() selectHandler;
  final String answers;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(130)),
          onPressed: selectHandler,
          child: Text(
            answers,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          )),
    );
  }
}
