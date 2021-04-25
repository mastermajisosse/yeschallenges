class Truth {
  String truth;
  int accepted;
  String createdat;

  Truth({
    this.truth,
    this.accepted,
    this.createdat,
  });

  static Truth fromJson(Map<String, dynamic> json) {
    return Truth(
      truth: json['truth'],
      accepted: json['accepted'],
      createdat: json['created_at'],
    );
  }

  static Truth toJson(Map<String, dynamic> json) {
    return Truth(
      truth: json['truth'],
      accepted: json['accepted'],
      // createdat: json['created_at'],
    );
  }
}
