import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_ecommerce/components/custom_flat_button.dart';
import 'package:my_ecommerce/components/custom_social_button.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/components/custom_text_field.dart';
import 'package:my_ecommerce/components/text_from_field.dart';
import 'package:my_ecommerce/constants.dart';
import 'package:my_ecommerce/controllers/login_controller.dart';
import 'package:my_ecommerce/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Obx(() =>
            ModalProgressHUD(inAsyncCall: _controller.isSaving,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Welcome,",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.SIGN_UP_SCREEN);
                            },
                            child: CustomText(
                                text: "SignUp", fontSize: 22, color: K.MAIN_COLOR),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 40),
                        child: CustomText(
                          text: "Sign in to Continue",
                          fontSize: 16,
                          color: K.GREY_COLOR,
                        ),
                      ),
                      Obx(()=>CustomTextField(
                        text: "Email :",
                        label: "Enter Your Email",
                        type: TextInputType.emailAddress,
                        errorLabel: _controller.email.error,
                        onChanged: (v){
                          _controller.changeEmail(v);
                        },
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Obx(()=>CustomTextField(
                        text: "Password :",
                        label: "Enter Your Password",

                        isPassword: true,
                        type: TextInputType.visiblePassword,
                        errorLabel: _controller.password.error,
                        onChanged: (v){
                          _controller.changePassword(v);
                        },
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "Forget Password?",
                        fontSize: 15,
                        alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomFlatButton(
                        width: double.infinity,
                        text: "SIGN IN",
                        onPress: () {
                          _controller.loginValidation(context);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: "-OR-",
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButtonSocial(
                        image: "assets/images/facebook_icon.png",
                        text: "Sign In With Facebook",
                        onPress: () {
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButtonSocial(
                        image: "assets/images/google_icon.png",
                        text: "Sign In With Google       ",
                        onPress: () {

                        },
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
