// To parse this JSON data, do
//
//     final reponeModel = reponeModelFromJson(jsonString);

import 'dart:convert';

ReponeModel reponeModelFromJson(String str) => ReponeModel.fromJson(json.decode(str));

String reponeModelToJson(ReponeModel data) => json.encode(data.toJson());

class ReponeModel {
    String? message;
    int? errorCode;
    bool? success;
    Data? data;

    ReponeModel({
        this.message,
        this.errorCode,
        this.success,
        this.data,
    });

    factory ReponeModel.fromJson(Map<String, dynamic> json) => ReponeModel(
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
    List<String>? email;

    Data({
        this.email,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
    };
}
