part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailsMessage;
  final List<Recommendation> moviesRecommendation;
  final RequestState moviesRecommendationState;
  final String moviesRecommendationMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.moviesRecommendation = const [],
    this.moviesRecommendationState = RequestState.loading,
    this.moviesRecommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailsMessage,
    List<Recommendation>? moviesRecommendation,
    RequestState? moviesRecommendationState,
    String? moviesRecommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      moviesRecommendation: moviesRecommendation ?? this.moviesRecommendation,
      moviesRecommendationState:
          moviesRecommendationState ?? this.moviesRecommendationState,
      moviesRecommendationMessage:
          moviesRecommendationMessage ?? this.moviesRecommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailState,
        movieDetailsMessage,
        moviesRecommendation,
        moviesRecommendationState,
        moviesRecommendationMessage,
      ];
}
