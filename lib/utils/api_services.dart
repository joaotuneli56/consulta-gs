// api_services.dart

import 'dart:convert';
import 'package:globalsolution/models/movie_detail_model.dart';
import 'package:globalsolution/models/movie_recommendations_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String apiKey = 'YOUR_API_KEY';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey'),
    );
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/$movieId/recommendations?api_key=$apiKey'),
    );
    if (response.statusCode == 200) {
      return MovieRecommendationsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie recommendations');
    }
  }
}
