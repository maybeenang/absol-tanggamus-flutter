import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class UploadFileButton extends StatelessWidget {
  const UploadFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: AppColors.primaryColor.withOpacity(0.5),
          child: Ink(
            color: AppColors.borderColor,
            child: const Center(
              child: Column(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
