class LocalFileBean {
  String id;
  String fileName;
  String fileUrl;

  LocalFileBean({this.id, this.fileName, this.fileUrl});

  LocalFileBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}
class Autogenerated {
  String id;
  String fileName;
  String fileUrl;

  Autogenerated({this.id, this.fileName, this.fileUrl});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileName'] = this.fileName;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}

