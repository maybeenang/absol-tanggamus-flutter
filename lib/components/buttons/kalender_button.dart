import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class KalenderButton extends HookConsumerWidget {
  const KalenderButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return Container(
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
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
            if (picked != null) {
              selectedTanggal.value = DateFormat.EEEE('id_ID').format(picked);
              selectedTanggal2.value = DateFormat('d MMMM yyyy').format(picked);
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
    );
  }
}
