import 'package:absensitanggamus/components/buttons/absen_buttons.dart';
import 'package:absensitanggamus/components/cards/absenclock_card.dart';
import 'package:absensitanggamus/components/cards/clock_card.dart';
import 'package:absensitanggamus/components/cards/welcome_cards.dart';
import 'package:absensitanggamus/components/loading/loading_absenclock_card.dart';
import 'package:absensitanggamus/components/loading/loading_welcome_card.dart';
import 'package:absensitanggamus/entity/history_absen_entity.dart';
import 'package:absensitanggamus/providers/absen_controller.dart';
import 'package:absensitanggamus/providers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BerandaPage extends HookConsumerWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userControllerProvider);
    final absenState = ref.watch(absenControllerProvider);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await ref.refresh(absenControllerProvider.notifier).getAbsenToday();
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            userState.maybeWhen(
              orElse: () => const LoadingWelcomeCard(),
              data: (data) => WelcomeCard(data: data!),
            ),
            const SizedBox(height: 30),
            const ClockCard(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const AbsenButtons(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            absenState.maybeWhen(
                orElse: () => const LoadingAbsenClock(),
                data: (data) {
                  if (data is HistoryAbsen) {
                    return AbsenClock(data: data);
                  }
                  return const LoadingAbsenClock();
                }),
          ],
        ),
      ),
    );
  }
}
