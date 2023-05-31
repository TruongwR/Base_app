// To parse this JSON data, do
//
//     final ResponeSignupModel = ResponeSignupModelfromJson(jsonString);

import 'dart:convert';

ResponeSignupModel responeSignupModelFromMap(String str) => ResponeSignupModel.fromJson(json.decode(str));

String responeSignupModeltoJson(ResponeSignupModel data) => json.encode(data.toJson());

class ResponeSignupModel {
  String? message;
  int? errorCode;
  bool? success;
  Data? data;

  ResponeSignupModel({
    this.message,
    this.errorCode,
    this.success,
    this.data,
  });

  factory ResponeSignupModel.fromJson(Map<String, dynamic> json) => ResponeSignupModel(
        message: json["message"],
        errorCode: json["errorCode"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errorCode": errorCode,
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  List<String>? firstName;
  List<String>? lastName;
  List<String>? password;
  List<String>? email;

  Data({
    this.firstName,
    this.lastName,
    this.password,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["firstName"] == null ? [] : List<String>.from(json["firstName"]!.map((x) => x)),
        lastName: json["lastName"] == null ? [] : List<String>.from(json["lastName"]!.map((x) => x)),
        password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
        email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? [] : List<dynamic>.from(firstName!.map((x) => x)),
        "lastName": lastName == null ? [] : List<dynamic>.from(lastName!.map((x) => x)),
        "password": password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
      };
}
