import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextField extends HookConsumerWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.keyboardType,
    this.isPassword,
    this.isLast,
    this.isEmail,
    this.isNik,
  });

  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final bool? isLast;
  final bool? isEmail;
  final bool? isNik;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidePassword = useState<bool>(isPassword ?? false);

    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: hidePassword.value,
      textInputAction:
          isLast == true ? TextInputAction.done : TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText tidak boleh kosong';
        }
        if (isEmail == true) {
          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return 'Email tidak valid';
          }
        }
        if (isPassword == true) {
          if (value.length < 8) {
            return 'Password tidak boleh kurang dari 8 digit';
          }
        }
        if (isNik == true) {
          if (value.length < 16) {
            return 'NIK tidak boleh kurang dari 16 digit';
          }
        }
        return null;
      },
      decoration: Appstyle.inputDecoration.copyWith(
        suffixIcon: isPassword == true
            ? IconButton(
                onPressed: () {
                  hidePassword.value = !hidePassword.value;
                },
                icon: Icon(
                  hidePassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.grayColor,
                  size: 20,
                ),
              )
            : null,
        labelText: labelText,
      ),
    );
  }
}
