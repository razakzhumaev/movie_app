part of 'top_rated_bloc.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitialState extends TopRatedState {}

final class TopRatedLoadingState extends TopRatedState {}

final class TopRatedLoadedState extends TopRatedState {
  final TopRatedResult topRatedResult;

  TopRatedLoadedState({required this.topRatedResult});
}

final class TopRatedErrorState extends TopRatedState {
  final CatchException error;

  TopRatedErrorState({required this.error});
}
