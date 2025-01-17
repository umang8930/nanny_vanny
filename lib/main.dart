import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/app_bindings.dart';
import 'app/data/value/constants.dart';
import 'app/data/value/strings.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      navigatorKey: GlobalKeys.navigationKey,
      initialBinding: AppBinding(),
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.HOME_SCREEN,
    );
  }
}
