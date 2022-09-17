import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/error_exception.dart';
import 'package:movies_app/features/movies/data/datasources/remote_data_source/movies_remote_data_source.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';

import '../../../../core/error/failure.dart';

class MoviesRepository extends BaseMoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepository({required this.moviesRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await moviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await moviesRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await moviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters) async {
    final result = await moviesRemoteDataSource.getMoviesDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMoviesRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await moviesRemoteDataSource.getMoviesRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
