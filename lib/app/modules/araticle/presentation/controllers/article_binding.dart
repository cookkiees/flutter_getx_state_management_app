import 'package:get/get.dart';

import '../../data/repository/article_repository_impl.dart';
import 'article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleRepositoryImpl>(() => ArticleRepositoryImpl());
    Get.lazyPut<ArticleController>(() => ArticleController());
  }
}
