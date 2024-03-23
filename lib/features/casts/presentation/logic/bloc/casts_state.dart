part of 'casts_bloc.dart';

@immutable
sealed class CastsState {}

final class CastsInitialState extends CastsState {}

final class CastsLoadingState extends CastsState {}

final class CastsLoadedState extends CastsState {
  final CastsResult castsResult;

  CastsLoadedState({required this.castsResult});
}

final class CastsErrorState extends CastsState {
  final CatchException error;

  CastsErrorState({required this.error});
}
