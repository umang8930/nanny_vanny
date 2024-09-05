import 'package:flutter/services.dart';

class FieldValidation {
  FieldValidation._privateConstructor();
  static final TextInputFormatter phoneNumberValidation =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  static final TextInputFormatter nameValidation =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'));
  static final TextInputFormatter alphaNumValidation =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]'));
  static final TextInputFormatter alphaNumWithoutSpaceValidation =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]'));
  static final TextInputFormatter doubleDigitValidation =
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
}
