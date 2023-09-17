import 'package:absensitanggamus/components/buttons/kalender_button.dart';
import 'package:absensitanggamus/components/buttons/uploadfile_buttons.dart';
import 'package:absensitanggamus/components/cards/appbar_card.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IzinPage extends HookWidget {
  const IzinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _kategoriIzin = useState('Pilih Kategori Izin');
    var items = [
      'Pilih Kategori Izin',
      'Cuti',
      'Sakit',
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppBarCustom(
              title: 'Pengajuan Izin',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KalenderButton(),
                  const SizedBox(height: 15),
                  const Text(
                    "Kategori Izin",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18,
                      ),
                      value: _kategoriIzin.value,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map(
                        (String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        _kategoriIzin.value = newValue!;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Keterangan",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tulis Keterangan',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Bukti",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const UploadFileButton(),
                  const SizedBox(height: 15),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: const Text(
                        'Kirim Pengajuan',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
