import 'package:movies_app/features/movies/data/models/genres_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.runTime,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      backdropPath: json["backdrop_path"],
      title: json["title"],
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"],
      runTime: json["runtime"],
      genres: List<GenresModel>.from(
          json["genres"].map((x) => GenresModel.fromJson(x))),
    );
  }
}
