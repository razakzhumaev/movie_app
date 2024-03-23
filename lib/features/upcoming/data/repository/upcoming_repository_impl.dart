import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:star_wars_app/features/upcoming/data/model/upcoming_model.dart';
import 'package:star_wars_app/features/upcoming/domain/repository/upcomint_repository.dart';
import 'package:star_wars_app/internal/helpers/api_requester.dart';
import 'package:star_wars_app/internal/helpers/catch_exception.dart';

@Injectable(as: UpComingRepository)
class UpComingRepositoryImpl implements UpComingRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<UpComingResult> getAllUpComingMovies() async {
    try {
      Response response = await apiRequester.toGet(
        'movie/upcoming',
        params: {
          "api_key": '4400d1fd1403678e6e72c6fdc961a9e9',
        },
      );
      if (response.statusCode == 200) {
        return UpComingResult.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
