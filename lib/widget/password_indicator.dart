import 'package:flutter/material.dart';

class PasswordIndicator extends StatelessWidget {
  final Color color;
  const PasswordIndicator(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        height: 5,
        width: 50,
      ),
    );
  }
}
