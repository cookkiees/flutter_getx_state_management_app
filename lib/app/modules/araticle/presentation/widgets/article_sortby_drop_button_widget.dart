import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/article_controller.dart';

class ArticleSortByDropButtonWidget extends GetView<ArticleController> {
  const ArticleSortByDropButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        elevation: 1,
        dropdownColor: Colors.white,
        underline: const SizedBox.shrink(),
        value: controller.selectedSortBy.value.name,
        onChanged: (String? newValue) async {
          final sortBy = SortBy.values.firstWhere(
            (e) => e.name == newValue,
          );

          controller.selectedSortBy.value = sortBy;
          await controller.handleArticle(controller.selectedSortBy.value.name,
              controller.selectedQuery.value.name);
        },
        items: <String>[SortBy.popularity.name, SortBy.publishedAt.name]
            .map((String value) {
          final entri = capitalizeFirstLetter(value);
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              entri,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
