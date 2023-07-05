// To parse this JSON data, do
//
//     final fotgetPasswordModel = fotgetPasswordModelFromJson(jsonString);

// FotgetPasswordModel fotgetPasswordModelfromJson(String str) => FotgetPasswordModel.fromJson(json.decode(str));

import 'dart:convert';

FotgetPasswordModel fotgetPasswordModelFromJson(String str) => FotgetPasswordModel.fromJson(json.decode(str));

String fotgetPasswordModelToJson(FotgetPasswordModel data) => json.encode(data.toJson());

class FotgetPasswordModel {
    bool? success;
    List<Person>? data;

    FotgetPasswordModel({
        this.success,
        this.data,
    });

    factory FotgetPasswordModel.fromJson(Map<String, dynamic> json) => FotgetPasswordModel(
        success: json["success"],
        data: json["data"] == null ? [] : List<Person>.from(json["data"]!.map((x) => Person.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Person {
    String? id;
    String? firstName;
    String? lastName;
    String? avatarFileId;
    String? avatarUrl;

    Person({
        this.id,
        this.firstName,
        this.lastName,
        this.avatarFileId,
        this.avatarUrl,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatarFileId: json["avatarFileId"],
        avatarUrl: json["avatarUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "avatarFileId": avatarFileId,
        "avatarUrl": avatarUrl,
    };
}
