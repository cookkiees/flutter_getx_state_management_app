import 'package:get/get.dart';

import '../../../../core/helpers/my_app_logger.dart';
import '../../../../core/services/service_api_result_type.dart';
import '../../data/repository/article_repository_impl.dart';
import '../../domain/entities/article_data_entity.dart';

class ArticleController extends GetxController {
  ArticleRepositoryImpl articleRepositoryImpl =
      Get.find<ArticleRepositoryImpl>();

  RxBool isExpanded = false.obs;

  void onExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  @override
  void onInit() {
    handleArticle(selectedQuery.value.name, selectedSortBy.value.name);
    super.onInit();
  }

  RxBool isLoadingArticle = false.obs;
  Rx<Query> selectedQuery = Query.apple.obs;
  Rx<SortBy> selectedSortBy = SortBy.popularity.obs;
  List<ArticleDataEntity> articleList = [];

  Future<void> handleArticle(String? sortBy, String q) async {
    isLoadingArticle.value = true;
    try {
      final response = await articleRepositoryImpl.getArticle(sortBy, q);
      if (response.result == ApiResultType.success) {
        articleList = response.data?.articles as List<ArticleDataEntity>;
      } else {
        MyAppLogger.logError(response.message.toString());
      }
    } catch (e) {
      MyAppLogger.logError(e.toString());
    } finally {
      isLoadingArticle.value = false;
    }
  }

  Future<List<ArticleDataEntity>> handleArticleFuture(sortBy, q) async {
    try {
      final response = await articleRepositoryImpl.getArticle(sortBy, q);
      if (response.result == ApiResultType.success) {
        return response.data?.articles as List<ArticleDataEntity>;
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

enum SortBy { popularity, publishedAt }

enum Query { apple, tesla }

extension SortByName on SortBy {
  String get name {
    switch (this) {
      case SortBy.popularity:
        return 'popularity';
      case SortBy.publishedAt:
        return 'publishedAt';
      default:
        throw Exception('Invalid SortBy value');
    }
  }
}

extension QueryByName on Query {
  String get name {
    switch (this) {
      case Query.apple:
        return 'apple';
      case Query.tesla:
        return 'tesla';
      default:
        throw Exception('Invalid SortBy value');
    }
  }
}
