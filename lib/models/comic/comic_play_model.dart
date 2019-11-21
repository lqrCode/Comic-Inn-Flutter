class ComicPlayModel {
  List<String> images;

  ComicPlayModel({this.images});

  ComicPlayModel.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    return data;
  }
}
