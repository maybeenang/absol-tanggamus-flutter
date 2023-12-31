import 'package:absensitanggamus/entity/history_absen_entity.dart';
import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AbsenClock extends ConsumerWidget {
  const AbsenClock({super.key, required this.data});

  final HistoryAbsen data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatJamMasuk = DateFormat('HH:mm:ss', "id_ID").format(
      data.absen.jamMasuk.toLocal(),
    );
    final formatJamKeluar = DateFormat('HH:mm:ss', "id_ID").format(
      data.absen.jamKeluar.toLocal(),
    );

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
        boxShadow: [Appstyle.boxShadowStyle],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'Absen Masuk',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              Text(
                formatJamMasuk.toString(),
                style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Absen Keluar',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                ),
              ),
              Text(
                formatJamKeluar.toString(),
                style: const TextStyle(
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
