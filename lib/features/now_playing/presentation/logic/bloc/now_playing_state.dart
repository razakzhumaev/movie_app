import 'package:meta/meta.dart';
import 'package:star_wars_app/features/casts/data/model/casts_model.dart';
import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitialState extends NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState {}

class NowPlayingLoadedState extends NowPlayingState {
  final NowPlayingResult nowPlayingResult;

  NowPlayingLoadedState({required this.nowPlayingResult});
}

class NowPlayingErrorState extends NowPlayingState {
  final CatchException error;

  NowPlayingErrorState({required this.error});
}
