import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart';
import 'package:star_wars_app/features/now_playing/domain/repository/now_playing_repository.dart';


class NowPlayingUseCase {
  final NowPlayingRepository nowPlayingRepository;

  NowPlayingUseCase({required this.nowPlayingRepository});

  Future<NowPlayingResult> getNowPlayingMovie() async =>
      await nowPlayingRepository.getNowPlayingMovie();
}
