// To parse this JSON data, do
//
//     final paramMessageModel = paramMessageModelFromJson(jsonString);

import 'dart:convert';

List<ParamMessageModel> paramMessageModelFromJson(String str) => List<ParamMessageModel>.from(json.decode(str).map((x) => ParamMessageModel.fromJson(x)));

String paramMessageModelToJson(List<ParamMessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParamMessageModel {
    dynamic parentId;
    String? channelId;
    String? content;
    List<FileElement>? files;

    ParamMessageModel({
        this.parentId,
        this.channelId,
        this.content,
        this.files,
    });

    factory ParamMessageModel.fromJson(Map<String, dynamic> json) => ParamMessageModel(
        parentId: json["parentId"],
        channelId: json["channelId"],
        content: json["content"],
        files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "parentId": parentId,
        "channelId": channelId,
        "content": content,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
    };
}

class FileElement {
    String? id;
    String? name;
    String? contentType;
    int? size;
    String? url;
    String? access;

    FileElement({
        this.id,
        this.name,
        this.contentType,
        this.size,
        this.url,
        this.access,
    });

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        name: json["name"],
        contentType: json["contentType"],
        size: json["size"],
        url: json["url"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contentType": contentType,
        "size": size,
        "url": url,
        "access": access,
    };
}
