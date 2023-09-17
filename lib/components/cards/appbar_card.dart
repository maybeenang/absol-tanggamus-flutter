import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key, this.title = 'Judul'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
