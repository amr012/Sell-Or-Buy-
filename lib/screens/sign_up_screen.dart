
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_ecommerce/components/custom_flat_button.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/components/custom_text_field.dart';
import 'package:my_ecommerce/controllers/sign_up_controller.dart';
import 'package:my_ecommerce/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.off(LoginScreen());
              }),
        ),
        body: Obx(() => ModalProgressHUD(
            inAsyncCall: _controller.saving,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Sign Up,",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => CustomTextField(
                      text: "Name",
                      label: 'meroo',
                      onChanged: (v) {
                        _controller.chaneName(v);
                      },
                      errorLabel: _controller.name.error,
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(() => CustomTextField(
                      text: "Email",
                      label: 'amr@gmail.com',
                      onChanged: (v) {
                         _controller.changeEmail(v);
                      },
                       errorLabel: _controller.email.error,
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(() => CustomTextField(
                      text: "Password",
                      label: '**********',
                      onChanged: (v) {
                        _controller.changePassword(v);
                      },
                      errorLabel: _controller.password.error,
                    )),
                    SizedBox(
                      height: 60,
                    ),
                    CustomFlatButton(
                      width: double.infinity,
                      text: "SIGN UP",
                      onPress: () {
                        _controller.registerValidation(context);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ))));
  }
}
