class Bookmark {
  String? id;
  String? title;
  String? detail;

  Bookmark({this.id, this.title, this.detail});

  Bookmark.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
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
