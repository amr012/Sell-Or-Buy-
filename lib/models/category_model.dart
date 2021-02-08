import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{

  String name;
  String image;

  CategoryModel({this.image,this.name});

  CategoryModel.fromJson(DocumentSnapshot snapshot){
     final json = snapshot.data();

     name  = json["name"];
     image = json["image"];

  }

  Map<String,dynamic> toJson(){
    var json = <String,dynamic>{};
    json["name"] = name;
    json["image"] = image;
    return json ;
  }

}