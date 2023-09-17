import 'dart:async';

import 'package:absensitanggamus/components/cards/appbar_card.dart';
import 'package:absensitanggamus/providers/location_provider.dart';
import 'package:absensitanggamus/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LokasiPage extends HookConsumerWidget {
  const LokasiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationControllerProvider);

    // ignore: no_leading_underscores_for_local_identifiers
    Completer<GoogleMapController> _controller = Completer();

    // ignore: no_leading_underscores_for_local_identifiers
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    return SafeArea(
      child: Column(
        children: [
          const AppBarCustom(
            title: "Titik Lokasi",
          ),
          locationState.when(data: (data) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    // padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 500,
                    child: GoogleMap(
                      scrollGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                      zoomGesturesEnabled: false,
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(data!.latitude, data.longitude),
                        zoom: 15.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Titik Koordinat",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '${data.latitude}, ${data.longitude}',
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }, error: (error, stackTrace) {
            return Expanded(child: Center(child: Text(error.toString())));
          }, loading: () {
            return const Expanded(
                child: Center(child: CircularProgressIndicator()));
          }),
        ],
      ),
    );
  }
}
