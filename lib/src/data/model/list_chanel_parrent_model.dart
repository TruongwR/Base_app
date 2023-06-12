// To parse this JSON data, do
//
//     final listChanelParrentModel = listChanelParrentModelFromJson(jsonString);

import 'dart:convert';

ListChanelParrentModel listChanelParrentModelFromJson(String str) => ListChanelParrentModel.fromJson(json.decode(str));

String listChanelParrentModelToJson(ListChanelParrentModel data) => json.encode(data.toJson());


class ListChanelParrentModel {
    List<Chanel>? content;
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
        content: json["content"] == null ? [] : List<Chanel>.from(json["content"]!.map((x) => Chanel.fromJson(x))),
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

class Chanel {
    String? id;
    String? name;
    dynamic avatarFileId;
    String? type;
    String? status;
    LastMessage? lastMessage;

    Chanel({
        this.id,
        this.name,
        this.avatarFileId,
        this.type,
        this.status,
        this.lastMessage,
    });

    factory Chanel.fromJson(Map<String, dynamic> json) => Chanel(
        id: json["id"],
        name: json["name"],
        avatarFileId: json["avatarFileId"],
        type: json["type"],
        status: json["status"],
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatarFileId": avatarFileId,
        "type": type,
        "status": status,
        "lastMessage": lastMessage?.toJson(),
    };
}

class LastMessage {
    String? id;
    int? createdDate;
    int? updatedDate;
    Sender? sender;
    String? type;
    String? content;
    dynamic files;
    String? isDeleted;

    LastMessage({
        this.id,
        this.createdDate,
        this.updatedDate,
        this.sender,
        this.type,
        this.content,
        this.files,
        this.isDeleted,
    });

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["id"],
        createdDate: json["createdDate"],
        updatedDate: json["updatedDate"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        type: json["type"],
        content: json["content"],
        files: json["files"],
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdDate": createdDate,
        "updatedDate": updatedDate,
        "sender": sender?.toJson(),
        "type": type,
        "content": content,
        "files": files,
        "isDeleted": isDeleted,
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
