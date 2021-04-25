class Games {
  int id;
  String name;
  String icon;
  String link;
  int downloads;
  String lang;

  Games({
    this.id,
    this.name,
    this.icon,
    this.link,
    this.downloads,
    this.lang,
  });

  static Games fromJson(Map<String, dynamic> json) {
    return Games(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      link: json['link'],
      downloads: json['downloads'],
      lang: json['lang'],
    );
  }

  static Games toJson(Map<String, dynamic> json) {
    return Games(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      link: json['link'],
      downloads: json['downloads'],
      lang: json['lang'],
    );
  }
}
