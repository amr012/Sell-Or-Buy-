import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_ecommerce/controllers/auth_controller.dart';
import 'package:my_ecommerce/models/user_model.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = new FlutterSecureStorage();

  Future<UserModel> register(UserModel userModel , String image) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await addNewUSer(userModel , image);
    updateSecureStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> addNewUSer(UserModel userModel , String image) async {
    if(image != null && image.isNotEmpty){
     userModel.image = await uploadImage(image , "12345678");
    }

    final user = await _fireStore.collection("users").add(userModel.toJson());
    userModel.key = user.id;
    return userModel;
  }

  Future<String> uploadImage(String imagePath , String code) async {
    final ref =  FirebaseStorage.instance.ref().child("images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }


  Future<UserModel> login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      print(e.toString());
    }

    UserModel createdUser = await getUserByEmail(email,password);
    updateSecureStorage(createdUser);
    return createdUser;
  }
 

  updateSecureStorage(UserModel userModel) async {
    await _storage.write(key: "user", value: userModel.key);
  }

  Future<UserModel> getUserByEmail(String email, String password) async {
    final data = await _fireStore.collection("users").where("email" ,isEqualTo: email ).get();
    final data1 = await _fireStore.collection("users").where("password" ,isEqualTo: password ).get();
    if(data.docs.length > 0 && data1.docs.length >0){
      return UserModel.fromJson(data.docs.first);
    }
    throw "error at loading user ";

  }

  Future<UserModel> getCurrentUser() async {
    final userKey = await _storage.read(key: "user");
    if(userKey == null){
      return null;
    }
    else{
      return UserModel.fromJson(
          await _fireStore.collection("users").doc(userKey).get());
    }
  }


  signOut() async {
    await _auth.signOut();
    await _storage.delete(key: "user");
    AuthController.to.changeLoggedIn(false, null);
  }





}
