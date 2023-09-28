import 'package:get/get.dart';

import 'service_api.dart';

class ApiServiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
