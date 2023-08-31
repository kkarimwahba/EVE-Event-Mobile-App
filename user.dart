
import 'package:flutter/material.dart';
class User{
late int id;
late String firstName,lastName,username,email,password,type;
User({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.username,
  required this.email,
  required this.password,
  required this.type,
  });
factory User.fromMap(Map<String, dynamic> map) {
  return User(
    id:map['id'],
    firstName: map['firstName'],
    lastName: map['lastName'],
    username: map['username'],
    email: map['email'],
    password: map['password'],
    type: map['type'],
  );
}
@override
String toString() {
  return 'User(id:$id,firstName: $firstName, lastName: $lastName,username:$username,email:$email,password:$password,type:$type))';
}
}