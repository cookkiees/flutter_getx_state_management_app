import 'package:get/get.dart';

import '../../../config/routes/my_routes.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    MyRoutes.user,
    MyRoutes.counter,
    MyRoutes.article,
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(
      pages[index],
      id: 1,
    );
  }
}
