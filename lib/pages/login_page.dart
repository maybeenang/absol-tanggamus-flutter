import 'package:absensitanggamus/components/button_login.dart';
import 'package:absensitanggamus/components/input_password.dart';
import 'package:absensitanggamus/components/input_username.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Image(image: AssetImage('assets/logo/logo.png')),
                const SizedBox(height: 50),
                const Text('Silahkan masuk dengan username dan password',
                    style: TextStyle(color: AppColors.grayColor, fontSize: 14)),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: const InputUsername(),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: const InputPassword(),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: const ButtonLogin(),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Image(
                        image: AssetImage('assets/logo/bottomLogo.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
