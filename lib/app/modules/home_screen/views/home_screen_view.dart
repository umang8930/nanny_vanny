import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/app/data/model/response/current_booking_list.dart';
import 'package:nanny_vanny/app/data/model/response/packages_list.dart';
import 'package:nanny_vanny/app/data/network/api_response.dart';
import 'package:nanny_vanny/app/data/value/dimens.dart';
import 'package:nanny_vanny/app/theme/app_color.dart';
import 'package:nanny_vanny/app/theme/styles.dart';
import 'package:nanny_vanny/utils/common_widgets/common_button.dart';
import 'package:nanny_vanny/utils/loader/loading_widget.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white70,
        ),
      ),
      controller: controller.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          color: Colors.white70,
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: Get.height * 0.12,
                  margin: EdgeInsets.only(
                    top: Get.height * 0.04,
                    bottom: Get.height * 0.01,
                  ),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                      )),
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Emily Cyrus",
                  style: Styles.black18BoldText.copyWith(color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Home',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Book A Nanny',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: AppColors.primaryColor,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'How It Works',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Why Nanny Vanny',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'My Bookings',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: AppColors.primaryColor,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'My Profile',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: AppColors.primaryColor,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Support',
                    style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  dense: true,
                  minTileHeight: 0,
                ),
              ],
            ),
          ),
        ),
      ),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
            color: AppColors.white,
            // border: Border.all(color: Colors.black, width: 3),
            boxShadow: [AppColors.commonBoxShadow]),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: RefreshIndicator(
              onRefresh: () => controller.onPageInit(),
              child: SingleChildScrollView(
                child: Obx(
                  () => controller.isLoading.isTrue
                      ? SizedBox(
                          height: Get.height,
                          width: Get.width,
                          child: showLoader(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: _handleMenuButtonPressed,
                                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                                    valueListenable: controller.advancedDrawerController,
                                    builder: (_, value, __) {
                                      return AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 250),
                                        child: Icon(
                                          value.visible ? Icons.clear : Icons.menu,
                                          color: AppColors.primaryColor,
                                          key: ValueKey<bool>(value.visible),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: Get.height * 0.08,
                                  margin: const EdgeInsets.only(right: 10),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                      )),
                                  child: Image.asset(
                                    'assets/images/profile_image.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome",
                                      style: Styles.black16MediumText,
                                    ),
                                    Text(
                                      "Emily Cyrus",
                                      style: Styles.black18MediumText
                                          .copyWith(color: AppColors.primaryColor),
                                    ),
                                  ],
                                )
                              ],
                            ).paddingSymmetric(horizontal: 20),
                            SizedBox(
                              height: Get.height * 0.2,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 12,
                                    child: Container(
                                      height: Get.height * 0.15,
                                      width: Get.width - 40,
                                      // margin: EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nanny And\nBabysitting Services",
                                            style: Styles.black16MediumText
                                                .copyWith(color: AppColors.blueTextColor),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CommonButton(
                                            onTap: () {},
                                            height: 20,
                                            width: Get.width * 0.2,
                                            buttonName: "Book Now",
                                            buttonColor: AppColors.blueTextColor,
                                            style: Styles.black12MediumText
                                                .copyWith(color: AppColors.white),
                                          ),
                                        ],
                                      ).paddingOnly(bottom: 15, left: 20),
                                    ).paddingOnly(left: 20),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 5,
                                    child: Image(
                                      height: Get.height * 0.2,
                                      image: const AssetImage("assets/images/card_image.png"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(
                                "Your Current Booking",
                                style: Styles.black18MediumText
                                    .copyWith(color: AppColors.blueTextColor),
                              ).paddingSymmetric(horizontal: 20),
                              Dimens.heightGap15,
                              Obx(
                                () => controller.packagesList.isEmpty
                                    ? noRecordFound()
                                    : ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return Dimens.heightGap10;
                                        },
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: controller.currentBookingList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, bookingIndex) {
                                          CurrentBookingList bookingData =
                                              controller.currentBookingList[bookingIndex];
                                          return bookingItemCard(
                                              bookingData: bookingData, bookingIndex: bookingIndex);
                                        },
                                      ),
                              )
                            ]),
                            Dimens.heightGap15,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Packges",
                                  style: Styles.black18MediumText
                                      .copyWith(color: AppColors.blueTextColor),
                                ).paddingSymmetric(horizontal: 20),
                                Dimens.heightGap15,
                                Obx(
                                  () => controller.packagesList.isEmpty
                                      ? noRecordFound()
                                      : ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return Dimens.heightGap10;
                                          },
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: controller.packagesList.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, packageIndex) {
                                            PackagesList packageData =
                                                controller.packagesList[packageIndex];
                                            return packageItemCard(
                                                packageData: packageData,
                                                packageIndex: packageIndex);
                                          },
                                        ),
                                )
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) {
        controller.advancedDrawerController.showDrawer();
      },
    );
  }

  Widget packageItemCard({required PackagesList packageData, required int packageIndex}) {
    return Container(
      width: Get.width,
      // margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        boxShadow: const [AppColors.commonBoxShadow],
        color: packageIndex % 2 == 0 ? AppColors.primaryColor : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.calendar_month,
                size: 24,
                color: AppColors.buttonColor,
              ),
              CommonButton(
                onTap: () {},
                height: 20,
                width: Get.width * 0.2,
                buttonName: "Start",
                buttonColor: AppColors.buttonColor,
                style: Styles.black12MediumText.copyWith(color: AppColors.white),
              ),
            ],
          ),
          Dimens.heightGap10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                packageData.title ?? "",
                style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
              ),
              Text(
                packageData.price ?? "",
                style: Styles.black18MediumText.copyWith(color: AppColors.blueTextColor),
              ),
            ],
          ),
          Dimens.heightGap10,
          Text(
            packageData.desc ?? "",
            style: Styles.black10SmallText,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 20);
  }

  Widget bookingItemCard({required CurrentBookingList bookingData, required int bookingIndex}) {
    return Container(
      width: Get.width,
      // margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        boxShadow: const [AppColors.commonBoxShadow],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bookingData.title ?? '',
                style: Styles.black18MediumText.copyWith(color: AppColors.primaryColor),
              ),
              CommonButton(
                onTap: () {},
                height: 20,
                width: Get.width * 0.2,
                buttonName: "Start",
                buttonColor: AppColors.buttonColor,
                style: Styles.black12MediumText.copyWith(color: AppColors.white),
              ),
            ],
          ),
          Dimens.heightGap8,
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "From",
                          style: Styles.black12MediumText,
                        ),
                        Dimens.heightGap3,
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.primaryColor,
                              size: 12,
                            ),
                            Text(
                              bookingData.fromDate ?? '',
                              style: Styles.black12MediumText,
                            ),
                          ],
                        ),
                        Dimens.heightGap3,
                        Row(
                          children: [
                            const Icon(
                              Icons.alarm,
                              color: AppColors.primaryColor,
                              size: 12,
                            ),
                            Text(
                              bookingData.fromTime ?? '',
                              style: Styles.black12MediumText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To",
                          style: Styles.black12MediumText,
                        ),
                        Dimens.heightGap3,
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: AppColors.primaryColor,
                              size: 12,
                            ),
                            Text(
                              bookingData.toDate ?? '',
                              style: Styles.black12MediumText,
                            ),
                          ],
                        ),
                        Dimens.heightGap3,
                        Row(
                          children: [
                            const Icon(
                              Icons.alarm,
                              color: AppColors.primaryColor,
                              size: 12,
                            ),
                            Text(
                              bookingData.toTime ?? '',
                              style: Styles.black12MediumText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Dimens.heightGap15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonButton(
                onTap: () {},
                height: 20,
                width: Get.width * 0.25,
                btnWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rate_outlined,
                      color: AppColors.white,
                      size: 12,
                    ),
                    Text(
                      "Rate Us",
                      style: Styles.black12MediumText.copyWith(color: AppColors.white),
                    )
                  ],
                ),
                buttonColor: AppColors.blueTextColor,
                style: Styles.black12MediumText.copyWith(color: AppColors.white),
              ),
              CommonButton(
                onTap: () {},
                height: 20,
                width: Get.width * 0.25,
                btnWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.white,
                      size: 12,
                    ),
                    Text(
                      "Geolocation",
                      style: Styles.black12MediumText.copyWith(color: AppColors.white),
                    )
                  ],
                ),
                buttonColor: AppColors.blueTextColor,
                style: Styles.black12MediumText.copyWith(color: AppColors.white),
              ),
              CommonButton(
                onTap: () {},
                height: 20,
                width: Get.width * 0.25,
                btnWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.handshake,
                      color: AppColors.white,
                      size: 12,
                    ),
                    Text(
                      "Survillence",
                      style: Styles.black12MediumText.copyWith(color: AppColors.white),
                    )
                  ],
                ),
                buttonColor: AppColors.blueTextColor,
                style: Styles.black12MediumText.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 20);
  }
}
