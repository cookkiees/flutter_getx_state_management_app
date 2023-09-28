import 'package:get/get.dart';
import 'package:getx_state_management/app/core/helpers/my_app_logger.dart';

import '../../../../core/services/service_api_result_type.dart';
import '../../data/repository/user_repository_impl.dart';
import '../../domain/entities/user_base_entity.dart';

class UserController extends GetxController {
  UserRepositoryImpl userRepositoryImpl = Get.find<UserRepositoryImpl>();

  @override
  void onInit() {
    initialUser();
    super.onInit();
  }

  RxBool isLoadingUser = false.obs;

  List<UserBaseEntity> userList = [];

  Future<void> initialUser() async {
    isLoadingUser.value = true;
    await handleUser();
  }

  Future<void> refreshUser() async {
    await handleUser();
  }

  Future<void> handleUser() async {
    try {
      final response = await userRepositoryImpl.getUser();
      if (response.result == ApiResultType.success) {
        userList = response.data as List<UserBaseEntity>;
      } else {
        MyAppLogger.logError(response.message.toString());
      }
    } catch (e) {
      MyAppLogger.logError(e.toString());
    } finally {
      isLoadingUser.value = false;
    }
  }

  Future<List<UserBaseEntity>> handleUserFuture() async {
    try {
      final response = await userRepositoryImpl.getUser();
      if (response.result == ApiResultType.success) {
        return response.data as List<UserBaseEntity>;
      } else {
        MyAppLogger.logError(response.message.toString());
        return [];
      }
    } catch (e) {
      MyAppLogger.logError(e.toString());
      return [];
    }
  }
}
