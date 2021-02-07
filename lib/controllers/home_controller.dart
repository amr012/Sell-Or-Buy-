
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controllers/base_controller.dart';
import 'package:my_ecommerce/screens/account_screen.dart';
import 'package:my_ecommerce/screens/cart_screen.dart';
import 'package:my_ecommerce/screens/explore_screen.dart';

class HomeController extends BaseController{
  RxInt _selectedIndex = 1.obs;
  Rx<Widget> _currentScreen = ExploreScreen().obs;

  int get selectedIndex => _selectedIndex.value;
   Widget get currentScreen => _currentScreen.value;

  changeSelectedIndex( int index){
    _selectedIndex.value = index;
    // if(index ==0 ){
    //   _currentScreen.value = AccountScreen();
    // }
    // else if(index ==1){
    //   _currentScreen.value = ExploreScreen();
    // }
    // else {
    //   _currentScreen.value = CartScreen();
    // }
    // switch(index){
    //   case 0 :
    //    _currentScreen.value = AccountScreen();
    //    break;
    //
    //   case 1 :
    //     _currentScreen.value = ExploreScreen();
    //     break;
    //
    //   case 2 :
    //     _currentScreen.value = CartScreen();
    //     break;
    // }
  }
}