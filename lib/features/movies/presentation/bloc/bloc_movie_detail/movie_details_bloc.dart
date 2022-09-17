import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/entities/recommendation.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;
  MovieDetailsBloc({
    required this.getMovieDetailUseCase,
    required this.getMovieRecommendationUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMoviesRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            movieDetailState: RequestState.loaded, movieDetail: r)));
  }

  FutureOr<void> _getMoviesRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieRecommendationUseCase(
        RecommendationParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              moviesRecommendationState: RequestState.error,
              moviesRecommendationMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            moviesRecommendationState: RequestState.loaded,
            moviesRecommendation: r)));
  }
}
