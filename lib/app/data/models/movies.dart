import 'dart:convert';

List<Movies> moviesFromJson(String str) {
  return List<Movies>.from(jsonDecode(str).map((x) => Movies.fromMap(x)));
}

class Movies {
  late String? id;
  late String? name;
  late String? description;
  late String? photo;
  late String? type;
  late DateTime? release;
  late List<String> categories;
  late List<String> servers;

  Movies({
    this.id,
    this.name,
    this.description,
    this.photo,
    this.type,
    this.release,
    this.categories = const [],
    this.servers = const [],
  });
  factory Movies.fromMap(Map<String, dynamic> data) {
    return Movies(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      photo: data["photo"],
      type: data["type"],
      release: data["release"].toDate(),
      categories: data["categories"] == null ? [] : List<String>.from(data["categories"].map((e) => e)),
      servers: data["servers"] == null ? [] : List<String>.from(data["servers"].map((e) => e)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "photo": photo,
      "type": type,
      "release": release,
      "categories": categories.map((e) => e).toList(),
      "servers": servers.map((e) => e).toList(),
    };
  }
}
