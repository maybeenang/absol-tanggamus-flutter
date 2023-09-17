import 'package:absensitanggamus/components/buttons/absen_buttons.dart';
import 'package:absensitanggamus/components/cards/absenclock_card.dart';
import 'package:absensitanggamus/components/cards/clock_card.dart';
import 'package:absensitanggamus/components/cards/welcome_cards.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            WelcomeCard(),
            SizedBox(height: 30),
            ClockCard(),
            Expanded(child: AbsenButtons()),
            AbsenClock(),
          ],
        ),
      ),
    );
  }
}
