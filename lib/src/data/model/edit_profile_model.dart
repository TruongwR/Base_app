// To parse this JSON data, do
//
//     final editProfile = editProfileFromMap(jsonString);

import 'dart:convert';

EditProfile editProfileFromMap(String str) => EditProfile.fromMap(json.decode(str));

String editProfileToMap(EditProfile data) => json.encode(data.toMap());

class EditProfile {
  String? firstName;
  String? lastName;
  String? password;
  String? passwordOld;
  String? avatarFileId;

  EditProfile({
    this.firstName,
    this.lastName,
    this.password,
    this.passwordOld,
    this.avatarFileId,
  });

  EditProfile copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? passwordOld,
    String? avatarFileId,
  }) =>
      EditProfile(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        passwordOld: passwordOld ?? this.passwordOld,
        avatarFileId: avatarFileId ?? this.avatarFileId,
      );

  factory EditProfile.fromMap(Map<String, dynamic> json) => EditProfile(
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        passwordOld: json["passwordOld"],
        avatarFileId: json["avatarFileId"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "passwordOld": passwordOld,
        "avatarFileId": avatarFileId,
      };
}
