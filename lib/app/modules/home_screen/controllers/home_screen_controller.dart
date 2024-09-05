import 'dart:developer';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/app/data/model/dto/response.dart';
import 'package:nanny_vanny/app/data/model/response/current_booking_list.dart';
import 'package:nanny_vanny/app/data/model/response/packages_list.dart';
import 'package:nanny_vanny/app/data/repository/home_repository.dart';
import 'package:nanny_vanny/utils/app_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreenController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();
  final HomeRepository _homeRepository = HomeRepository();
  RxList<CurrentBookingList> currentBookingList = <CurrentBookingList>[].obs;
  RxList<PackagesList> packagesList = <PackagesList>[].obs;
  RxBool isLoading = false.obs;

  getCurrentBookingList() async {
    isLoading.value = true;
    try {
    final response = await _homeRepository.currentBookingList();
    if (response.data?.code == "200") {
      log("-=-=-----${response.data?.response}");
      List<CurrentBookingList> bookingList = <CurrentBookingList>[];
      log("-=-=-----${bookingList}");
      for (var i = 0; i < (response.data?.response ?? []).length; i++) {
        bookingList.add(CurrentBookingList.fromJson((response.data?.response ?? [])[i]));
      }
      currentBookingList.value = bookingList;
      await getPackagesList();
    } else {
      AppUtils.showToast(msg: response.data?.message ?? "Something went wrong");
    }
    } catch (e) {
      AppUtils.showToast(msg: "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  getPackagesList() async {
    try {
    final response = await _homeRepository.packagesList();
    if (response.data?.code == "200") {
      log("-=-=-----${response.data?.response}");
      List<PackagesList> packageList = <PackagesList>[];
      log("-=-=-----${packageList}");
      for (var i = 0; i < (response.data?.response ?? []).length; i++) {
        packageList.add(PackagesList.fromJson((response.data?.response ?? [])[i]));
      }
      packagesList.value = packageList;
    } else {
      AppUtils.showToast(msg: response.data?.message ?? "Something went wrong");
    }
    } catch (e) {
      AppUtils.showToast(msg: "Something went wrong");
    } finally {}
  }

  onPageInit() async {
    await getCurrentBookingList();
  }

  //TODO: Implement HomeScreenController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    onPageInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
