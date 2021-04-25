import 'dart:ffi';

class Lawkh {
  int id;
  String first;
  String second;
  int votes;
  int votes2;
  int accepted;
  String createdat;
  String updatedat;
  Lawkh({
    this.id,
    this.first,
    this.second,
    this.votes,
    this.votes2,
    this.accepted,
    this.createdat,
    this.updatedat,
  });

  static Lawkh fromJson(Map<String, dynamic> json) {
    return Lawkh(
      id: json['id'],
      first: json['first'],
      second: json['second'],
      votes: json['votes'],
      votes2: json['votes2'],
      accepted: json['accepted'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
    );
  }

  static Lawkh toJson(Map<String, dynamic> json) {
    return Lawkh(
      id: json['id'],
      first: json['first'],
      second: json['second'],
      votes: json['votes'],
      votes2: json['votes2'],
      accepted: json['accepted'],
      createdat: json['created_at'],
      updatedat: json['updated_at'],
    );
  }

  Lawkh.map(dynamic obj) {
    this.id = obj["id"];
    this.first = obj["first"];
    this.second = obj["second"];
    this.votes = obj["votes"];
    this.votes2 = obj["votes2"];
  }

  String get firstt => first;
  String get secondd => second;
  int get votess => votes;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    id = map['id'];
    first = map['first'];
    second = map['second'];
    votes = map['votes'];
    votes2 = map['votes2'];
    return map;
  }

  Lawkh.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.first = map["first"];
    this.second = map["second"];
    this.votes = map["votes"];
    this.votes2 = map["votes2"];
  }
}
