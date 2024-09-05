import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../app/data/value/dimens.dart';
import '../../app/theme/app_color.dart';
import '../../app/theme/styles.dart';

class CommonButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final bool? isFilled;
  final bool? isEnable;
  final onTap;
  final String? buttonName;
  final Color? buttonColor;
  final Widget? btnWidget;
  final bool? isLoading;
  final TextStyle? style;

  const CommonButton(
      {super.key,
        this.height,
        this.width,
        this.isFilled,
        required this.onTap,
        this.buttonName,
        this.buttonColor,
        this.btnWidget,
        this.isLoading,
        this.style,
        this.radius,
        this.isEnable});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: isEnable ?? true ? (isLoading ?? false ? () {} : onTap) : () {},
        child: Container(
            width: width ?? Get.width * 0.3,
            height: height ?? Dimens.scaleX6,
            decoration: BoxDecoration(
              border: Border.all(
                color: isEnable ?? true
                    ? isFilled ?? true
                    ? AppColors.transparent
                    : AppColors.orangeButtonColor
                    : AppColors.disable,
              ),
              borderRadius: BorderRadius.circular(radius ?? Dimens.radiusX32),
              color: isFilled ?? true
                  ? buttonColor ??
                  (isEnable ?? true
                      ? AppColors.orangeButtonColor
                      : AppColors.disable)
                  : AppColors.transparent,
            ),
            child: isLoading ?? false
                ? const Center(
              child: SpinKitThreeBounce(
                size: 20,
                color: AppColors.white,
              ),
            )
                : btnWidget ??
                Center(
                  child: Text(buttonName ?? 'NA',
                      style: isEnable ?? true
                          ? isFilled ?? true
                          ? style ??
                          Styles.black16MediumText
                              .copyWith(color: AppColors.white)
                          : style ?? Styles.black16MediumText
                          : Styles.black16MediumText
                          .copyWith(color: AppColors.white)),
                ),
            ),
    );
    }
}