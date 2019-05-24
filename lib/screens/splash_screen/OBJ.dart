import 'dart:convert';
class Comment {
  int id;
  int postId;
  String body;

  Comment.fromJsonMap(Map<String, dynamic> myJson):
  id = myJson["id"];

  Map<String, dynamic> toJson(){
    var myMap = new Map();

    myMap["id"] = id;

    return myMap;
  }

}
