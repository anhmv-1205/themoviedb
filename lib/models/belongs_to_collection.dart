class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    // if (json == null) return null;
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  static BelongsToCollection? belongsToCollectionNullable(
      Map<String, dynamic>? json) {
    if (json == null) return null;
    return BelongsToCollection.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo_path'] = this.posterPath;
    data['origin_country'] = this.backdropPath;
    return data;
  }
}
