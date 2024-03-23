part of 'upcoming_bloc.dart';

@immutable
sealed class UpcomingState {}

final class UpcomingInitialState extends UpcomingState {}

final class UpcomingLoadingState extends UpcomingState {}

final class UpcomingLoadedState extends UpcomingState {
  final UpComingResult upComingResult;

  UpcomingLoadedState({required this.upComingResult});
}

final class UpcomingErrorState extends UpcomingState {
  final CatchException error;

  UpcomingErrorState({required this.error});
}
