// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:get/get.dart';
// import 'package:nanny_vanny/app/data/value/dimens.dart';
// import 'package:nanny_vanny/app/theme/app_color.dart';
// import 'package:nanny_vanny/app/theme/styles.dart';
// import 'package:nanny_vanny/utils/helper/text_field_wrapper.dart';
//
//
// class TypeAheadTextField extends StatelessWidget {
//   final Function(String) onSelect;
//   final List<String> nameList;
//   final String hintText;
//   final String? title;
//   final double? height;
//   final int? maxLength;
//   final int? maxLine;
//   final TextInputType inputType;
//   final TextFieldWrapper wrapper;
//   final bool isEnabled;
//   final Color? fieldColor;
//   final bool obscureText;
//   final bool readOnly;
//   final Widget? suffixIcon;
//   final Widget? prefixWidget;
//   final Widget? suffixWidget;
//   final Widget? prefixIcon;
//   final EdgeInsetsGeometry? contentPadding;
//   final TextInputAction? textInputAction;
//   final List<TextInputFormatter>? inputFormatters;
//   final Function(String)? onChanged;
//   final Function()? onTap;
//   final validator;
//   final Color? borderColor;
//   final double? borderRadius;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextStyle? titleStyle;
//
//   const TypeAheadTextField({
//     super.key,
//     required this.onSelect,
//     required this.wrapper,
//     this.hintText = '',
//     this.title,
//     this.readOnly = false,
//     this.maxLength,
//     this.fieldColor,
//     this.maxLine = 1,
//     this.height,
//     this.inputType = TextInputType.text,
//     this.isEnabled = true,
//     this.obscureText = false,
//     this.suffixIcon,
//     this.prefixWidget,
//     this.suffixWidget,
//     this.contentPadding,
//     this.textInputAction,
//     this.validator,
//     this.inputFormatters,
//     this.onChanged,
//     this.onTap,
//     this.prefixIcon,
//     this.borderColor,
//     this.borderRadius,
//     this.hintStyle,
//     this.textStyle,
//     this.titleStyle,
//     required this.nameList,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     log("message---- nameList : $nameList");
//     return Obx(
//       () => TypeAheadField<String>(
//         emptyBuilder: (context) {
//           return const SizedBox.shrink();
//         },
//         controller: wrapper.controller,
//         suggestionsCallback: (search) => List.from(nameList.where((element) =>
//             element.toLowerCase().contains(search.trim().toLowerCase()))),
//         builder: (context, controller, focusNode) {
//           return Obx(
//             () => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (title != null && title!.isNotEmpty)
//                   // label(
//                   //     text: title!,
//                   //     style: titleStyle ?? Styles.tsBlueBoldText16),
//                 Dimens.heightGap5,
//                 SizedBox(
//                   height: height,
//                   child: TextFormField(
//                     maxLines: maxLine,
//                     onChanged: onChanged,
//                     readOnly: readOnly,
//                     controller: controller,
//                     maxLength: maxLength,
//                     keyboardType: inputType,
//                     enabled: isEnabled,
//                     obscureText: obscureText,
//                     textInputAction: textInputAction,
//                     validator: validator,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     inputFormatters: inputFormatters ?? [],
//                     focusNode: focusNode,
//                     onTap: onTap ?? () {},
//                     // style: textStyle ??
//                     //     Styles.tsBaseMedium14.copyWith(color: AppColors.black),
//                     // cursorColor: cursorColor,
//                     // cursorHeight: 20,
//                     decoration: InputDecoration(
//                       // prefixIcon: prefixIcon ?? SizedBox.shrink(),
//                       alignLabelWithHint: true,
//                       errorStyle:
//                           const TextStyle(color: AppColors.secondaryColor),
//                       // hintStyle: hintStyle ?? Styles.tsGreyMedium16,
//                       hintMaxLines: maxLine,
//                       errorMaxLines: null,
//                       isDense: true,
//                       errorText:
//                           wrapper.errorText.isEmpty ? null : wrapper.errorText,
//                       counterText: '',
//                       fillColor: fieldColor ?? AppColors.blueFieldColor,
//                       filled: true,
//                       hintText: hintText,
//                       // floatingLabelStyle: Styles.tsBlackMedium16
//                       //     .copyWith(color: AppColors.baseColor),
//                       enabled: isEnabled,
//                       suffixIcon: suffixIcon,
//                       prefixIcon: prefixIcon,
//                       prefix: prefixWidget,
//                       suffix: suffixWidget,
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: borderColor == null
//                             ? BorderSide.none
//                             : BorderSide(
//                                 color: borderColor ?? AppColors.borderColor,
//                               ),
//                         borderRadius:
//                             BorderRadius.circular(borderRadius ?? 6.0),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: borderColor == null
//                             ? BorderSide.none
//                             : BorderSide(
//                                 color: borderColor ?? AppColors.borderColor,
//                               ),
//                         borderRadius:
//                             BorderRadius.circular(borderRadius ?? 6.0),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderSide: borderColor == null
//                             ? BorderSide.none
//                             : BorderSide(
//                                 color: borderColor ?? AppColors.borderColor,
//                               ),
//                         borderRadius:
//                             BorderRadius.circular(borderRadius ?? 6.0),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: borderColor == null
//                             ? BorderSide.none
//                             : BorderSide(
//                                 color: borderColor ?? AppColors.borderColor,
//                               ),
//                         borderRadius:
//                             BorderRadius.circular(borderRadius ?? 6.0),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: borderColor == null
//                             ? BorderSide.none
//                             : BorderSide(
//                                 color: borderColor ?? AppColors.borderColor,
//                               ),
//                         borderRadius:
//                             BorderRadius.circular(borderRadius ?? 6.0),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: borderColor == null
//                             ? BorderSide.none
//                             : BorderSide(
//                                 color: borderColor ?? AppColors.borderColor,
//                               ),
//                         borderRadius:
//                             BorderRadius.circular(borderRadius ?? 6.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         itemBuilder: (context, name) {
//           return Container(
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Dimens.heightGap5,
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
//                   child: Text(
//                     name,
//                     textAlign: TextAlign.left,
//                     // style: Styles.tsBlackMedium14,
//                   ),
//                 ),
//                 Container(
//                   color: AppColors.blueFieldColor,
//                   height: 2,
//                   width: double.infinity,
//                 )
//               ],
//             ),
//           );
//         },
//         onSelected: (city) {
//           onSelect(city);
//         },
//       ),
//     );
//   }
// }
//
// /*
//
// //test
//     TestAhead(
//                         title: "Type of Policy",
//                         titleStyle: Styles.tsBaseMedium16
//                             .copyWith(color: AppColors.blueTextColor),
//                         suffixIcon:
//                             const Icon(Icons.keyboard_arrow_down_outlined),
//                         hintText: "Term insurance",
//                         hintStyle: Styles.tsBlackMedium16
//                             .copyWith(color: AppColors.greyTextColor),
//                         validator: mandatoryValidator,
//                         onSelect: (String v) {
//                           // controller.onSelectedPolicy(v);
//                         },
//                         controller: TextEditingController(),
//                         products: controller.products,
//                         settings: FieldSettings(),
//                         obscureText: false,
//                         readOnly: false,
//                       ),
//
// typedef ProductController = ValueNotifier<List<String>>;
//
// mixin SharedExampleTypeAheadConfig {
//   FieldSettings get settings;
//
//   ProductController get products;
//
//   TextEditingController get controller;
//
//   final String hintText = 'What are you looking for?';
//   final BorderRadius borderRadius = BorderRadius.circular(10);
//
//   void onSuggestionSelected(String val) {
//     // products.value = Map.of(
//     //   products.value
//     //     ..update(
//     //       product,
//     //           (value) => value + 1,
//     //       ifAbsent: () => 1,
//     //     ),
//     // );
//     // controller.clear();
//   }
//
//   Future<List<String>> suggestionsCallback(String pattern) async =>
//       Future<List<String>>.delayed(
//         Duration(milliseconds: settings.loadingDelay.value ? 300 : 0),
//         () => products.value.where((name) {
//           final nameLower = name.toLowerCase().split(' ').join('');
//           final patternLower = pattern.toLowerCase().split(' ').join('');
//           return nameLower.contains(patternLower);
//         }).toList(),
//       );
//
//   Widget itemSeparatorBuilder(BuildContext context, int index) =>
//       settings.dividers.value
//           ? const Divider(height: 1)
//           : const SizedBox.shrink();
//
//   List<Widget> maybeReversed(List<Widget> children) {
//     if (settings.direction.value == VerticalDirection.up) {
//       return children.reversed.toList();
//     }
//     return children;
//   }
//
//   Widget gridLayoutBuilder(
//     BuildContext context,
//     List<Widget> items,
//   ) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       itemCount: items.length,
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 400,
//         mainAxisExtent: 58,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//       ),
//       reverse: SuggestionsController.of<String>(context).effectiveDirection ==
//           VerticalDirection.up,
//       itemBuilder: (context, index) => items[index],
//     );
//   }
//
//   Duration get debounceDuration => settings.debounce.value
//       ? const Duration(milliseconds: 300)
//       : Duration.zero;
// }
//
// class TestAhead extends StatelessWidget with SharedExampleTypeAheadConfig {
//   final Function(String) onSelect;
//   final String hintText;
//   final String? title;
//   final double? height;
//   final int? maxLength;
//   final int? maxLine;
//   final Color? fieldColor;
//   final bool obscureText;
//   final bool readOnly;
//   final Widget? suffixIcon;
//   final Widget? prefixWidget;
//   final Widget? suffixWidget;
//   final Widget? prefixIcon;
//   final EdgeInsetsGeometry? contentPadding;
//   final TextInputAction? textInputAction;
//   final List<TextInputFormatter>? inputFormatters;
//   final Function(String)? onChanged;
//   final Function()? onTap;
//   final validator;
//   final Color? borderColor;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextStyle? titleStyle;
//
//   TestAhead(
//       {super.key,
//       required this.controller,
//       required this.products,
//       required this.settings,
//       required this.onSelect,
//       required this.hintText,
//       this.title,
//       this.height,
//       this.maxLength,
//       this.maxLine,
//       this.fieldColor,
//       required this.obscureText,
//       required this.readOnly,
//       this.suffixIcon,
//       this.prefixWidget,
//       this.suffixWidget,
//       this.prefixIcon,
//       this.contentPadding,
//       this.textInputAction,
//       this.inputFormatters,
//       this.onChanged,
//       this.onTap,
//       this.validator,
//       this.borderColor,
//       this.hintStyle,
//       this.textStyle,
//       this.titleStyle});
//
//   @override
//   final TextEditingController controller;
//   @override
//   final ProductController products;
//   @override
//   final FieldSettings settings;
//
//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField(
//       controller: controller,
//       builder: (context, controller, focusNode) {
//         return Obx(
//           () => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (title != null && title!.isNotEmpty)
//                 label(
//                     text: title!, style: titleStyle ?? Styles.tsBlueBoldText16),
//               Dimens.heightGap5,
//               SizedBox(
//                 height: height,
//                 child: TextFormField(
//                   maxLines: maxLine,
//                   onChanged: onChanged,
//                   readOnly: readOnly,
//                   controller: controller,
//                   maxLength: maxLength,
//                   keyboardType: TextInputType.name,
//                   obscureText: obscureText,
//                   textInputAction: textInputAction,
//                   validator: validator,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   inputFormatters: inputFormatters ?? [],
//                   focusNode: focusNode,
//                   onTap: onTap ?? () {},
//                   style: textStyle ??
//                       Styles.tsBaseMedium14.copyWith(color: AppColors.black),
//                   // cursorColor: cursorColor,
//                   // cursorHeight: 20,
//                   decoration: InputDecoration(
//                     // prefixIcon: prefixIcon ?? SizedBox.shrink(),
//                     alignLabelWithHint: true,
//                     errorStyle:
//                         const TextStyle(color: AppColors.secondaryColor),
//                     hintStyle: hintStyle ?? Styles.tsGreyMedium16,
//                     hintMaxLines: maxLine,
//                     errorMaxLines: null,
//                     isDense: true,
//                     errorText: null,
//                     counterText: '',
//                     fillColor: fieldColor ??
//                         AppColors
//                             .blueFieldColor */
// /*fieldColor ?? AppColors.white*/ /*
// ,
//                     filled: true,
//                     hintText: hintText,
//                     floatingLabelStyle: Styles.tsBlackMedium16
//                         .copyWith(color: AppColors.baseColor),
//                     suffixIcon: suffixIcon,
//                     prefixIcon: prefixIcon,
//                     prefix: prefixWidget,
//                     suffix: suffixWidget,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: borderColor == null
//                           ? BorderSide.none
//                           : BorderSide(
//                               color: borderColor ?? AppColors.borderColor,
//                             ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: borderColor == null
//                           ? BorderSide.none
//                           : BorderSide(
//                               color: borderColor ?? AppColors.borderColor,
//                             ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     disabledBorder: OutlineInputBorder(
//                       borderSide: borderColor == null
//                           ? BorderSide.none
//                           : BorderSide(
//                               color: borderColor ?? AppColors.borderColor,
//                             ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: borderColor == null
//                           ? BorderSide.none
//                           : BorderSide(
//                               color: borderColor ?? AppColors.borderColor,
//                             ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: borderColor == null
//                           ? BorderSide.none
//                           : BorderSide(
//                               color: borderColor ?? AppColors.borderColor,
//                             ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: borderColor == null
//                           ? BorderSide.none
//                           : BorderSide(
//                               color: borderColor ?? AppColors.borderColor,
//                             ),
//                       borderRadius: BorderRadius.circular(6.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       decorationBuilder: (context, child) => Material(
//         type: MaterialType.card,
//         elevation: 4,
//         borderRadius: borderRadius,
//         child: child,
//       ),
//       itemBuilder: (context, product) => Text(product),
//       */
// /*     debounceDuration: debounceDuration,
//                         hideOnSelect: settings.hideOnSelect.value,
//                         hideOnUnfocus: settings.hideOnUnfocus.value,
//                         hideWithKeyboard: settings.hideOnUnfocus.value,
//                         retainOnLoading: settings.retainOnLoading.value,*/ /*
//
//       onSelected: onSuggestionSelected,
//       suggestionsCallback: suggestionsCallback,
//       itemSeparatorBuilder: itemSeparatorBuilder,
//       listBuilder: settings.gridLayout.value ? gridLayoutBuilder : null,
//     );
//   }
// }
//
//
// // todo option
// abstract class FieldOption<T> extends ValueNotifier<T> {
//   FieldOption({
//     required this.key,
//     required this.title,
//     required T value,
//     this.icon,
//   }) : super(value);
//
//   /// The name of the property on the TypeAheadField class that this setting
//   /// corresponds to, if any.
//   final String key;
//   final String title;
//   final IconData? icon;
//
//   FutureOr<void> change();
// }
//
// class ToggleFieldOption extends FieldOption<bool> {
//   ToggleFieldOption({
//     required super.key,
//     required super.title,
//     super.icon,
//     this.iconFalse,
//     required super.value,
//   });
//
//   final IconData? iconFalse;
//
//   @override
//   FutureOr<void> change() => value = !value;
// }
//
// class ChoiceFieldOption<T> extends FieldOption<T> {
//   ChoiceFieldOption({
//     required super.key,
//     required super.title,
//     super.icon,
//     required super.value,
//     required this.choices,
//   });
//
//   final List<T> choices;
//
//   @override
//   FutureOr<void> change() {
//     final index = choices.indexOf(value);
//     value = choices[(index + 1) % choices.length];
//   }
// }
//
// class FieldSettings extends ChangeNotifier {
//   FieldSettings() {
//     for (final setting in values) {
//       setting.addListener(notifyListeners);
//     }
//   }
//
//   @override
//   void dispose() {
//     for (final setting in values) {
//       setting.removeListener(notifyListeners);
//     }
//     super.dispose();
//   }
//
//   List<FieldOption> get values => [
//         cupertino,
//         darkMode,
//         direction,
//         gridLayout,
//         dividers,
//         loadingDelay,
//         retainOnLoading,
//         debounce,
//         hideOnSelect,
//         hideOnUnfocus,
//       ];
//
//   List<FieldOption> search(String pattern) {
//     return values.where(
//       (setting) {
//         String title = setting.title.toLowerCase().split(' ').join('');
//         String search = pattern.toLowerCase().split(' ').join('');
//         return title.contains(search);
//       },
//     ).toList();
//   }
//
//   final ToggleFieldOption cupertino = ToggleFieldOption(
//     key: 'cupertino',
//     title: 'Cupertino',
//     value: !kIsWeb && Platform.isIOS,
//     icon: CupertinoIcons.device_phone_portrait,
//     iconFalse: Icons.phone_android,
//   );
//
//   final ToggleFieldOption darkMode = ToggleFieldOption(
//     key: 'darkMode',
//     title: 'Dark Mode',
//     value: SchedulerBinding.instance.platformDispatcher.platformBrightness ==
//         Brightness.dark,
//     icon: Icons.dark_mode,
//     iconFalse: Icons.light_mode,
//   );
//
//   final ChoiceFieldOption<VerticalDirection> direction = ChoiceFieldOption(
//     key: 'direction',
//     title: 'Direction',
//     value: VerticalDirection.down,
//     icon: Icons.swap_vert,
//     choices: [
//       VerticalDirection.up,
//       VerticalDirection.down,
//     ],
//   );
//
//   final ToggleFieldOption gridLayout = ToggleFieldOption(
//     key: 'gridLayout',
//     title: 'Grid Layout',
//     value: false,
//     icon: Icons.grid_on,
//   );
//
//   final ToggleFieldOption dividers = ToggleFieldOption(
//     key: 'dividers',
//     title: 'Dividers',
//     value: true,
//     icon: Icons.border_clear,
//   );
//
//   final ToggleFieldOption loadingDelay = ToggleFieldOption(
//     key: 'loadingDelay',
//     title: 'Loading Delay',
//     value: true,
//     icon: Icons.timer,
//   );
//
//   final ToggleFieldOption retainOnLoading = ToggleFieldOption(
//     key: 'retainOnLoading',
//     title: 'Retain on Loading',
//     value: true,
//     icon: Icons.cached,
//   );
//
//   final ToggleFieldOption debounce = ToggleFieldOption(
//     key: 'debounce',
//     title: 'Debounce',
//     value: true,
//     icon: Icons.input,
//   );
//
//   final ToggleFieldOption hideOnSelect = ToggleFieldOption(
//     key: 'hideOnSelect',
//     title: 'Hide on Select',
//     value: true,
//     icon: Icons.fingerprint,
//   );
//
//   final ToggleFieldOption hideOnUnfocus = ToggleFieldOption(
//     key: 'hideOnUnfocus',
//     title: 'Hide on Unfocus',
//     value: true,
//     icon: Icons.visibility_off,
//   );
// }
// */
