import 'package:flutter/material.dart';
import 'constants.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kbottomCardColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}