import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color color;
  const SmallButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}