import 'dart:io';

import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UploadFileButton extends HookConsumerWidget {
  const UploadFileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState<File?>(null);

    return Container(
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            final pickedFile = await getImage();
            image.value = File(pickedFile!.path);
          },
          splashColor: AppColors.primaryColor.withOpacity(0.5),
          child: Ink(
            color: AppColors.borderColor,
            child: Center(
              child: image.value == null
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: AppColors.primaryColor,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Upload Bukti',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    )
                  : Image.file(image.value!, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }
}
