import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/app/modules/araticle/presentation/pages/article_detail_screen.dart';

import '../../modules/araticle/domain/entities/article_data_entity.dart';
import '../../modules/araticle/presentation/controllers/article_binding.dart';
import '../../modules/araticle/presentation/pages/article_screen.dart';
import '../../modules/counter/controllers/counter_binding.dart';
import '../../modules/counter/pages/counter_screen.dart';
import '../../modules/main/controllers/main_binding.dart';
import '../../modules/main/pages/main_screen.dart';
import '../../modules/user/presentation/controllers/user_binding.dart';
import '../../modules/user/presentation/pages/user_screen.dart';
import 'my_routes.dart';

abstract class MyPages {
  static const main = MyRoutes.main;

  static final pages = [
    GetPage(
      name: MyRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: MyRoutes.articleDetail,
      page: () =>
          ArticleDetailScreen(article: Get.arguments as ArticleDataEntity),
      binding: ArticleBinding(),
    ),
  ];

  static Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == MyRoutes.user) {
      return GetPageRoute(
        settings: settings,
        routeName: MyRoutes.user,
        page: () => const UserScreen(),
        binding: UserBinding(),
        transition: Transition.noTransition,
      );
    }

    if (settings.name == MyRoutes.counter) {
      return GetPageRoute(
        settings: settings,
        routeName: MyRoutes.counter,
        page: () => const CounterScreen(),
        binding: CounterBinding(),
        bindings: [],
        transition: Transition.noTransition,
      );
    }

    if (settings.name == MyRoutes.article) {
      return GetPageRoute(
        settings: settings,
        routeName: MyRoutes.article,
        page: () => const ArticleScreen(),
        binding: ArticleBinding(),
        transition: Transition.noTransition,
      );
    }

    return null;
  }
}
