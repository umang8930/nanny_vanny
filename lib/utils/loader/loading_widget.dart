import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/app/theme/app_color.dart';

import '../../app/theme/styles.dart';

Widget loadingWidget({Color? color, double? size}) {
  return Center(
      child: SpinKitThreeBounce(
    size: size ?? 30,
    color: color ?? AppColors.baseColor,
  ));
}

Widget imgLoader({required double height, required double width}) {
  return Center(
    child: SizedBox(
      width: width,
      height: height,
      child: const CircularProgressIndicator(
        color: AppColors.secondaryColor,
      ),
    ),
  );
}

Widget imgErrorIcon({double? iconSize}) {
  return Center(
      child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey[300],
    ),
    child: Icon(
      Icons.person_outline,
      size: iconSize,
    ).paddingAll(5),
  ));
}

Widget noRecordFound() {
  return Center(
    child: Text(
      "No Record Found",
      // style: Styles.tsBlackMedium16,
    ),
  );
}
