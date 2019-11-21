class ComicHomeModel {
  List<Banner> banner;
  List<Floor> floor;
  List<Rank> rank;

  ComicHomeModel({this.banner, this.floor, this.rank});

  ComicHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = new List<Banner>();
      json['banner'].forEach((v) {
        banner.add(new Banner.fromJson(v));
      });
    }
    if (json['floor'] != null) {
      floor = new List<Floor>();
      json['floor'].forEach((v) {
        floor.add(new Floor.fromJson(v));
      });
    }
    if (json['rank'] != null) {
      rank = new List<Rank>();
      json['rank'].forEach((v) {
        rank.add(new Rank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.floor != null) {
      data['floor'] = this.floor.map((v) => v.toJson()).toList();
    }
    if (this.rank != null) {
      data['rank'] = this.rank.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String id;
  String title;
  String image;

  Banner({this.id, this.title, this.image});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}

class Floor {
  String title;
  String summary;
  List<FloorLists> floorLists;

  Floor({this.title, this.summary, this.floorLists});

  Floor.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    summary = json['summary'];
    if (json['floor_lists'] != null) {
      floorLists = new List<FloorLists>();
      json['floor_lists'].forEach((v) {
        floorLists.add(new FloorLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['summary'] = this.summary;
    if (this.floorLists != null) {
      data['floor_lists'] = this.floorLists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FloorLists {
  String desc;
  String title;
  String id;
  String score;
  String chapter;
  String image;

  FloorLists({this.desc, this.title, this.id, this.score, this.chapter, this.image});

  FloorLists.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    title = json['title'];
    id = json['id'];
    score = json['score'];
    chapter = json['chapter'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['title'] = this.title;
    data['id'] = this.id;
    data['score'] = this.score;
    data['chapter'] = this.chapter;
    data['image'] = this.image;
    return data;
  }
}

class Rank {
  String title;
  List<RankLists> rankLists;

  Rank({this.title, this.rankLists});

  Rank.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['rank_lists'] != null) {
      rankLists = new List<RankLists>();
      json['rank_lists'].forEach((v) {
        rankLists.add(new RankLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.rankLists != null) {
      data['rank_lists'] = this.rankLists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RankLists {
  String id;
  String title;
  String remark;
  String image;

  RankLists({this.id, this.title, this.remark, this.image});

  RankLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    remark = json['remark'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['remark'] = this.remark;
    data['image'] = this.image;
    return data;
  }
}
