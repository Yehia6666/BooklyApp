import 'package:bookly_app/core/utlis/style.dart';
import 'package:flutter/material.dart';

class CustomFailure extends StatelessWidget {
  const CustomFailure({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Style.textStyle18,
      ),
    );
  }
}
