

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/controllers/auth_controller.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(height: 300,width: 300,
                  child: Image.network(AuthController.to.currentUser.image,)),
              RaisedButton(onPressed: (){
                AuthController.to.signOut();
              },child: Text("Log out"),)
            ],
          ),
        ),
      ),
    );
  }
}
