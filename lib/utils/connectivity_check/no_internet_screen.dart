import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app/data/value/dimens.dart';
import '../../app/theme/app_color.dart';


class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({super.key});

  @override
  State<NoConnectionScreen> createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [AppColors.commonBoxShadow],
              borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          padding: EdgeInsets.all(Get.width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SvgPicture.asset(AppImages.noConnection),
              Text(
                "No Internet Connection",
                // style: Styles.tsBlackBold18,
              ),
              Dimens.heightGap5,
              Text(
                "No internet connection found, Please check your connection or try again.",
                // style: Styles.tsBlackRegular14,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: Get.width * 0.05),
              Dimens.heightGap10,
            ],
          ),
        ),
      ),
    );
  }
}
