import 'package:get_storage/get_storage.dart';

class GetStorageBox {
  GetStorageBox._privateConstructor();

  static String profileImg = "profileImg";
  static String userNumber = "userNumber";
  static String userToken = "userToken";
  static String userData = "userData";
  static String customerIdForServiceProvider = "customerId";

  static writeStorage({required String key, required dynamic value}) {
    GetStorage().write(key, value);
  }

  static readStorage({dynamic key}) {
    return GetStorage().read(key);
  }

  static cleanAllStorage() async {
    await GetStorage().erase();
  }

  static String getToken() {
    return readStorage(key: GetStorageBox.userToken);
  }
}
