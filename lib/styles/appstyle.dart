import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class Appstyle {
  static BoxShadow boxShadowStyle = BoxShadow(
    color: AppColors.grayColor.withOpacity(0.3),
    blurRadius: 10,
    offset: const Offset(0, 4),
  );

  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );

  static const InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: AppColors.whiteColor,
    hintStyle: TextStyle(color: AppColors.grayColor),
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    labelStyle: TextStyle(
      color: AppColors.grayColor,
      fontSize: 14,
    ),
  );
}
