// To parse this JSON data, do
//
//     final myWatchlistModel = myWatchlistModelFromJson(jsonString);

import 'dart:convert';

List<MyWatchlistModel> myWatchlistModelFromJson(String str) => List<MyWatchlistModel>.from(json.decode(str).map((x) => MyWatchlistModel.fromJson(x)));

String myWatchlistModelToJson(List<MyWatchlistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlistModel {
    MyWatchlistModel({
        required this.pk,
        required this.fields,
    });

    int pk;
    Fields fields;

    factory MyWatchlistModel.fromJson(Map<String, dynamic> json) => MyWatchlistModel(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.statusWatchedFilm,
        required this.titleFilm,
        required this.ratingFilm,
        required this.releaseDateFilm,
        required this.reviewFilm,
    });

    bool statusWatchedFilm;
    String titleFilm;
    String ratingFilm;
    String releaseDateFilm;
    String reviewFilm;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        statusWatchedFilm: json["status_watched_film"],
        titleFilm: json["title_film"],
        ratingFilm: json["rating_film"],
        releaseDateFilm: json["release_date_film"],
        reviewFilm: json["review_film"],
    );

    Map<String, dynamic> toJson() => {
        "status_watched_film": statusWatchedFilm,
        "title_film": titleFilm,
        "rating_film": ratingFilm,
        "release_date_film": releaseDateFilm,
        "review_film": reviewFilm,
    };
}
