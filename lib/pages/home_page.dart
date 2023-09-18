import 'package:absensitanggamus/pages/beranda_page.dart';
import 'package:absensitanggamus/pages/history_page.dart';
import 'package:absensitanggamus/pages/izin_page.dart';
import 'package:absensitanggamus/pages/lokasi_page.dart';
import 'package:absensitanggamus/providers/location_provider.dart';
import 'package:absensitanggamus/providers/user_controller.dart';
import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currIndex = useState(0);
    ref.watch(userControllerProvider);
    ref.watch(locationControllerProvider);
    return Scaffold(
      body: <Widget>[
        const BerandaPage(),
        const LokasiPage(),
        const IzinPage(),
        const HistoryPage(),
      ][currIndex.value],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor,
          boxShadow: [Appstyle.boxShadowStyle],
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          elevation: 0,
          indicatorColor: AppColors.whiteColor,
          selectedIndex: currIndex.value,
          height: 60,
          onDestinationSelected: (value) {
            currIndex.value = value;
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: AppColors.primaryColor,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: AppColors.grayColor,
              ),
              label: 'Beranda',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.location_on,
                color: AppColors.primaryColor,
              ),
              icon: Icon(
                Icons.location_on_outlined,
                color: AppColors.grayColor,
              ),
              label: 'Lokasi',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.description,
                color: AppColors.primaryColor,
              ),
              icon: Icon(
                Icons.description_outlined,
                color: AppColors.grayColor,
              ),
              label: 'Izin',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.history,
                color: AppColors.primaryColor,
              ),
              icon: Icon(
                Icons.history_outlined,
                color: AppColors.grayColor,
              ),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
