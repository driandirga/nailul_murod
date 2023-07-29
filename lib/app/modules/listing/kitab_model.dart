class Kitab {
  String? id;
  String? title;
  String? detail;
  String? translate;

  Kitab({this.id, this.title, this.detail, this.translate});

  Kitab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    translate = json['translate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['detail'] = detail;
    data['translate'] = translate;
    return data;
  }
}
