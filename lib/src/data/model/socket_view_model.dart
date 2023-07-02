// To parse this JSON data, do
//
//     final socketViewModel = socketViewModelFromJson(jsonString);

import 'dart:convert';

SocketViewModel socketViewModelFromJson(String str) => SocketViewModel.fromJson(json.decode(str));

String socketViewModelToJson(SocketViewModel data) => json.encode(data.toJson());

class SocketViewModel {
    String? type;
    Channel? channel;
    Message? message;

    SocketViewModel({
        this.type,
        this.channel,
        this.message,
    });

    factory SocketViewModel.fromJson(Map<String, dynamic> json) => SocketViewModel(
        type: json["type"],
        channel: json["channel"] == null ? null : Channel.fromJson(json["channel"]),
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "channel": channel?.toJson(),
        "message": message?.toJson(),
    };
}

class Channel {
    String? id;
    String? name;
    String? avatarFileId;
    dynamic avatarUrl;
    String? type;

    Channel({
        this.id,
        this.name,
        this.avatarFileId,
        this.avatarUrl,
        this.type,
    });

    factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        name: json["name"],
        avatarFileId: json["avatarFileId"],
        avatarUrl: json["avatarUrl"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatarFileId": avatarFileId,
        "avatarUrl": avatarUrl,
        "type": type,
    };
}

class Message {
    String? id;
    int? createdTime;
    int? updatedTime;
    Channel? sender;
    String? type;
    String? content;
    dynamic files;
    String? isDeleted;
    dynamic parentMessage;

    Message({
        this.id,
        this.createdTime,
        this.updatedTime,
        this.sender,
        this.type,
        this.content,
        this.files,
        this.isDeleted,
        this.parentMessage,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        createdTime: json["createdTime"],
        updatedTime: json["updatedTime"],
        sender: json["sender"] == null ? null : Channel.fromJson(json["sender"]),
        type: json["type"],
        content: json["content"],
        files: json["files"],
        isDeleted: json["isDeleted"],
        parentMessage: json["parentMessage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdTime": createdTime,
        "updatedTime": updatedTime,
        "sender": sender?.toJson(),
        "type": type,
        "content": content,
        "files": files,
        "isDeleted": isDeleted,
        "parentMessage": parentMessage,
    };
}
