// To parse this JSON data, do
//
//     final dataMessageModel = dataMessageModelFromJson(jsonString);

import 'dart:convert';

DataMessageModel dataMessageModelFromJson(String str) => DataMessageModel.fromJson(json.decode(str));

String dataMessageModelToJson(DataMessageModel data) => json.encode(data.toJson());

class DataMessageModel {
  String? id;
  String? name;
  dynamic avatarFileId;
  String? type;
  String? status;
  MessageDetail? message;
  List<Viewer>? viewer;

  DataMessageModel({
    this.id,
    this.name,
    this.avatarFileId,
    this.type,
    this.status,
    this.message,
    this.viewer,
  });

  factory DataMessageModel.fromJson(Map<String, dynamic> json) => DataMessageModel(
        id: json["id"],
        name: json["name"],
        avatarFileId: json["avatarFileId"],
        type: json["type"],
        status: json["status"],
        message: json["message"] == null ? null : MessageDetail.fromJson(json["message"]),
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

class MessageDetail {
  List<ContentMessage>? content;
  int? page;
  int? size;
  int? totalPages;
  int? totalElements;

  MessageDetail({
    this.content,
    this.page,
    this.size,
    this.totalPages,
    this.totalElements,
  });

  factory MessageDetail.fromJson(Map<String, dynamic> json) => MessageDetail(
        content: json["content"] == null ? [] : List<ContentMessage>.from(json["content"]!.map((x) => ContentMessage.fromJson(x))),
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

class ContentMessage {
  String? id;
  int? createdTime;
  int? updatedTime;
  Sender? sender;
  String? type;
  String? content;
  final String? messageType;
  final String? messageStatus;
  final bool? isSender;
  List<FileElement>? files;
  String? isDeleted;
  dynamic parentMessage;

  ContentMessage(
      {this.id,
      this.createdTime,
      this.updatedTime,
      this.sender,
      this.type,
      this.content,
      this.files,
      this.isDeleted,
      this.parentMessage,
      this.isSender,
      this.messageStatus,
      this.messageType});

  factory ContentMessage.fromJson(Map<String, dynamic> json) => ContentMessage(
      id: json["id"],
      createdTime: json["createdTime"],
      updatedTime: json["updatedTime"],
      sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
      type: json["type"],
      content: json["content"],
      files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
      isDeleted: json["isDeleted"],
      parentMessage: json["parentMessage"],
      isSender: json['isSender'],
      messageStatus: json['messageStatus'],
      messageType: json['messageType']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdTime": createdTime,
        "updatedTime": updatedTime,
        "sender": sender?.toJson(),
        "type": type,
        "content": content,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "isDeleted": isDeleted,
        "parentMessage": parentMessage,
        "isSender": isSender,
        "messageStatus": messageStatus,
        "messageType": messageType
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

class Sender {
  String? id;
  String? avatarFileId;
  String? name;
  String? avatarUrl;

  Sender({this.id, this.avatarFileId, this.name, this.avatarUrl});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(id: json["id"], avatarFileId: json["avatarFileId"], name: json["name"], avatarUrl: json['avatarUrl']);

  Map<String, dynamic> toJson() => {"id": id, "avatarFileId": avatarFileId, "name": name, "avatarUrl": avatarUrl};
}

class Viewer {
  String? viewerId;
  String? avatarFileId;
  String? name;
  int? updatedTime;
  String? avatarUrl;

  Viewer({this.viewerId, this.avatarFileId, this.name, this.updatedTime, this.avatarUrl});

  factory Viewer.fromJson(Map<String, dynamic> json) =>
      Viewer(viewerId: json["viewerId"], avatarFileId: json["avatarFileId"], name: json["name"], updatedTime: json["updatedTime"], avatarUrl: json['avatarUrl']);

  Map<String, dynamic> toJson() => {"viewerId": viewerId, "avatarFileId": avatarFileId, "name": name, "updatedTime": updatedTime, "avatarUrl": avatarUrl};
}
