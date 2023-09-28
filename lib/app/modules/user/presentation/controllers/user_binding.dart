import 'package:get/get.dart';
import '../../data/repository/user_repository_impl.dart';
import 'user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepositoryImpl>(() => UserRepositoryImpl());
    Get.lazyPut<UserController>(() => UserController());
  }
}
