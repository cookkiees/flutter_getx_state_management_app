import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes/my_pages.dart';
import '../controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/user',
        onGenerateRoute: MyPages.onGenerateRoute,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Obx _buildBottomNavigationBar() {
    return Obx(
      () => Theme(
        data: ThemeData(
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: const Color(0xFFF5F5F5),
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.autorenew),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Article',
            ),
          ],
        ),
      ),
    );
  }
}
