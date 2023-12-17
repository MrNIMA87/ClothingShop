
import 'package:flutter/material.dart';

class IconsTextField extends StatelessWidget {
  IconsTextField({
    super.key,
    required this.color,
    required this.iconColor,
    required this.icon,
  });

  Color color = Colors.white70;
  Color iconColor = Colors.black87;
  IconData icon = Icons.add;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
    );
  }
}
