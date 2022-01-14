import 'package:flutter/material.dart';

import '/views/constants.dart';

class CustomRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;
  const CustomRoundedButton({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultMargin / 3),
      child: MaterialButton(
        elevation: 5,
        padding: const EdgeInsets.symmetric(vertical: kDefaultMargin / 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        minWidth: 200.0,
        height: 54.0,
        color: color,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
