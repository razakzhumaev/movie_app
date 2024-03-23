import 'package:star_wars_app/features/top_rated/data/model/top_rated_model.dart';

abstract class TopRatedRepository {
  Future<TopRatedResult> getAllTopRatedrMovie();
}
