import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/app/config/theme/theme.dart';
import 'app/core/services/service_api_binding.dart';
import 'app/config/routes/my_pages.dart';
import 'app/config/routes/my_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.main,
      defaultTransition: Transition.fade,
      theme: myTheme(),
      initialBinding: ApiServiceBinding(),
      getPages: MyPages.pages,
    );
  }
}
