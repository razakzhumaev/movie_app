import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/top_rated/data/model/top_rated_model.dart';
import 'package:star_wars_app/features/top_rated/domain/repository/top_rated_repository.dart';
import 'package:star_wars_app/internal/helpers/api_requester.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

@Injectable(as: TopRatedRepository)
class TopRatedRepostoryImpl implements TopRatedRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<TopRatedResult> getAllTopRatedrMovie() async {
    try {
      Response response = await apiRequester.toGet(
        'movie/top_rated',
        params: {
          'api_key': '4400d1fd1403678e6e72c6fdc961a9e9',
        },
      );
      if (response.statusCode == 200) {
        return TopRatedResult.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
