import 'package:bookly_app/core/utlis/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.borderRadius,
      this.textSize = 18,
      required this.text, this.onPressed});

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double textSize;
  final void Function()? onPressed ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            )),
        child: Text(
          text,
          style: Style.textStyle18.copyWith(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
