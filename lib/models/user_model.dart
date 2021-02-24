import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String password;
  String image;
  String key;

  UserModel({this.name, this.email, this.image, this.password,this.key});

  UserModel.fromJson(DocumentSnapshot snapshot){
    final json = snapshot.data();
    key = snapshot.id;
    name = json['name'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
  }
  Map<String,dynamic> toJson(){
    var json = <String,dynamic>{};
    json['name'] = name;
    json['email'] = email;
    json['password'] = password;
    json['image'] = image;

    return json;
  }


}
