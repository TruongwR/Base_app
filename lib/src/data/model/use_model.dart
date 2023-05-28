// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? sub;
    int? exp;
    String? iss;
    String? type;
    String? deviceId;
    Account? account;

    UserModel({
        this.sub,
        this.exp,
        this.iss,
        this.type,
        this.deviceId,
        this.account,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        sub: json["sub"],
        exp: json["exp"],
        iss: json["iss"],
        type: json["type"],
        deviceId: json["deviceId"],
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
    );

    Map<String, dynamic> toJson() => {
        "sub": sub,
        "exp": exp,
        "iss": iss,
        "type": type,
        "deviceId": deviceId,
        "account": account?.toJson(),
    };
}

class Account {
    String? id;
    String? email;
    String? firstName;
    String? lastName;
    String? avatarFileId;

    Account({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatarFileId,
    });

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatarFileId: json["avatarFileId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "avatarFileId": avatarFileId,
    };
}
