import 'package:absensitanggamus/components/cards/appbar_card.dart';
import 'package:absensitanggamus/entity/history_absen_entity.dart';
import 'package:absensitanggamus/providers/historyabsen.dart';
import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyAbsenControllerProvider);

    final formatedHistoryJamMasuk = history.maybeWhen(
      orElse: () => "--:--:--",
      data: (data) {
        if (data is HistoryAbsen) {
          return DateFormat('HH:mm:ss', "id_ID").format(
            data.absen.jamMasuk.toLocal(),
          );
        } else {
          return "--:--:--";
        }
      },
    );

    final formatedHistoryJamKeluar = history.maybeWhen(
      orElse: () => "--:--:--",
      data: (data) {
        if (data is HistoryAbsen) {
          return DateFormat('HH:mm:ss', "id_ID").format(
            data.absen.jamKeluar.toLocal(),
          );
        } else {
          return "--:--:--";
        }
      },
    );

    final selectedTanggal = useState(
      DateFormat.EEEE('id_ID').format(
        DateTime.now(),
      ),
    );

    final selectedTanggal2 = useState(
      DateFormat('d MMMM yyyy').format(
        DateTime.now(),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          const AppBarCustom(
            title: "Riwayat Absensi",
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteColor,
                    boxShadow: [Appstyle.boxShadowStyle],
                  ),
                  width: double.infinity,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light().copyWith(
                                  primary: AppColors.primaryColor,
                                ),
                              ),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          await ref
                              .read(historyAbsenControllerProvider.notifier)
                              .getHistoryByDate(
                                  DateFormat('yyyy-MM-dd').format(picked));

                          selectedTanggal.value =
                              DateFormat.EEEE('id_ID').format(picked);
                          selectedTanggal2.value =
                              DateFormat('d MMMM yyyy').format(picked);
                        }
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(
                                Icons.calendar_today,
                                color: AppColors.secondaryColor,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedTanggal.value.toString(),
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  selectedTanggal2.value.toString(),
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Absen Masuk",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        formatedHistoryJamMasuk,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.grayColor,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Absen Keluar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        formatedHistoryJamKeluar,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.grayColor,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
