import 'package:absensitanggamus/entity/history_absen_entity.dart';
import 'package:absensitanggamus/providers/absen_controller.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbsenButtons extends ConsumerWidget {
  const AbsenButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyState = ref.watch(absenControllerProvider);

    setColorButton(int statusAbsenId) {
      switch (statusAbsenId) {
        case 1:
          return AppColors.actionColor;
        case 2:
          return Colors.green;
        case 3:
          return Colors.amber;
        case 4:
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return historyState.when(
      data: (data) {
        if (data is HistoryAbsen) {
          return ElevatedButton(
            onPressed: () async {
              await ref.read(absenControllerProvider.notifier).absenMasuk();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 200),
              shape: const CircleBorder(),
              backgroundColor: data.statusAbsenId == 1
                  ? AppColors.actionColor
                  : setColorButton(data.statusAbsenId),
              elevation: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  data.statusAbsenId == 1
                      ? 'assets/logo/cursor.svg'
                      : 'assets/logo/kalender.svg',
                  height: 90,
                ),
                const SizedBox(height: 10),
                data.statusAbsenId == 1
                    ? const Text(
                        "Absen Masuk",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : Column(
                        children: [
                          const Text(
                            "Berhasil Absen",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Status : ${data.statusAbsen.keterangan}",
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          );
        }
        return SizedBox(
          height: 200,
          width: 200,
          child: Center(
            child: Text(
              data ?? "Tidak ada absen",
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(
          error.toString(),
          style: const TextStyle(color: AppColors.primaryColor),
        );
      },
      loading: () {
        return const SizedBox(
          height: 200,
          width: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
