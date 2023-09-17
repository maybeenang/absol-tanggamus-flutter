import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/logo/logo.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Image(
                  image: AssetImage('assets/logo/bottomLogo.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
