import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.go('/home');
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ))),
        child: const Text('L O G I N',
            style: TextStyle(
                color: AppColors.secondaryColor, fontWeight: FontWeight.w900)));
  }
}
