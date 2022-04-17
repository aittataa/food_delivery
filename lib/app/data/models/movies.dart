class Movie {
  late String? id;
  late String? title;
  late String? description;
  late String? photo;
  late String? type;
  late DateTime? release;
  late List<String> categories;
  late List<String> servers;

  Movie({
    this.id,
    this.title,
    this.description,
    this.photo,
    this.type,
    this.release,
    this.categories = const [],
    this.servers = const [],
  });
  factory Movie.fromMap(Map<String, dynamic> data) {
    return Movie(
      id: data["id"],
      title: data["title"],
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
      "title": title,
      "description": description,
      "photo": photo,
      "type": type,
      "release": release,
      "categories": categories.map((e) => e).toList(),
      "servers": servers.map((e) => e).toList(),
    };
  }
}
