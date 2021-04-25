class Dares {
  String dare;
  int accepted;
  String createdat;

  Dares({
    this.dare,
    this.accepted,
    this.createdat,
  });

  static Dares fromJson(Map<String, dynamic> json) {
    return Dares(
      dare: json['dare'],
      accepted: json['accepted'],
      // createdat: json['created_at'],
    );
  }

  static Dares toJson(Map<String, dynamic> json) {
    return Dares(
      dare: json['dare'],
      accepted: json['accepted'],
      // createdat: json['created_at'],
    );
  }
}
