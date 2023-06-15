// To parse this JSON data, do
//
//     final listChanelParrentModel = listChanelParrentModelFromJson(jsonString);

import 'dart:convert';

DataMessage listChanelParrentModelFromJson(String str) => DataMessage.fromJson(json.decode(str));

String listChanelParrentModelToJson(DataMessage data) => json.encode(data.toJson());

class DataMessage {
  String? id;
  String? name;
  dynamic avatarFileId;
  String? type;
  String? status;
  Message? message;
  List<Viewer>? viewer;

  DataMessage({
    this.id,
    this.name,
    this.avatarFileId,
    this.type,
    this.status,
    this.message,
    this.viewer,
  });

  factory DataMessage.fromJson(Map<String, dynamic> json) => DataMessage(
        id: json["id"],
        name: json["name"],
        avatarFileId: json["avatarFileId"],
        type: json["type"],
        status: json["status"],
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        viewer: json["viewer"] == null ? [] : List<Viewer>.from(json["viewer"]!.map((x) => Viewer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatarFileId": avatarFileId,
        "type": type,
        "status": status,
        "message": message?.toJson(),
        "viewer": viewer == null ? [] : List<dynamic>.from(viewer!.map((x) => x.toJson())),
      };
}

class Message {
  List<Content>? content;
  int? page;
  int? size;
  int? totalPages;
  int? totalElements;

  Message({
    this.content,
    this.page,
    this.size,
    this.totalPages,
    this.totalElements,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
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

class Content {
  String? id;
  int? createdDate;
  int? updatedDate;
  Sender? sender;
  String? type;
  String? content;
  List<FileElement>? files;
  String? isDeleted;
  dynamic parentMessage;

  Content({
    this.id,
    this.createdDate,
    this.updatedDate,
    this.sender,
    this.type,
    this.content,
    this.files,
    this.isDeleted,
    this.parentMessage,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        createdDate: json["createdDate"],
        updatedDate: json["updatedDate"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        type: json["type"],
        content: json["content"],
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
        isDeleted: json["isDeleted"],
        parentMessage: json["parentMessage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdDate": createdDate,
        "updatedDate": updatedDate,
        "sender": sender?.toJson(),
        "type": type,
        "content": content,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "isDeleted": isDeleted,
        "parentMessage": parentMessage,
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

class FileElement {
  String? id;
  String? name;
  String? contentType;
  String? size;
  String? access;

  FileElement({
    this.id,
    this.name,
    this.contentType,
    this.size,
    this.access,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        name: json["name"],
        contentType: json["contentType"],
        size: json["size"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contentType": contentType,
        "size": size,
        "access": access,
      };
}

class Viewer {
  String viewerId;
  String avatarFileId;
  String name;
  int updatedTime;

  Viewer({
    required this.viewerId,
    required this.avatarFileId,
    required this.name,
    required this.updatedTime,
  });

  factory Viewer.fromJson(Map<String, dynamic> json) => Viewer(
        viewerId: json["viewerId"],
        avatarFileId: json["avatarFileId"],
        name: json["name"],
        updatedTime: json["updatedTime"],
      );

  Map<String, dynamic> toJson() => {
        "viewerId": viewerId,
        "avatarFileId": avatarFileId,
        "name": name,
        "updatedTime": updatedTime,
      };
}
