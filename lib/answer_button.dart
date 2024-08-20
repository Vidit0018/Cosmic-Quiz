import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/styledText.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onTap, super.key});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor:  Colors.white.withOpacity(0.7),
      ),
      child: Styledtext(text),
    );
  }
}
