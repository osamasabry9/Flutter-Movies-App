import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Movie>>>  call() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
