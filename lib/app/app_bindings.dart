import 'package:get/get.dart';

import 'data/network/network_request.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put(NetworkRequester(), permanent: true);
  }
}
