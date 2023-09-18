import 'package:absensitanggamus/components/input/custom_input.dart';
import 'package:absensitanggamus/entity/auth_entity.dart';
import 'package:absensitanggamus/providers/auth_controller.dart';
import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginFormKey = GlobalKey<FormState>();

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nipController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authController = ref.watch(authControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              onChanged: () {
                loginFormKey.currentState!.validate();
              },
              key: loginFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const Image(image: AssetImage('assets/logo/logo.png')),
                  const SizedBox(height: 50),
                  const Text(
                    'Silahkan masuk dengan NIP dan Password',
                    style: TextStyle(color: AppColors.grayColor, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  authController.maybeWhen(
                    orElse: () => const SizedBox(),
                    data: (data) {
                      if (data is AuthError) {
                        return Text(
                          data.maessage.toString(),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                    error: (error, stackTrace) {
                      return Text(
                        error.toString(),
                        style: const TextStyle(color: AppColors.primaryColor),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomTextField(
                      labelText: 'NIP',
                      controller: nipController,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomTextField(
                      labelText: "Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (loginFormKey.currentState!.validate() &&
                            !authController.isLoading) {
                          FocusScope.of(context).unfocus();
                          await ref.read(authControllerProvider.notifier).login(
                                nipController.text,
                                passwordController.text,
                              );
                        }
                      },
                      style: Appstyle.buttonStyle,
                      child: authController.maybeWhen(
                        orElse: () {
                          return const Text(
                            'L O G I N',
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          );
                        },
                        loading: () {
                          return const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                            ),
                          );
                        },
                      ),
                    ),
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
      ),
    );
  }
}
