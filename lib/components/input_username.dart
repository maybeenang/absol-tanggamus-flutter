import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class InputUsername extends StatelessWidget {
  const InputUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        labelText: 'Username',
      ),
    );
  }
}
