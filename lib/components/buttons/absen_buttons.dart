import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsenButtons extends ConsumerWidget {
  const AbsenButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 200),
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        elevation: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo/cursor.svg',
            height: 90,
          ),
          const SizedBox(height: 10),
          const Text(
            'Absen',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
