import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/features/movies/domain/usecases/get_top_rated_movies_usecases.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../../domain/usecases/get_now_playing_movies_usecases.dart';
import 'movies_event.dart';
import 'movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCases getPopularMoviesUseCases;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
      {required this.getNowPlayingMoviesUseCase,
      required this.getPopularMoviesUseCases,
      required this.getTopRatedMoviesUseCase})
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    //emit(const MoviesState(nowPlayingState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCases(const NoParameters());
    //emit(const MoviesState(popularState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    //emit(const MoviesState(topRatedState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: r)));
  }
}
