class Kitab {
  String? id;
  String? title;
  String? detail;

  Kitab({this.id, this.title, this.detail});

  Kitab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['detail'] = detail;
    return data;
  }
}
