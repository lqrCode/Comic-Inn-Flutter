class LqrDialogSelectModel {
  List<LqrDialogSelectListsModel> lists = [];

  LqrDialogSelectModel({this.lists});

  LqrDialogSelectModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = new List<LqrDialogSelectListsModel>();
      json['lists'].forEach((v) {
        lists.add(new LqrDialogSelectListsModel.fromJson(v));
      });
    }
  }
}

class LqrDialogSelectListsModel {
  String name = '';
  String value = '';

  LqrDialogSelectListsModel({this.name = '', this.value = ''});

  LqrDialogSelectListsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }
}
