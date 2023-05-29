
import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    String? firstName;
    String? lastName;
    String? password;
    String? email;

    SignUpModel({
        this.firstName,
        this.lastName,
        this.password,
        this.email,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "email": email,
    };
}
