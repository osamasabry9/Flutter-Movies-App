import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getMoviesRecommendation(
      RecommendationParameters parameters);
}
