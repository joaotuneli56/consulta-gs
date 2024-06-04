// movie_recommendations_model.dart

class MovieRecommendation {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieRecommendation({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory MovieRecommendation.fromJson(Map<String, dynamic> json) {
    return MovieRecommendation(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}

class MovieRecommendationsModel {
  final List<MovieRecommendation> results;

  MovieRecommendationsModel({required this.results});

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<MovieRecommendation> recommendationsList = list.map((i) => MovieRecommendation.fromJson(i)).toList();

    return MovieRecommendationsModel(results: recommendationsList);
  }
}
