import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce/controllers/auth_controller.dart';
import 'package:my_ecommerce/models/user_model.dart';
import 'package:my_ecommerce/models/validation_item.dart';
import 'package:my_ecommerce/services/auth_services.dart';
import 'package:my_ecommerce/utilities/utility.dart';

class LoginController {
  AuthServices _authServices = new AuthServices();
  final _email = ValidationItem().obs;
  final _password = ValidationItem().obs;
  final _isSaving = false.obs;

  ValidationItem get email => _email.value;

  ValidationItem get password => _password.value;

  bool get isSaving => _isSaving.value;

  changeEmail(String email) {
    if (email.trim().length < 3) {
      _email.value =
          ValidationItem(error: "Email Should not be less than 3 letters! ");
    } else {
      _email.value = ValidationItem(value: email);
    }
  }

  changePassword(String password) {
    if (password.trim().length < 7) {
      _password.value =
          ValidationItem(error: "Password Should not be less than 7 letters");
    } else {
      _password.value = ValidationItem(value: password);
    }
  }

  loginValidation(BuildContext context) async {
    if (_email.value.isValid() &&
        _password.value.isValid() &&
        _email.value.value.isEmail) {
      _isSaving.value = true;
      UserModel user =
          await _authServices.login(_email.value.value, _password.value.value);
      _isSaving.value = false;
      AuthController.to.changeLoggedIn(true, user);
    } else {
      Utility.displayErrorAlert(
          "Please Check Your Email or Password !", "Login Error", context);
    }
  }
}
