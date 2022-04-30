import 'dart:convert';

List<Movies> moviesFromJson(String str) {
  return List<Movies>.from(jsonDecode(str).map((x) => Movies.fromMap(x)));
}

class Movies {
  late String? id;
  late String? title;
  late String? description;
  late String? photo;
  late String? type;
  late bool status;
  late DateTime? releasedAt;
  late DateTime? createdAt;
  late DateTime? deletedAt;
  late List<String> categories;
  late List<String> servers;

  Movies({
    this.id,
    this.title,
    this.description,
    this.photo,
    this.type,
    this.status = false,
    this.releasedAt,
    this.createdAt,
    this.deletedAt,
    this.categories = const [],
    this.servers = const [],
  });
  factory Movies.fromMap(Map<String, dynamic> data) {
    return Movies(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      photo: data["photo"],
      type: data["type"],
      status: data["status"],
      releasedAt: data["released_at"].toDate(),
      createdAt: data["created_at"].toDate(),
      //deletedAt: data["deleted_at"].toDate(),
      categories: data["categories"] == null ? [] : List<String>.from(data["categories"].map((e) => e)),
      servers: data["servers"] == null ? [] : List<String>.from(data["servers"].map((e) => e)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "photo": photo,
      "type": type,
      "status": status,
      "released_at": releasedAt,
      "created_at": createdAt,
      "deleted_at": deletedAt,
      "categories": categories.map((e) => e).toList(),
      "servers": servers.map((e) => e).toList(),
    };
  }
}
