import 'package:flutter/foundation.dart';

class TodoModel {
   int userlId;
   int id;
   String title;
   bool completed;

   TodoModel(  {required this.userlId, required this.id, required this.title, required this.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
    userlId : json['UserlId'],
     id : json['id'],
     title : json['title'],
    completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserlId'] = this.userlId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}