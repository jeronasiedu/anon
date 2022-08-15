import 'package:flutter/material.dart';

class CircleShape extends StatelessWidget {
  const CircleShape({
    Key? key,
    this.width,
    this.color,
  }) : super(key: key);
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            width: width ?? 25,
            color: color ?? Colors.white.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}
