part of 'popular_bloc.dart';

@immutable
sealed class PopularState {}

final class PopularInitialState extends PopularState {}

final class PopularLoadingState extends PopularState {}

final class PopularLoadedState extends PopularState {
  final PopularResult popularResult;

  PopularLoadedState({required this.popularResult});
}

final class PopularErrorState extends PopularState {
  final CatchException error;

  PopularErrorState({required this.error});
}
