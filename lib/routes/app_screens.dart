import 'package:get/get.dart';
import 'package:my_ecommerce/routes/app_routes.dart';
import 'package:my_ecommerce/screens/home_screen.dart';
import 'package:my_ecommerce/screens/login_screen.dart';
import 'package:my_ecommerce/screens/sign_up_screen.dart';
import 'package:my_ecommerce/screens/welcome_screen.dart';

class AppScreens{

  static final screens = [
    GetPage(name: Routes.SIGN_UP_SCREEN,
        page: ()=>SignUpScreen()),

    GetPage(name: Routes.HOME_SCREEN,
        page:()=> HomeScreen()),

    GetPage(name: Routes.LOGIN_SCREEN,
        page: ()=>LoginScreen()),

    GetPage(name: Routes.WELCOME_SCREEN,
        page: ()=>WelcomeScreen())

  ];
}