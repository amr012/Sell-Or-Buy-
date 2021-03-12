import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/custom_list_tile.dart';
import 'package:my_ecommerce/components/custom_network_image.dart';
import 'package:my_ecommerce/components/custom_text.dart';
import 'package:my_ecommerce/controllers/auth_controller.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80)
                  ),
                  height: 130,
                  width:  130,
                  child: AuthController.to.currentUser.image != null
                      ? CustomNetworkImage(
                    netwokImage: AuthController.to.currentUser.image,
                    errorImage: "assets/images/image_placeholder.png")
                      : Image.asset("assets/images/image_placeholder.png")

                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(AuthController.to.currentUser.name,maxLines: 3,
                    maxFontSize: 24,minFontSize: 20,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    CustomText(text: AuthController.to.currentUser.email,
                    fontSize: 16,)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          CustomListTile(
            iconImage: "assets/images/icon_edit_profile.png",
            text: "Edit Profile",
            onPress: (){},
          ),
          SizedBox(height: 12,),
          CustomListTile(
            iconImage: "assets/images/Icon_Location.png",
            text: "Shipping Address",
            onPress: (){},
          ),
          SizedBox(height: 12,),
          CustomListTile(
            iconImage: "assets/images/Icon_History.png",
            text: "Order History",
            onPress: (){},
          ),
          SizedBox(height: 12,),
          CustomListTile(
            iconImage: "assets/images/Icon_Payment.png",
            text: "Cards",
            onPress: (){},
          ),
          SizedBox(height: 12,),
          CustomListTile(
            iconImage: "assets/images/Icon_Alert.png",
            text: "Notifications",
            onPress: (){},
          ),
          SizedBox(height: 12,),
          CustomListTile(
            iconImage: "assets/images/Icon_Exit.png",
            text: "Log Out",
            onPress: (){
              AuthController.to.signOut();
            },
          ),
        ],
      )
    );
  }
}
