import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWelcomeCard extends ConsumerWidget {
  const LoadingWelcomeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.grey.shade400,
      enabled: true,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 20,
                color: AppColors.whiteColor,
              ),
              const SizedBox(height: 5),
              Container(
                width: 50,
                height: 20,
                color: AppColors.whiteColor,
              ),
            ],
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
