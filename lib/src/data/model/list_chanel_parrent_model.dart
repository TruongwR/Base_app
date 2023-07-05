// To parse this JSON data, do
//
//     final listChanelParrentModel = listChanelParrentModelFromJson(jsonString);

import 'dart:convert';

ListChanelParrentModel listChanelParrentModelFromJson(String str) => ListChanelParrentModel.fromJson(json.decode(str));

String listChanelParrentModelToJson(ListChanelParrentModel data) => json.encode(data.toJson());

class ListChanelParrentModel {
  List<Channel>? content;
  int? page;
  int? size;
  int? totalPages;
  int? totalElements;

  ListChanelParrentModel({
    this.content,
    this.page,
    this.size,
    this.totalPages,
    this.totalElements,
  });

  factory ListChanelParrentModel.fromJson(Map<String, dynamic> json) => ListChanelParrentModel(
        content: json["content"] == null ? [] : List<Channel>.from(json["content"]!.map((x) => Channel.fromJson(x))),
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

class Channel {
  String? id;
  String? name;
  String? avatarFileId;
  String? avatarUrl;

  String? type;
  String? status;
  LastMessage? lastMessage;
  String? friendId;
  String? friendStatus;

  Channel({
    this.id,
    this.name,
    this.avatarFileId,
    this.avatarUrl,
    this.type,
    this.status,
    this.lastMessage,
    this.friendId,
    this.friendStatus,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        name: json["name"],
        avatarFileId: json["avatarFileId"],
        avatarUrl: json["avatarUrl"],
        type: json["type"],
        status: json["status"],
        friendId: json["friendId"],
        friendStatus: json["friendStatus"],
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
      
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatarFileId": avatarFileId,
        "avatarUrl": avatarUrl,
        "type": type,
        "status": status,
        "lastMessage": lastMessage?.toJson(),
        "friendId": friendId,
        "friendStatus": friendStatus,
      };
}

class LastMessage {
  String? id;
  int? createdTime;
  int? updatedTime;
  Sender? sender;
  String? type;
  String? content;
  dynamic files;
  String? isDeleted;
  String? isWatched;

  LastMessage(
      {this.id,
      this.createdTime,
      this.updatedTime,
      this.sender,
      this.type,
      this.content,
      this.files,
      this.isDeleted,
      this.isWatched});

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
      id: json["id"],
      createdTime: json["createdTime"],
      updatedTime: json["updatedTime"],
      sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
      type: json["type"],
      content: json["content"],
      files: json["files"],
      isDeleted: json["isDeleted"],
      isWatched: json["isWatched"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdTime": createdTime,
        "updatedTime": updatedTime,
        "sender": sender?.toJson(),
        "type": type,
        "content": content,
        "files": files,
        "isDeleted": isDeleted,
        "isWatched": isWatched
      };
}

class Sender {
  String? id;
  String? avatarFileId;
  String? name;

  Sender({
    this.id,
    this.avatarFileId,
    this.name,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["id"],
        avatarFileId: json["avatarFileId"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatarFileId": avatarFileId,
        "name": name,
      };
}
