import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
