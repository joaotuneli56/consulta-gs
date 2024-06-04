// movie_detail_model.dart

class MovieDetailModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  MovieDetailModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
