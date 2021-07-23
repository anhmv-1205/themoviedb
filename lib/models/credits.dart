import 'package:themoviedb/models/cast.dart';
import 'package:themoviedb/models/crew.dart';

class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({this.cast, this.crew});

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(new Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast?.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
