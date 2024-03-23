class CastsResult {
  final int? id;
  final List<CastModel>? cast;
  final List<CastModel>? crew;

  CastsResult({
    this.id,
    this.cast,
    this.crew,
  });

  factory CastsResult.fromJson(Map<String, dynamic> json) => CastsResult(
        id: json["id"],
        cast: json["cast"] == null
            ? []
            : List<CastModel>.from(json["cast"]!.map((x) => CastModel.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<CastModel>.from(json["crew"]!.map((x) => CastModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": cast == null
            ? []
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? []
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}

class CastModel {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  CastModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}
