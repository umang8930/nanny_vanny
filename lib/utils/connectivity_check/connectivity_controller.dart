import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectivityController extends GetxController {
  var isOnline = true.obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    // getUserContactList();
    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      for (var i in result) {
        var v = await _checkInternetAccess();
        isOnline.value = v;
        log("Check ${result.length} for internet : $v");
      }
      // Received changes in available connectivity types!
    });
  }

  Future<bool> _checkInternetAccess() async {
    try {
      final response = await _dio.get('https://www.google.com',
          options: Options(
            receiveTimeout: const Duration(seconds: 5),
            sendTimeout: const Duration(seconds: 5),
          ));
      if (response.statusCode == 200) {
        return true;
      } else {
        Get.closeAllSnackbars();
        do {
          Get.back();
        } while ((Get.isBottomSheetOpen ?? false));
        return false;
      }
    } catch (e) {
      Get.closeAllSnackbars();
      do {
        if ((Get.isBottomSheetOpen ?? false)) {
          Get.back();
        }
      } while ((Get.isBottomSheetOpen ?? false));
      return false;
    }
  }
}
