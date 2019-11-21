class ComicDetailModel {
  List<Chapter> chapter;
  List<Production> production;
  String title;
  String image;
  String author;
  String hot;
  String intro;
  AuthorInfo authorInfo;
  String authorNotice;

  ComicDetailModel({this.chapter, this.production, this.title, this.image, this.author, this.hot, this.intro, this.authorInfo, this.authorNotice});

  ComicDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['chapter'] != null) {
      chapter = new List<Chapter>();
      json['chapter'].forEach((v) {
        chapter.add(new Chapter.fromJson(v));
      });
    }
    if (json['production'] != null) {
      production = new List<Production>();
      json['production'].forEach((v) {
        production.add(new Production.fromJson(v));
      });
    }
    title = json['title'];
    image = json['image'];
    author = json['author'];
    hot = json['hot'];
    intro = json['intro'];
    authorInfo = json['author_info'] != null ? new AuthorInfo.fromJson(json['author_info']) : null;
    authorNotice = json['author_notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chapter != null) {
      data['chapter'] = this.chapter.map((v) => v.toJson()).toList();
    }
    if (this.production != null) {
      data['production'] = this.production.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['image'] = this.image;
    data['author'] = this.author;
    data['hot'] = this.hot;
    data['intro'] = this.intro;
    if (this.authorInfo != null) {
      data['author_info'] = this.authorInfo.toJson();
    }
    data['author_notice'] = this.authorNotice;
    return data;
  }
}

class Chapter {
  String id;
  String uptime;
  String name;
  List<String> lists = [];

  Chapter({this.id, this.uptime, this.name, this.lists});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uptime = json['uptime'];
    name = json['name'];
    lists = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uptime'] = this.uptime;
    data['name'] = this.name;
    return data;
  }
}

class Production {
  String image;
  String id;
  String chapter;
  String desc;
  String title;
  String score;

  Production({this.image, this.id, this.chapter, this.desc, this.title, this.score});

  Production.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    chapter = json['chapter'];
    desc = json['desc'];
    title = json['title'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['id'] = this.id;
    data['chapter'] = this.chapter;
    data['desc'] = this.desc;
    data['title'] = this.title;
    data['score'] = this.score;
    return data;
  }
}

class AuthorInfo {
  String avatar;
  String name;
  String fans;

  AuthorInfo({this.avatar, this.name, this.fans});

  AuthorInfo.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    fans = json['fans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['fans'] = this.fans;
    return data;
  }
}
