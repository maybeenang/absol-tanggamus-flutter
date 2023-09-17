import 'package:absensitanggamus/pages/beranda_page.dart';
import 'package:absensitanggamus/pages/history_page.dart';
import 'package:absensitanggamus/pages/izin_page.dart';
import 'package:absensitanggamus/pages/lokasi_page.dart';
import 'package:absensitanggamus/styles/appstyle.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var currIndex = useState(0);

    return Scaffold(
      body: <Widget>[
        const BerandaPage(),
        LokasiPage(),
        const IzinPage(),
        const HistoryPage(),
      ][currIndex.value],
      bottomNavigationBar: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
