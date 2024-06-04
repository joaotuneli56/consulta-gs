// movie_detail_page.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:globalsolution/models/movie_detail_model.dart';
import 'package:globalsolution/models/movie_recommendations_model.dart';
import 'package:globalsolution/utils/api_services.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  ApiServices apiServices = ApiServices();

  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendationModel;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    movieRecommendationModel = apiServices.getMovieRecommendations(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: FutureBuilder<MovieDetailModel>(
        future: movieDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final movieDetail = snapshot.data!;
          return ListView(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${movieDetail.posterPath}',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movieDetail.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(movieDetail.overview),
                    SizedBox(height: 8),
                    Text('Release Date: ${movieDetail.releaseDate}'),
                    SizedBox(height: 8),
                    Text('Rating: ${movieDetail.voteAverage}'),
                  ],
                ),
              ),
              FutureBuilder<MovieRecommendationsModel>(
                future: movieRecommendationModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final recommendations = snapshot.data!.results;
                  return recommendations.isEmpty
                      ? Center(child: Text('No recommendations available'))
                      : Column(
                          children: recommendations
                              .map((recommendation) => ListTile(
                                    leading: CachedNetworkImage(
                                      imageUrl: 'https://image.tmdb.org/t/p/w500${recommendation.posterPath}',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                    title: Text(recommendation.title),
                                    subtitle: Text(recommendation.overview),
                                  ))
                              .toList(),
                        );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
