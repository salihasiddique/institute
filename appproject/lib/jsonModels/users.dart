// //in here we create the user json models
// // To parse this JSON data, do
// //
// import 'dart:convert';
//
// Users usersFromMap(String str) => Users.fromMap(json.decode(str));
//
// String usersToMap(Users data) => json.encode(data.toMap());
// class Users {
//   final int? usrId;
//   final String? email;
//   final String? phone;
//   final String usrName;
//   final String usrPassword;
//
//   Users({
//     this.usrId,
//     this.email,
//     this.phone,
//     required this.usrName,
//     required this.usrPassword,
//   });
// //these json value must be same as column name in database
//   factory Users.fromMap(Map<String, dynamic> json) => Users(
//     usrId: json["usrId"],
//     email:json["email"],
//     phone:json['phone'],
//     usrName: json["usrName"],
//     usrPassword: json["usrPassword"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "usrId": usrId,
//     "email":email,
//     "phone":phone,
//     "usrName": usrName,
//     "usrPassword": usrPassword,
//   };
// }
//
//
//

import 'dart:convert';

AuthModal authModalFromJson(String str) => AuthModal.fromJson(json.decode(str));

String authModalToJson(AuthModal data) => json.encode(data.toJson());

class AuthModal {
  int? usrId;
  String username;
  String password;
  String email;
  String phone;

  AuthModal({this.usrId, required this.username, required this.password,required this.email,required this.phone});

  factory AuthModal.fromJson(Map<String, dynamic> json) {
    return AuthModal(
      usrId: json['usrId'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phone: json['phone']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usrId': usrId,
      'username': username,
      'password': password,
      'email':email,
      'phone':phone
    };
  }
}