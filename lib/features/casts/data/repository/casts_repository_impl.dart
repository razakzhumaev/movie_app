import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/casts/data/model/casts_model.dart';
import 'package:star_wars_app/features/casts/domain/repository/casts_repository.dart';
import 'package:star_wars_app/internal/helpers/api_requester.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

@Injectable(as: CastsRepository)
class NowPlayingRepositoryImpl implements CastsRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<CastsResult> getMovieCastsById(int id) async {
    try {
      Response response = await apiRequester.toGet(
        'movie/$id/credits',
        params: {
          "api_key": "4400d1fd1403678e6e72c6fdc961a9e9",
        },
      );
      if (response.statusCode == 200) {
        return CastsResult.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
