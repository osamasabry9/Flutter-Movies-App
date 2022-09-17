import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';

import '../repository/base_movies_repository.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
