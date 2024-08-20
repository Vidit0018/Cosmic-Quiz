import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styledText.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({required this.summaryData, super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(mainAxisSize: MainAxisSize.max, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data['question '] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['user_answer'] as String,
                    style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data['correct_answer'] as String,
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height:30 ,)
                ],
              ))
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
