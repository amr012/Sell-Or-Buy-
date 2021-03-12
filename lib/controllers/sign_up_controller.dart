import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_ecommerce/controllers/auth_controller.dart';
import 'package:my_ecommerce/controllers/base_controller.dart';
import 'package:my_ecommerce/models/user_model.dart';
import 'package:my_ecommerce/models/validation_item.dart';
import 'package:my_ecommerce/services/auth_services.dart';
import 'package:my_ecommerce/utilities/utility.dart';
import 'package:permission_handler/permission_handler.dart';

class SignUpController extends BaseController {
  AuthServices authServices = new AuthServices();

  final _name = ValidationItem().obs;
  final _email = ValidationItem().obs;
  final _password = ValidationItem().obs;
  final _image = Rx<String>();
  final _picker =ImagePicker();
  RxBool _saving = false.obs;

  ValidationItem get name => _name.value;

  ValidationItem get email => _email.value;

  ValidationItem get password => _password.value;

  String get image => _image.value;

  bool get saving => _saving.value;

  changeImage(String image) {
    _image.value = image;
  }

  chaneName(String name) {
    if (name.trim().length > 3) {
      _name.value = ValidationItem(value: name.trim());
    } else {
      _name.value =
          ValidationItem(error: "Name Should not be less than 3 letters ");
    }
  }

  changeEmail(String email) {
    if (email.trim().length > 3) {
      _email.value = ValidationItem(value: email.trim());
    } else {
      _email.value =
          ValidationItem(error: "Email Should not be less than 3 letters");
    }
  }

  changePassword(String password) {
    if (password.trim().length > 7) {
      _password.value = ValidationItem(value: password);
    } else {
      _password.value =
          ValidationItem(error: "Password Should not be less than 7 letters");
    }
  }

  registerValidation(BuildContext context) async {
    if (_name.value.isValid() &&
        _email.value.isValid() &&
        _password.value.isValid()
     && EmailValidator.validate(_email.value.value)) {
      _saving.value = true;
      UserModel user = await authServices.register(UserModel(
          image: _image.value,
          name: _name.value.value,
          email: _email.value.value,
          password: _password.value.value),image);
      _saving.value = false;
      AuthController.to.changeLoggedIn(true, user);
    } else {
      Utility.displayErrorAlert(
          "Please Check The Data You Have Entered!", "Data Error", context);
    }
  }

  Future<bool> requestImagePermission() async {
    final permission = await [
      Permission.storage,
      Permission.photos
    ].request();

    if(Platform.isIOS && permission[Permission.photos].isGranted){
      return true;
    }
    else if(Platform.isAndroid && permission[Permission.storage].isGranted){
      return true;
    }
    else{
      return false;
    }

  }

  getImage() async {
    final state = await requestImagePermission();
    if(state ){
      try{
        PickedFile pickedFile;
        pickedFile = await _picker.getImage(source: ImageSource.gallery);
        if(pickedFile != null) {
          _image.value = pickedFile.path;
        }

      }
      catch(e) {
        print(e.toString());
      }
    }
    else{
    print("Must Be Allow!");
    }


  }

}
