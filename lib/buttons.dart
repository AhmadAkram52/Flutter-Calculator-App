import 'package:flutter/material.dart';

class CalcButton extends StatefulWidget {
  final Color btnClr;
  final String title;
  final double fontSize;
  final VoidCallback onPress;

  const CalcButton({
    super.key,
    required this.btnClr,
    required this.title,
    this.fontSize = 25,
    required this.onPress,
  });

  @override
  State<CalcButton> createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 70,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.btnClr.withOpacity(.8),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: widget.fontSize),
        ),
      ),
    );
  }
}
