import 'package:flutter/material.dart';

class reusable_container extends StatelessWidget {
  reusable_container({required this.color, this.cardChild, this.onPress});
  final Color color;
  final cardChild;
  final onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
