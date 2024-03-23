import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/popular/data/model/popular_model.dart';
import 'package:star_wars_app/features/popular/domain/repository/popular_repository.dart';
import 'package:star_wars_app/internal/helpers/api_requester.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

@Injectable(as: PopularRepository)
class PopularRepositoryImpl implements PopularRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<PopularResult> getPopularMovie() async {
    try {
      Response response = await apiRequester.toGet(
        'movie/popular',
        params: {
          'api_key': '4400d1fd1403678e6e72c6fdc961a9e9',
        },
      );
      if (response.statusCode == 200) {
        return PopularResult.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
