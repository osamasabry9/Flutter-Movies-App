import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../entities/recommendation.dart';
import '../repository/base_movies_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase< List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationUseCase({required this.baseMoviesRepository});

  @override
   Future<Either<Failure, List<Recommendation>>>  call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getMoviesRecommendation(parameters);
  }
}


class RecommendationParameters extends Equatable {
  final int movieId;

  const RecommendationParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}


