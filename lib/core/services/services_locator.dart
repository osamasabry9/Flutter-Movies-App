import 'package:get_it/get_it.dart';
import 'package:movies_app/features/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/features/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/features/movies/domain/usecases/het_top_rated_movies_usecases.dart';

import '../../features/movies/data/datasources/remote_data_source/movies_remote_data_source.dart';
import '../../features/movies/data/repository/movies_repository.dart';
import '../../features/movies/domain/repository/base_movies_repository.dart';
import '../../features/movies/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(
          getNowPlayingMoviesUseCase: sl(),
          getPopularMoviesUseCases: sl(),
          getTopRatedMoviesUseCase: sl(),
        ));

    /*  
     MoviesRemoteDataSource moviesRemoteDataSource =
            MoviesRemoteDataSourceImpl();
        BaseMoviesRepository baseMoviesRepository =
            MoviesRepository(moviesRemoteDataSource: moviesRemoteDataSource);
    */
    /// Use Case

    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCases(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMoviesRepository: sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(moviesRemoteDataSource: sl()));

    ///  Data Source
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
  }
}
