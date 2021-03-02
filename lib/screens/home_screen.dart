import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controllers/home_controller.dart';
import 'package:my_ecommerce/screens/account_screen.dart';
import 'package:my_ecommerce/screens/cart_screen.dart';
import 'package:my_ecommerce/screens/explore_screen.dart';

class HomeScreen extends StatelessWidget {
  final _controller = Get.put(HomeController());
  final List screens = [AccountScreen(),ExploreScreen(),CartScreen()];
  @override
  Widget build(BuildContext context) {

    return Obx(
        ()=> Scaffold(
          bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: Colors.grey.shade50,
              currentIndex: _controller.selectedIndex,
              onTap: (index) {
                _controller.changeSelectedIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Image.asset(
                        "assets/images/user_icon1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Image.asset(
                        "assets/images/explore_icon1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SvgPicture.asset(
                        "assets/images/cart_icon_svg.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    label: "")
              ])),
          backgroundColor: Colors.white,
          body: screens[_controller.selectedIndex]

      ),
    );
  }
}
