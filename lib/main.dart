import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controllers/auth_controller.dart';
import 'package:my_ecommerce/routes/app_routes.dart';
import 'package:my_ecommerce/routes/app_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WELCOME_SCREEN,
      getPages: AppScreens.screens,
    );
  }
}
