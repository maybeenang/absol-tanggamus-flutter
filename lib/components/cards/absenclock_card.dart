import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsenClock extends ConsumerWidget {
  const AbsenClock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
        boxShadow: [Appstyle.boxShadowStyle],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Absen Masuk',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              Text(
                '08:00:00',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Absen Keluar',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              Text(
                '08:00:00',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
