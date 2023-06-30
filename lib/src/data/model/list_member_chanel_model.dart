// To parse this JSON data, do
//
//     final ListMemberChanelModel = ListMemberChanelModelfromJson(jsonString);

import 'dart:convert';

ListMemberChanelModel listMemberChanelModelfromJson(String str) => ListMemberChanelModel.fromJson(json.decode(str));

String listMemberChanelModeltoJson(ListMemberChanelModel data) => json.encode(data.toJson());

class ListMemberChanelModel {
  List<Member>? content;
  int? page;
  int? size;
  int? totalPages;
  int? totalElements;

  ListMemberChanelModel({
    this.content,
    this.page,
    this.size,
    this.totalPages,
    this.totalElements,
  });

  factory ListMemberChanelModel.fromJson(Map<String, dynamic> json) => ListMemberChanelModel(
        content: json["content"] == null ? [] : List<Member>.from(json["content"]!.map((x) => Member.fromJson(x))),
        page: json["page"],
        size: json["size"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
        "page": page,
        "size": size,
        "totalPages": totalPages,
        "totalElements": totalElements,
      };
}

class Member {
  String? accountId;
  String? avatarFileId;
  String? status;
  String? nickname;
  String? isAdmin;

  Member({
    this.accountId,
    this.avatarFileId,
    this.status,
    this.nickname,
    this.isAdmin,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        accountId: json["accountId"],
        avatarFileId: json["avatarFileId"],
        status: json["status"],
        nickname: json["nickname"],
        isAdmin: json["isAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "avatarFileId": avatarFileId,
        "status": status,
        "nickname": nickname,
        "isAdmin": isAdmin,
      };
}
