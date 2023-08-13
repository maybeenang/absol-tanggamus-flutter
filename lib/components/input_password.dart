import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passwordVisible,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          labelText: 'Password',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              icon: Icon(
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColors.secondaryColor,
                size: 20,
              )),
          suffixIconColor: AppColors.secondaryColor),
    );
  }
}
