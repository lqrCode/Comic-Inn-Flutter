class LqrTreeModel {
  List<LqrTreeListsModel> lists;

  LqrTreeModel({this.lists});

  LqrTreeModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<LqrTreeListsModel>();
      json['lists'].forEach((v) {
        lists.add(new LqrTreeListsModel.fromJson(v));
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

class LqrTreeListsModel {
  String name;
  String value;
  bool enabled;
  bool isSelect;
  bool isShow;
  Map<String, dynamic> info;
  int key;
  List<LqrTreeListsModel> children = [];
  List<LqrTreeListsModel> lists = [];

  LqrTreeListsModel({this.name = '', this.value = '', this.children, this.enabled, this.isShow, this.info, this.key, this.lists});

  LqrTreeListsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    enabled = json['enabled'] != null ? json['enabled'] : false;
    isSelect = json['isSelect'] != null ? json['isSelect'] : false;
    isShow = json['isShow'] != null ? json['isShow'] : false;
    info = json['info'] != null ? json['info'] : {};
    key = json['key'] != null ? json['key'] : 0;
    if (json['children'] != null) {
      children = new List<LqrTreeListsModel>();
      json['children'].forEach((v) {
        children.add(new LqrTreeListsModel.fromJson(v));
      });
    }
    if (json['lists'] != null) {
      lists = new List<LqrTreeListsModel>();
      json['lists'].forEach((v) {
        lists.add(new LqrTreeListsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['enabled'] = this.enabled;
    data['isSelect'] = this.isSelect;
    data['isShow'] = this.isShow;
    data['info'] = this.info;
    data['key'] = this.key;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
