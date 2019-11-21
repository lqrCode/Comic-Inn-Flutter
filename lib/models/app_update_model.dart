class AppUpdateModel {
  List<Lists> lists = [];

  AppUpdateModel({this.lists});

  AppUpdateModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<Lists>();
      json['lists'].forEach((v) {
        lists.add(new Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String version;
  String content;
  String file;
  int buildNumber;

  Lists({this.version, this.content, this.file, this.buildNumber});

  Lists.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    content = json['content'];
    file = json['file'];
    buildNumber = json['buildNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['content'] = this.content;
    data['file'] = this.file;
    data['buildNumber'] = this.buildNumber;
    return data;
  }
}
