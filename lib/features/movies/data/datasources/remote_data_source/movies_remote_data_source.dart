import 'package:dio/dio.dart';
import 'package:movies_app/core/error/error_exception.dart';
import 'package:movies_app/core/error/error_message_model.dart';
import 'package:movies_app/core/utils/api_constance.dart';
import 'package:movies_app/features/movies/data/models/movie_details_model.dart';
import 'package:movies_app/features/movies/data/models/recommendation_model.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import '../../models/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailParameters parameters);
  Future<List<RecommendationModel>> getMoviesRecommendation( RecommendationParameters parameters);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(
      MovieDetailParameters parameters) async {
    final response = await Dio().get(ApiConstance.movieDetailPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<RecommendationModel>> getMoviesRecommendation(RecommendationParameters parameters) async{
       final response = await Dio().get(ApiConstance.moviesRecommendationsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
