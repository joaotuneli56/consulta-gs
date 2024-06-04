// bottom_button.dart

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Color color;
  final VoidCallback onPressed;

  const BottomButton({
    Key? key,
    required this.buttonTitle,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
