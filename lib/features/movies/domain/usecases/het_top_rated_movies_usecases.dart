import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
