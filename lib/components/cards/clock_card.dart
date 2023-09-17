import 'dart:async';

import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ClockCard extends HookConsumerWidget {
  const ClockCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var timeNow = useState(
      DateFormat('HH:mm:ss').format(
        DateTime.now(),
      ),
    );

    var dateNow = useState(
      DateFormat('EEEE, d MMMM yyyy', "id_ID").format(
        DateTime.now(),
      ),
    );

    // make time now update every second
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        timeNow.value = DateFormat('HH:mm:ss').format(DateTime.now());
      });

      return timer.cancel;
    }, []);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        boxShadow: [Appstyle.boxShadowStyle],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo/weather.svg',
            height: 90,
          ),
          Column(
            children: [
              Text(
                dateNow.value.toString(),
                style: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                ),
              ),
              Text(
                timeNow.value.toString(),
                style: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
