import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/now_playing/data/models/now_playing_model.dart';
import 'package:star_wars_app/features/now_playing/domain/repository/now_playing_repository.dart';
import 'package:star_wars_app/internal/helpers/api_requester.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

@Injectable(as: NowPlayingRepository)
class NowPlayingRepositoryImpl implements NowPlayingRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<NowPlayingResult> getNowPlayingMovie() async {
    try {
      Response response = await apiRequester.toGet(
        'movie/now_playing',
        params: {
          'api_key': '4400d1fd1403678e6e72c6fdc961a9e9',
        },
      );
      if (response.statusCode == 200) {
        return NowPlayingResult.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
