import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final bool hasGradient;
  final Widget icon;
  final double padding;
  final Color color1;
  final Color color2;

  const CustomIconButton({required this.hasGradient, required this.icon, this.padding = 5, this.color1 = Colors.black, this.color2 = Colors.black, super.key});

  @override
  Widget build(BuildContext context) {
    if (hasGradient) {
      return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: icon,
      );
    } else {
      return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: icon,
      );
    }
  }
}