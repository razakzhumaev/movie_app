import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart';

abstract class NowPlayingRepository {
  Future<NowPlayingResult> getNowPlayingMovie();
}
