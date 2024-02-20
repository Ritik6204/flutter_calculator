import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final tapped;
  const Buttons(
      {super.key,
      required this.tapped,
      required this.color,
      required this.buttonText,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
