class FileResponseModel {
  FileResponseModel({
      this.success, 
      this.data,});

  FileResponseModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
    this.id,
    this.name,
    this.contentType,
    this.size,
    this.url,
    this.access,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    contentType = json['contentType'];
    size = json['size'];
    url = json['url'];
    access = json['access'];
  }
  String? id;
  String? name;
  String? contentType;
  int? size;
  String? url;
  String? access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['contentType'] = contentType;
    map['size'] = size;
    map['url'] = url;
    map['access'] = access;
    return map;
  }

}