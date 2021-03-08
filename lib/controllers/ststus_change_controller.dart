import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/controllers/base_controller.dart';
import 'package:my_ecommerce/screens/status_change/finish_screen.dart';

class StatusChangeController extends BaseController{
  int _processIndex = 0;
  Pages _pages = Pages.DeliveryTime;

  Pages get pages => _pages;

  int get processIndex => _processIndex;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  getPage() {
    _processIndex++;
    if (_processIndex == 1) {
      _pages = Pages.AddAddress;
    } else if (_processIndex == 2) {
      _pages = Pages.Summary;
    } else if (_processIndex == 3) {
      Get.to(FinishScreen());
    }
    update();
  }

}