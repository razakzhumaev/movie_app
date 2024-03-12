part of 'popular_bloc.dart';

@immutable
sealed class PopularEvent {}

class GetAllPopularMovieEvent extends PopularEvent {}
