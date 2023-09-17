import 'package:absensitanggamus/components/buttons/kalender_button.dart';
import 'package:absensitanggamus/components/cards/appbar_card.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const KalenderButton(),
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
                  child: const Row(
                    children: [
                      Text(
                        "08:00:00",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.grayColor,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
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
                  child: const Row(
                    children: [
                      Text(
                        "08:00:00",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.grayColor,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
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
