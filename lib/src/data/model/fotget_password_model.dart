// // To parse this JSON data, do
// //
// //     final fotgetPasswordModel = fotgetPasswordModelfromJson(jsonString);
// import 'package:Whispers/src/data/model/use_model.dart';
// import 'dart:convert';

// FotgetPasswordModel fotgetPasswordModelfromJson(String str) => FotgetPasswordModel.fromJson(json.decode(str));

// String fotgetPasswordModeltoJson(FotgetPasswordModel data) => json.encode(data.toJson());

// class FotgetPasswordModel {
//   String? message;
//   bool? success;
//   Account? account;

//   FotgetPasswordModel({
//     this.message,
//     this.success,
//     this.account,
//   });

//   factory FotgetPasswordModel.fromJson(Map<String, dynamic> json) => FotgetPasswordModel(
//         message: json["message"],
//         success: json["success"],
//         account: json["data"] == null ? [] : List<Account>.from(json["data"]!.map((x) => Account.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "success": success,
//         "data": account == null ? [] : List<dynamic>.from(account!.map((x) => x.toJson())),
//       };
// }
