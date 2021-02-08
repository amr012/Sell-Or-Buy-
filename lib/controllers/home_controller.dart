
import 'package:get/get.dart';
import 'package:my_ecommerce/controllers/base_controller.dart';

class HomeController extends BaseController{
  RxInt _selectedIndex = 1.obs;
  // Rx<Widget> _currentScreen = ExploreScreen().obs;

  int get selectedIndex => _selectedIndex.value;
   // Widget get currentScreen => _currentScreen.value;

  changeSelectedIndex( int index){
    _selectedIndex.value = index;

  }
}